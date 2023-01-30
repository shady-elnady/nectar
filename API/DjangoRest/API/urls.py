from django.urls import path

from .views import (
    LogInApi, # JWT 
    ## API
    RegisterView, LoginView,
    UserView, LogoutView,
)

app_name = "API"

urlpatterns = [
    path("logInRest/", LogInApi.as_view(), name="LogIn"),
    ## API 
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('user', UserView.as_view()),
    path('logout', LogoutView.as_view()),

]