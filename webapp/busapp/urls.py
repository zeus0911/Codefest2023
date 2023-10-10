from django.urls import path,include
from .views import *

urlpatterns = [
    path('project',click_photo_enter, name='project' ),
    path('video_feed', video_feed, name='video_feed'),
    path('recognize', recognize, name='recognize'),
    path('bus', bus, name="bus"),
    path('dashboard', dashboard, name="dashboard"),
    path('yes', yes, name="yes"),
]