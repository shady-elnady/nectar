from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login as auth_login, logout, authenticate, views as auth_views
from django.conf import settings
from django.urls import reverse_lazy, reverse

from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.forms import UserCreationForm
from django.views.generic.edit import CreateView, UpdateView

from .models import User, Profile
from .forms import (
    SignUpForm,
    UserLoginForm,
)


# Create your views here.


class ProfileView(UpdateView):
    model = Profile
    fields = "__all__"
    template_name = 'registration/profile.html'

    def get_success_url(self):
        return reverse('index')

    def get_object(self):
        return self.request.user


# class Signup(SuccessMessageMixin, CreateView):
#     form = UserCreationForm
#     fields = '__all__'
#     model = User
#     template_name = 'registration/login.html'
#     # success_url = reverse_lazy('glazes:home page')


# def signUp(req):
#     if req.method == "POST":
#         form = SignUpForm(req.POST)
#         if form.is_valid():
#             form.save()
#             username = form.cleaned_data["username"]
#             password = form.cleaned_data["password1"]
#             password_ = form.cleaned_data["password2"]
#             email = form.cleaned_data["email"]
#             print(username , password, password_,email )
#             user = authenticate(username=username, password=password)
#             auth_login(req, user)
#             return redirect(settings.LOGIN_REDIRECT_URL)

#     else:
#         form = SignUpForm()

#     context = {
#         "form": form,
#     }

#     return render(req, "Log/log_in_up.html", context=context)



class LogView(auth_views.LoginView):
    template_name = 'Log/log_in_up.html'
    authentication_form=UserLoginForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["sign_up_form"] = SignUpForm() 
        return context


from .forms import UserRegisterForm
from django.views.generic.edit import CreateView

class SignUpView(SuccessMessageMixin, CreateView):
  template_name = 'Log/log_in_up.html'
  success_url = reverse_lazy('login')
  form_class = UserRegisterForm
  success_message = "Your profile was created successfully"


#     def get_context_data(self, *args, **kwargs):
#         context = super(RegistrationView, self).get_context_data(*args, **kwargs)
#         context['next'] = self.request.GET.get('next')
#         return context

#     def get_success_url(self):
#         next_url = self.request.POST.get('next')
#         success_url = reverse('login')
#         if next_url:
#             success_url += '?next={}'.format(next_url)

#         return success_url