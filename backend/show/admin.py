from django.contrib import admin
from show.models import Movie, Series, Genre
# Register your models here.

class MoveAdmin(admin.ModelAdmin):
     list_display = ('title','description',)

class SeriesAdmin(admin.ModelAdmin):
     list_display = ('title','description', )
    
    

admin.site.register(Movie, MoveAdmin)
admin.site.register(Series, SeriesAdmin)
admin.site.register(Genre)

