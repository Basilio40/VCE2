from core.models import Soldadores
from django.urls import path
from .views import home,eps,soldadores

urlpatterns = [
    path('', home, name='home'),
    path('eps/',eps,name='eps'),
    path('soldadores/',soldadores,name='soldadores')
]