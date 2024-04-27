from django.urls import path, include

from rest_framework.routers import DefaultRouter
from show.api.views import MovieShow, HomeViewSet, MovieDetailShow, SeriesDetailsShow, SeriesShow, GenreShow, TopRatedMoviesAPIView, TopRatedSeriesAPIView, MovieShowFilterGenre, SeriesShowFilterGenre, MovieCreateAPIView

router = DefaultRouter()
router.register(r'show', MovieShow, basename='all-shows')
router.register(r'movie-filter-genre', MovieShowFilterGenre, basename='movie_filter_genre')
router.register(r'series-filter-genre', SeriesShowFilterGenre, basename='series_filter_genre')
# router.register(r'tv-show', SeriesShow, basename='all-series')
router.register(r'genre', GenreShow, basename='all-genres')
router.register(r'', HomeViewSet, basename='home')

urlpatterns = [
    path('movies-create', MovieCreateAPIView.as_view(), name='movie-create'),
    path('', include(router.urls)),
    path('show/detail/<int:pk>', MovieDetailShow.as_view(), name='movie_detail'),
    path('tv-show/', SeriesShow.as_view(), name='series'),
    path('tv-show/detail/<int:pk>', SeriesDetailsShow.as_view(), name='series_detail'),
    path('top-rated/movies', TopRatedMoviesAPIView.as_view(), name='top_rated_movie'),
    path('top-rated/series', TopRatedSeriesAPIView.as_view(), name='top_rated_series'),
]
