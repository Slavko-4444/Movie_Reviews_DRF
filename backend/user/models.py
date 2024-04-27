from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=50, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    registered_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.email


