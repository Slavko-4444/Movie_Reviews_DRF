from django.urls import path
from .views import CommentMVVS, CommentSEVS
urlpatterns = [
    path('s/<int:series_id>/list', CommentSEVS.as_view({'get': 'list', 'post': 'create'}), name='commentSE-v'),
    path('m/<int:movie_id>/list', CommentMVVS.as_view({'get': 'list', 'post': 'create'}), name='commentMV-v'),
]
