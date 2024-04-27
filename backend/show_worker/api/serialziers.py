from django.db.models import Avg
from rest_framework import serializers
from show_worker.models import Director, Actor

from show.models import Movie, Series

from favorite.models import RatingSE, RatingMV


class MovieListingField(serializers.ModelSerializer):
    avg_rating = serializers.SerializerMethodField()

    class Meta:
        model = Movie
        fields = ['id', 'title', 'avg_rating', 'photo_url']

    def get_avg_rating(self, movie):
        avg_rating = RatingMV.objects.filter(movie=movie).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0


class SeriesListingField(serializers.ModelSerializer):
    avg_rating = serializers.SerializerMethodField()

    class Meta:
        model = Series
        fields = ['id', 'title', 'avg_rating', 'photo_url']

    def get_avg_rating(self, series):
        avg_rating = RatingSE.objects.filter(series=series).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0


class DirectorSerializer(serializers.ModelSerializer):
    movies = MovieListingField(many=True, read_only=True)
    series = SeriesListingField(many=True, read_only=True)

    class Meta:
        model = Director
        fields = "__all__"


# Added by nikola


class ShortInfoDirectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Director
        fields = ('id', 'first_name', 'last_name')


class ShortInfoActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = ('id', 'first_name', 'last_name')


class ActorSerializer(serializers.ModelSerializer):
    movies = MovieListingField(many=True, read_only=True)
    series = SeriesListingField(many=True, read_only=True)

    class Meta:
        model = Actor
        fields = '__all__'
