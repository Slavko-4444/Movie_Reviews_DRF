from django.shortcuts import render
from rest_framework import viewsets, generics, status, filters, views
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .serialziers import DirectorSerializer, ActorSerializer, ShortInfoActorSerializer, ShortInfoDirectorSerializer
from .SearchSerializers import ShortInfoMovieSerializer, ShortInfoSeriesSerializer
from .permissions import WorkerListPermission
from show_worker.models import Director, Actor
from show.models import Movie, Series


# Create your views here.
class DirectorGVS(generics.ListCreateAPIView):
    serializer_class = DirectorSerializer
    queryset = Director.objects.all()
    permission_classes = [WorkerListPermission]
    filter_backends = [filters.SearchFilter]
    search_fields = ['last_name', 'first_name']


class DetailsDirectorView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Director.objects.all()
    serializer_class = DirectorSerializer

    permission_classes = [WorkerListPermission]

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({"message": 'Delete successfully'}, status=status.HTTP_200_OK)


def call_retrive(obj):
    pass


class ActorGVS(generics.ListCreateAPIView):
    serializer_class = ActorSerializer
    queryset = Actor.objects.all()
    permission_classes = [WorkerListPermission]
    filter_backends = [filters.SearchFilter]
    search_fields = ['last_name', 'first_name']


class DetailsActorView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ActorSerializer
    queryset = Actor.objects.all()
    permission_classes = [WorkerListPermission]




class SearchAll(views.APIView):
    def get(self, request):
        search = request.query_params.get('search')
        director_results = Director.objects.filter(first_name__icontains=search) | Director.objects.filter(
            last_name__icontains=search)
        actor_results = Actor.objects.filter(first_name__icontains=search) | Actor.objects.filter(
            last_name__icontains=search)
        movie_results = Movie.objects.filter(title__icontains=search)
        series_results = Series.objects.filter(title__icontains=search)

        movie_serializer = ShortInfoMovieSerializer(movie_results, many=True)
        series_serializer = ShortInfoSeriesSerializer(series_results, many=True)
        director_serializer = ShortInfoDirectorSerializer(director_results, many=True)
        actor_serializer = ShortInfoActorSerializer(actor_results, many=True)

        results = {
            'movies': movie_serializer.data,
            'series': series_serializer.data,
            'directors': director_serializer.data,
            'actors': actor_serializer.data,

        }

        return Response(results)
