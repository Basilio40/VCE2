from django.shortcuts import render
from .models import EPS,Soldadores
from django.contrib.auth import authenticate, login

# Create your views here.


def base(request):
    return render(request,'core/base.html')

def home(request):
    eps = EPS.objects.all()
    soldador = Soldadores.objects.all()
    data = {
        'eps' : eps,
        'soldador' : soldador

    }
    return render(request, 'core/home.html',data)

def eps(request):
    eps = EPS.objects.all()
    soldador = Soldadores.objects.all()
    data = {
        'eps' : eps,
        'soldador' : soldador

    }
    return render(request, 'core/eps.html',data)

def soldadores(request):
    soldadores = Soldadores.objects.all()
    data = {
        'soldadores' : soldadores
    }

    return render(request,'core/soldadores.html',data)