from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import View, CreateView
from django.urls import reverse_lazy
from django.forms import modelformset_factory
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required, permission_required



# Create your views here.


app_name= "Nectar"


def home(req):    
    return render(req, f"{app_name}/home.html" )


def about(req):
    return render(req, f"{app_name}/about.html" )


def contact(req):
    return render(req, f"{app_name}/contact.html" )
