from django.urls import path

from . import views

urlpatterns = [
    path('description', views.description, name='description'),
    path('', views.index, name='index'),
]
