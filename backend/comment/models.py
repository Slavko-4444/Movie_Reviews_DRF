from django.contrib.auth.models import User
from django.db import models

from show.models import Series, Movie


# Create your models here.
class CommentSE(models.Model):
    content = models.TextField(max_length=500)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='commentSE')
    series = models.ForeignKey(Series, on_delete=models.CASCADE, related_name='commentSE')
    created_at = models.DateTimeField(auto_now_add=True)


class CommentMV(models.Model):
    content = models.TextField(max_length=500, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='commentMV')
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='commentMV')
    created_at = models.DateTimeField(auto_now_add=True)
