from django.db import models

from show_worker.models import Director, Actor


# Create your models here.

class Genre(models.Model):
    genre_name = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.genre_name



class Movie(models.Model):
    title = models.CharField(max_length=100)
    photo_url = models.ImageField(upload_to='images')
    director = models.ForeignKey(Director, related_name="movies", on_delete=models.SET_NULL, null=True)
    actor = models.ManyToManyField(Actor, related_name='movies')
    movie_length = models.IntegerField()
    date_of_release = models.DateField(null=True)
    description = models.TextField(max_length=300)
    genre = models.ManyToManyField(Genre, related_name='movies')
    is_new = models.BooleanField(default=True)

    def __str__(self):
        return self.title + ' - ' + str(self.date_of_release) + ';' + str(self.id)


class Series(models.Model):
    title = models.CharField(max_length=100)
    photo_url = models.ImageField(upload_to='images')
    director = models.ForeignKey(
        Director, related_name="series", on_delete=models.SET_NULL, null=True)
    actor = models.ManyToManyField(Actor, related_name='series')
    date_of_release = models.DateField(null=True)
    description = models.TextField(max_length=300)
    genre = models.ManyToManyField(Genre, related_name='series')
    is_new = models.BooleanField(default=True)


    def __str__(self):
        return self.title + ' - ' + str(self.date_of_release)  + ';' + str(self.id)
