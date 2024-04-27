from django.contrib.auth.models import User
from django.db import models
from show.models import Movie, Series


# Create your models here.
class Favorite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='favorites')
    created_at = models.DateTimeField(auto_now_add=True)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='favorites', null=True)
    series = models.ForeignKey(Series, on_delete=models.CASCADE, related_name='favorites', null=True)

    def __str__(self):
        if self.movie:
            return f'{self.user} likes {self.movie}'
        return f'{self.user} likes {self.series}'


class RatingSE(models.Model):
    rating = models.IntegerField(default=0)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ratingsSE')
    series = models.ForeignKey(Series, on_delete=models.CASCADE, related_name='ratingsSE')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return 'Series' + " " + str(self.rating)


class RatingMV(models.Model):
    rating = models.IntegerField(default=0)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ratingsMV')
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='ratingsMV')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return 'Movie' + " " + str(self.rating)
