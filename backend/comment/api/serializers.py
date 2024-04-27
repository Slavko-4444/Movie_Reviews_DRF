from rest_framework import serializers
from django.contrib.auth.models import User

from comment.models import CommentSE, CommentMV

from show.models import Movie, Series


class UserSpecSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']


class CommentSESerializer(serializers.ModelSerializer):
    user = UserSpecSerializer(read_only=True)
    user_id = serializers.PrimaryKeyRelatedField(write_only=True, queryset=User.objects.all())
    series = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = CommentSE
        fields = '__all__'

    def validate(self, data):

        request = self.context.get('request')
        series_id = int(request.resolver_match.kwargs.get('series_id'))
        user_id = data.get('user_id').id
        content = data.get('content')
        data['user_id'] = user_id
        if not content:
            raise serializers.ValidationError("Missing content!")
        if not series_id:
            raise serializers.ValidationError("Missing series id!")

        if not Movie.objects.filter(pk=series_id).exists():
            raise serializers.ValidationError("Unknown series!")

        data["series"] = Series.objects.get(pk=series_id)

        return data


class CommentMVSerializer(serializers.ModelSerializer):
    user = UserSpecSerializer(read_only=True)
    user_id = serializers.PrimaryKeyRelatedField(write_only=True, queryset=User.objects.all())
    movie = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = CommentMV
        fields = '__all__'

    def validate(self, data):

        request = self.context.get('request')
        movie_id = int(request.resolver_match.kwargs.get('movie_id'))
        user_id = data.get('user_id').id
        content = data.get('content')
        data['user_id'] = user_id
        if not content:
            raise serializers.ValidationError("Missing content!")
        if not movie_id:
            raise serializers.ValidationError("Missing movie id!")

        if not Movie.objects.filter(pk=movie_id).exists():
            raise serializers.ValidationError("Unknown movie!")

        data["movie"] = Movie.objects.get(pk=movie_id)

        return data
