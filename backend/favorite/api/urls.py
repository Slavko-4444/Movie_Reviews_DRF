from django.urls import path
from .views import FavoriteVS, DetailsFavoriteView, RatingMVVS, RatingSEVS

urlpatterns = [
    path('<int:user_id>/list', FavoriteVS.as_view({'get': 'list', 'post': 'create'}), name='favorite-v'),
    path('detail/<int:pk>', DetailsFavoriteView.as_view(), name='favorite-details'),
    path('rating-s/<int:series_id>/list', RatingSEVS.as_view({'get': 'list', 'post': 'create'}), name='ratingSE-v'),
    path('rating-m/<int:movie_id>/list', RatingMVVS.as_view({'get': 'list', 'post': 'create'}), name='ratingMV-v'),

]
