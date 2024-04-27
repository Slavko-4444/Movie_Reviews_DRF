from django.contrib import admin
from .models import Favorite, RatingSE, RatingMV

# Register your models here.
admin.site.register(Favorite)
admin.site.register(RatingSE)
admin.site.register(RatingMV)
