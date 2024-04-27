from rest_framework import serializers
from show.models import Series, Movie


class ShortInfoMovieSerializer(serializers.ModelSerializer):
    genre = serializers.StringRelatedField(many=True)
    class Meta:
        model = Movie
        fields = ('id', 'title', 'description', 'date_of_release', 'genre')


class ShortInfoSeriesSerializer(serializers.ModelSerializer):
    genre = serializers.StringRelatedField(many=True)

    class Meta:
        model = Series
        fields = ('id', 'title', 'description', 'date_of_release', 'genre')
