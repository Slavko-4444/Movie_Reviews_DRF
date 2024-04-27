from django.db.models import Avg
from favorite.models import Favorite, RatingSE, RatingMV
from rest_framework import serializers
from show.models import Movie, Series
from django.contrib.auth.models import User
from show_worker.api.serialziers import ShortInfoDirectorSerializer

from comment.api.serializers import UserSpecSerializer


class MovieSpecSerializer(serializers.ModelSerializer):
    genre = serializers.StringRelatedField(many=True, read_only=True)
    director = ShortInfoDirectorSerializer(read_only=True)
    avg_rating = serializers.SerializerMethodField()
    class Meta:
        model = Movie
        exclude = ['is_new', 'actor']

    def get_avg_rating(self, movie):
        avg_rating = RatingMV.objects.filter(movie=movie).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0


class SeriesSpecSerializer(serializers.ModelSerializer):
    genre = serializers.StringRelatedField(many=True, read_only=True)
    director = ShortInfoDirectorSerializer(read_only=True)
    avg_rating = serializers.SerializerMethodField()

    class Meta:
        model = Series
        exclude = ['is_new', 'actor']

    def get_avg_rating(self, series):
        avg_rating = RatingSE.objects.filter(series=series).aggregate(avg_rating=Avg('rating', default=0))['avg_rating']
        return avg_rating or 0

class FavoriteSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)
    movie_id = serializers.IntegerField(write_only=True, allow_null=True)
    movie = MovieSpecSerializer(read_only=True)
    series_id = serializers.IntegerField(write_only=True, allow_null=True)
    series = SeriesSpecSerializer(read_only=True)

    class Meta:
        model = Favorite
        fields = "__all__"




    def validate(self, data):
        request = self.context.get('request')
        user_id = int(request.resolver_match.kwargs.get('user_id'))
        movie_id = data.get('movie_id')
        series_id = data.get('series_id')

        if not user_id:
            raise serializers.ValidationError("Missing user_id!")

        data["user_id"] = user_id

        if movie_id and series_id or (not movie_id and not series_id):
            raise serializers.ValidationError("Invalid Favorite item!")

        if movie_id:
            if not Movie.objects.filter(id=movie_id).exists():
                raise serializers.ValidationError("Unknown movie!")

            if Favorite.objects.filter(user_id=user_id, movie_id=movie_id).exists():
                raise serializers.ValidationError("This movie is already in the user's favorites.")
        else:
            if not Series.objects.filter(id=series_id).exists():
                raise serializers.ValidationError("Unknown series!")

            if Favorite.objects.filter(user_id=user_id, series_id=series_id).exists():
                raise serializers.ValidationError("This series is already in the user's favorites.")
        return data


class RatingSESerializer(serializers.ModelSerializer):
    series_id = serializers.PrimaryKeyRelatedField(source='series', read_only=True)

    class Meta:
        model = RatingSE
        exclude = ['series']

    def validate(self, data):

        request = self.context.get('request')
        series_id = int(request.resolver_match.kwargs.get('series_id'))
        user_id = data.get('user')
        rating = data.get('rating')

        if rating > 10 or rating < 1:
            raise serializers.ValidationError("Invalid rating!")
        if not series_id:
            raise serializers.ValidationError("Missing series id!")

        if not Series.objects.filter(pk=series_id).exists():
            raise serializers.ValidationError("Unknown series!")

        data["series"] = Series.objects.get(pk=series_id)

        if RatingSE.objects.filter(user=user_id, series=series_id).exists():
            raise serializers.ValidationError("This series is already rated by the user.")

        return data





class RatingMVSerializer(serializers.ModelSerializer):
    movie_id = serializers.PrimaryKeyRelatedField(source='movie', read_only=True)

    # movie = serializers.PrimaryKeyRelatedField(queryset=Movie.objects.all(), write_only=True)
    class Meta:
        model = RatingMV
        exclude = ['movie']

    def validate(self, data):

        request = self.context.get('request')
        movie_id = int(request.resolver_match.kwargs.get('movie_id'))
        user_id = data.get('user')
        rating = data.get('rating')

        if rating > 10 or rating < 1:
            raise serializers.ValidationError("Invalid rating!")
        if not movie_id:
            raise serializers.ValidationError("Missing movie id!")

        if not Movie.objects.filter(pk=movie_id).exists():
            raise serializers.ValidationError("Unknown movie!")

        data["movie"] = Movie.objects.get(pk=movie_id)

        if RatingMV.objects.filter(user=user_id, movie=movie_id).exists():
            raise serializers.ValidationError("This movie is already rated by the user.")

        return data
