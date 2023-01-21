from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login as auth_login, logout, authenticate
from django.conf import settings
from django.urls import reverse_lazy, reverse

from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.forms import UserCreationForm
from django.views.generic.edit import CreateView, UpdateView

from rest_framework_simplejwt.tokens import RefreshToken
from .Serializer import LogInSerialzer

from rest_framework.views import APIView
from rest_framework.response import Response
from .models import User, Profile
from .forms import RegistrationForm, SignUpForm


# Create your views here.


class RegistrationView(CreateView):
    template_name = 'registration/register.html'
    form_class = RegistrationForm

    def get_context_data(self, *args, **kwargs):
        context = super(RegistrationView, self).get_context_data(*args, **kwargs)
        context['next'] = self.request.GET.get('next')
        return context

    def get_success_url(self):
        next_url = self.request.POST.get('next')
        success_url = reverse('login')
        if next_url:
            success_url += '?next={}'.format(next_url)

        return success_url


class ProfileView(UpdateView):
    model = Profile
    fields = "__all__"
    template_name = 'registration/profile.html'

    def get_success_url(self):
        return reverse('index')

    def get_object(self):
        return self.request.user


class Signup(SuccessMessageMixin, CreateView):
    form = UserCreationForm
    fields = '__all__'
    model = User
    template_name = 'registration/signup.html'
    # success_url = reverse_lazy('glazes:home page')


def signUp(req):
    if req.method == "POST":
        form = SignUpForm(req.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password1"]
            user = authenticate(username=username, password=password)
            auth_login(req, user)
            return redirect(settings.LOGIN_REDIRECT_URL)

    else:
        form = SignUpForm()

    context = {
        "form": form,
    }

    return render(req, "registration/signUp.html", context=context)

## Rest FramWork

class LogInApi(APIView):
    def post(self, request):
        try:
            data= request.data
            serialzer = LogInSerialzer(data= data)
            if serialzer.is_valid():
                email = serialzer.data["email"]
                password = serialzer.data["password"]
                user = authenticate(email= email, password= password) 
                if user is None:
                    return Response({
                        "status": 400,
                        "message": "Some Thing went Wrong",
                        "data": serialzer.errors,
                    })
                if user.is_verified is False:
                    return Response({
                        "status": 400,
                        "message": "Your Account is Not Verified Yeit",
                        "data": {},
                    })

                refresh = RefreshToken.for_user(user)
                return {
                    'refresh': str(refresh),
                    'access': str(refresh.access_token),
                }
            
            return Response({
                "status": 400,
                "message": "Some Thing went Wrong",
                "data": serialzer.errors,
            })
        
        except Exception as e:
            print(e)