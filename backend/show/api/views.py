from ast import literal_eval

from django.db.models import Count, Avg
from rest_framework.decorators import api_view
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404
from show.models import Movie, Series, Genre
from show.api.serializers import MovieDetailSerializer, MovieSerializer, SeriesSerializer, SeriesDetailSerializer, \
    GenreSerializer, MovieCreateSerializer
from .permissions import AdminExtraPermisions
from rest_framework.response import Response
from rest_framework import viewsets, generics, filters, status

from show_worker.api.permissions import WorkerListPermission

from show_worker.models import Actor


class MovieDetailShow(generics.RetrieveUpdateDestroyAPIView):
    queryset = Movie.objects.all()
    serializer_class = MovieDetailSerializer

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(
            instance, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)

    def perform_update(self, serializer):

        movie_actor_data = self.request.data.get('actor')
        movie_director_data = self.request.data.get('director')
        movie_genre_data = self.request.data.get('genre')
        instance = serializer.instance

        if movie_director_data and isinstance(movie_director_data, dict):
            director_id = movie_director_data.get('id')

            if director_id is not None:
                instance.director_id = director_id
                instance.save()

        if movie_actor_data is not None:
            serializer.save()
            instance = serializer.instance
            ids = [act['id'] for act in movie_actor_data]
            instance.actor.set(ids)
        else:
            serializer.save()
        if movie_genre_data is not None:
            serializer.save()
            instance = serializer.instance
            ids = [gnr['id'] for gnr in movie_genre_data]
            instance.genre.set(ids)
        else:
            serializer.save()

    # permission_classes = [] Za autentikaciju


class SeriesDetailsShow(generics.RetrieveUpdateDestroyAPIView):
    queryset = Series.objects.all()
    serializer_class = SeriesDetailSerializer

    # permission_classes = [] Za autentikaciju

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(
            instance, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)

    def perform_update(self, serializer):

        movie_actor_data = self.request.data.get('actor')
        movie_director_data = self.request.data.get('director')
        movie_genre_data = self.request.data.get('genre')
        instance = serializer.instance

        if movie_director_data and isinstance(movie_director_data, dict):
            director_id = movie_director_data.get('id')

            # Assuming `director` is a ForeignKey in your model,
            # and you want to set the director by ID.

            if director_id is not None:
                # Here we assume `director` is a ForeignKey relationship.
                # Adjust this line if the relationship type or handling is different.
                instance.director_id = director_id
                instance.save()

        if movie_actor_data is not None:
            serializer.save()
            instance = serializer.instance
            ids = [act['id'] for act in movie_actor_data]
            instance.actor.set(ids)
        else:
            serializer.save()

        if movie_genre_data is not None:
            serializer.save()
            instance = serializer.instance
            ids = [gnr['id'] for gnr in movie_genre_data]
            instance.genre.set(ids)
        else:
            serializer.save()


# ---------------------------------------------------------------------------
class MovieCreateAPIView(APIView):
    def post(self, request, *args, **kwargs):
        title = request.data.get('title', None)
        image = request.data.get('photo_url', None)
        description = request.data.get('description', None)

        genre_ids_str = request.data.get('genre', '[]')
        genre = literal_eval(genre_ids_str) if genre_ids_str else []
        actor_str = request.data.get('actor', '[]')
        actor = literal_eval(actor_str) if actor_str else []


        date_of_release = request.data.get('date_of_release', None)
        if not title or not image or not description:
            return Response({"message": "Title, image, and description are required."},
                            status=status.HTTP_400_BAD_REQUEST)

        # Create the movie
        movie = Movie.objects.create(title=title, photo_url=image, description=description, date_of_release=date_of_release,
                                     director_id=request.data.get('director', None), movie_length=request.data.get('movie_length', None))

        # Add genres to the movie
        if genre:

            genres = Genre.objects.filter(id__in=genre)
            movie.genre.add(*genres)

        # Add actors to the movie
        if actor:
            actors = Actor.objects.filter(id__in=actor)
            movie.actor.add(*actors)
        movie.save()
        return Response({"message": "Movie created successfully."}, status=status.HTTP_201_CREATED)


# -----------------------------------------------------------------------------------------------


class MovieShow(viewsets.ModelViewSet):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    permission_classes = [AdminExtraPermisions]
    filter_backends = [filters.OrderingFilter, filters.SearchFilter]
    ordering_fields = ['title', 'date_of_release']
    ordering = ['-date_of_release']


class MovieShowFilterGenre(viewsets.ModelViewSet):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer

    def list(self, request, *args, **kwargs):
        genre = self.request.query_params.get('genre')
        genre = genre.split(',')
        if genre:
            queryset = self.queryset.filter(genre__genre_name__in=genre)
        else:
            queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class SeriesShow(generics.ListCreateAPIView):
    queryset = Series.objects.all()
    serializer_class = SeriesSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['title']
    permission_classes = [AdminExtraPermisions]
    filter_backends = [filters.OrderingFilter, filters.SearchFilter]
    ordering_fields = ['title', 'date_of_release']
    ordering = ['-date_of_release']


class SeriesShowFilterGenre(viewsets.ModelViewSet):
    queryset = Series.objects.all()
    serializer_class = SeriesSerializer

    def list(self, request, *args, **kwargs):
        genre = self.request.query_params.get('genre')
        genre = genre.split(',')
        if genre:
            queryset = self.queryset.filter(genre__genre_name__in=genre)
        else:
            queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class HomeViewSet(viewsets.ViewSet):
    def list(self, request):
        movie = Movie.objects.all()
        series = Series.objects.all()

        movie_data = MovieSerializer(movie, many=True)
        series_data = SeriesSerializer(series, many=True)

        # Combine the serialized data
        combined_data = {
            'movie': movie_data.data,
            'series': series_data.data
        }

        return Response(combined_data)


# Za zanrove


class GenreShow(viewsets.ModelViewSet):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer


class TopRatedMoviesAPIView(APIView):
    def get(self, request):
        top_rated_movies = Movie.objects.annotate(avg_rating=Avg('ratingsMV__rating', default=0)).order_by(
            '-avg_rating')[:10]

        serializer = MovieSerializer(top_rated_movies, many=True)

        return Response(serializer.data)


class TopRatedSeriesAPIView(APIView):
    def get(self, request):
        top_rated_series = Series.objects.annotate(avg_rating=Avg('ratingsSE__rating', default=0)).order_by(
            '-avg_rating')[:10]

        serializer = SeriesSerializer(top_rated_series, many=True)

        return Response(serializer.data)
