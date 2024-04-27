from django.utils import timezone
from rest_framework import serializers
from django.contrib.auth.models import User
import re
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView


class UserSerializer(serializers.ModelSerializer):
    password_confirm = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password_confirm', 'password']

    def validate_password(self, value):
        if len(value) < 8:
            raise serializers.ValidationError("Password must be at least 8 characters long.")

        if not re.search(r'\d', value):
            raise serializers.ValidationError("Password must contain at least one digit.")

        if not re.search(r'[!@#$%^&*(),.?":{}|<>]', value):
            raise serializers.ValidationError("Password must contain at least one special character.")

        return value

    def save(self, **kwargs):
        password = self.validated_data['password']
        password_conf = self.validated_data['password_confirm']
        if len(password) < 8:
            if password != password_conf:
                raise serializers.ValidationError({'error': 'Passwords do not match'})

        if User.objects.filter(email=self.validated_data['email']).exists():
            raise serializers.ValidationError({'error': 'Email already registered'})

        self.validated_data['registered_on'] = timezone.now()
        account = User.objects.create_user(username=self.validated_data['username'], email=self.validated_data['email'],
                                           password=self.validated_data['password']
                                           )
        account.save()
        return account


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    # def validate(self, attrs):
    #     data = super().validate(attrs)
    #     data['username'] = self.user.username
    #     data['user_id'] = self.user.id
    #     data['email'] = self.user.email
    #     return data
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token['first_name'] = user.first_name
        token['email'] = user.last_name
        token['username'] = user.username
        token['is_superuser'] = user.is_superuser
        return token

class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer
