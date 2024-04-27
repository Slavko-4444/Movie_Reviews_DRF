from django.urls import path, include

from .views import DirectorGVS, DetailsDirectorView, ActorGVS, DetailsActorView, SearchAll

urlpatterns = [
    path('search/', SearchAll.as_view(), name='SearchAll-v'),
    path('director/detail/<int:pk>', DetailsDirectorView.as_view(), name='director-details'),
    path('director/', DirectorGVS.as_view(), name='director-v'),
    path('actor/', ActorGVS.as_view(), name='actor-v'),
    path('actor/detail/<int:pk>', DetailsActorView.as_view(), name='actor-details'),
]
