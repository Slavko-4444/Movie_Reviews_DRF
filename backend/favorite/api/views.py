from rest_framework import generics, status, viewsets
from favorite.models import Favorite, RatingSE, RatingMV
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from show_worker.api.permissions import WorkerListPermission

from .serializers import FavoriteSerializer, RatingSESerializer, RatingMVSerializer


class FavoriteVS(viewsets.ModelViewSet):
    serializer_class = FavoriteSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user_id = self.kwargs.get('user_id')
        return Favorite.objects.filter(user_id=user_id)

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        favorites_data = serializer.data

        user = favorites_data[0]['user'] if len(favorites_data) else None
        if user is None:
            return Response({"error": "No favorites data found"}, status=status.HTTP_400_BAD_REQUEST)

        ratingsM = RatingMV.objects.filter(user_id=user)
        ratingsS = RatingSE.objects.filter(user_id=user)

        movies_data = [favorite.get('movie') for favorite in favorites_data if favorite.get('movie')]
        series_data = [favorite.get('series') for favorite in favorites_data if favorite.get('series')]

        # Add ratings to movies and series data
        for movie in movies_data:
            for rating in ratingsM:
                if rating.movie_id == movie['id']:
                    movie['userRate'] = rating.rating

        for series in series_data:
            for rating in ratingsS:
                if rating.series_id == series['id']:
                    series['userRate'] = rating.rating

        return Response({'movies': movies_data, 'series': series_data,})
    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


class DetailsFavoriteView(generics.RetrieveDestroyAPIView):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer
    permission_classes = [IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response({"message": 'Delete successfully'}, status=status.HTTP_200_OK)


class RatingSEVS(viewsets.ModelViewSet):
    serializer_class = RatingSESerializer

    def get_queryset(self):
        series_id = self.kwargs.get('series_id')
        return RatingSE.objects.filter(series=series_id)

    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


class RatingMVVS(viewsets.ModelViewSet):
    serializer_class = RatingMVSerializer

    def get_queryset(self):
        movie_id = self.kwargs.get('movie_id')
        return RatingMV.objects.filter(movie=movie_id)

    def perform_create(self, serializer):
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
