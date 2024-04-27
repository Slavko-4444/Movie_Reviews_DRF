from django.db import models


# Create your models here.


class Director(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    biography = models.TextField(null=True)
    nationality = models.CharField(max_length=50)
    birth_date = models.DateField(null=True)
    image = models.ImageField(upload_to='images', null=True)
    class Meta:
        verbose_name = "Director"
        verbose_name_plural = "Directors"

    def __str__(self):
        return self.first_name + " " + self.last_name


class Actor(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    biography = models.TextField(null=True)
    nationality = models.CharField(max_length=50)
    birth_date = models.DateField(null=True)
    image = models.ImageField(upload_to='images', null=True)

    class Meta:
        verbose_name = "Actor"
        verbose_name_plural = "Actors"

    def __str__(self):
        return self.first_name + " " + self.last_name