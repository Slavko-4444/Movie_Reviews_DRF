from django.db.models import Avg
from rest_framework import serializers
from show.models import Movie, Series, Genre
from show_worker.models import Actor
from show_worker.api.serialziers import ShortInfoDirectorSerializer, ShortInfoActorSerializer
from show_worker.models import Director, Actor

from favorite.models import RatingMV, RatingSE


class GenreSerializer(serializers.ModelSerializer):

    class Meta:
        model = Genre
        fields = ['id', 'genre_name']


# New Serializers

class ActorSpecSerializer(serializers.Serializer):
    class Meta:
        model = Actor
        fields = ['id']


class MovieDetailSerializer(serializers.ModelSerializer):
    director = ShortInfoDirectorSerializer(read_only=True)
    actor = ShortInfoActorSerializer(many=True,read_only=True)
    genre = GenreSerializer(many=True,read_only=True)

    class Meta:
        model = Movie
        fields = (
            "title",
            "movie_length",
            "description",
            "director",
            'photo_url',
            "actor",
            'genre',
        )

        # Handle any other nested updates here...



class SeriesDetailSerializer(serializers.ModelSerializer):

    director = ShortInfoDirectorSerializer(read_only=True)
    actor = ShortInfoActorSerializer(many=True,read_only=True)
    genre = GenreSerializer(many=True,read_only=True)


    class Meta:
        fields = (
            'title',
            'description',
            'director',
            'actor',
            'photo_url',
            'genre',

        )
        model = Series

class MovieSerializer(serializers.ModelSerializer):
    director = ShortInfoDirectorSerializer(read_only=True)
    avg_rating = serializers.SerializerMethodField()
    genre = GenreSerializer(many=True, read_only=True)

    class Meta:
        model = Movie
        fields = '__all__'


    def get_avg_rating(self, movie):
        avg_rating = RatingMV.objects.filter(movie=movie).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0


class SeriesSerializer(serializers.ModelSerializer):
    director = ShortInfoDirectorSerializer(read_only=True)
    # actor = ShortInfoActorSerializer(many=True, read_only=True)
    actor = serializers.PrimaryKeyRelatedField(
        queryset=Actor.objects.all(), many=True, write_only=True)
    director_id = serializers.IntegerField(write_only=True)
    avg_rating = serializers.SerializerMethodField()
    # actor = serializers.(write_only=True)
    genre_info = serializers.StringRelatedField(source='genre', many=True, read_only=True)
    genre = serializers.PrimaryKeyRelatedField(
        queryset=Genre.objects.all(), many=True, write_only=True)

    class Meta:
        model = Series
        fields = '__all__'

    def get_avg_rating(self, series):
        avg_rating = RatingSE.objects.filter(series=series).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0



class MovieCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Movie
        fields = "__all__"

    def create(self, validated_data):
        genre_ids = validated_data.pop('genre_ids', [])
        actor_ids = validated_data.pop('actor_ids', [])

        movie = Movie.objects.create(**validated_data)
        movie.genres.add(*genre_ids)
        movie.actors.add(*actor_ids)

        return movie
