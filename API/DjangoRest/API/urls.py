from django.urls import path

from .views import (
    TokenAPI, # JWT 
    LogoutView,
)

app_name = "API"

urlpatterns = [
    path("token/", TokenAPI.as_view(), name="Token"),
    ## API 
    # path('register', RegisterView.as_view()),
    # path('login', LoginView.as_view()),
    # path('user', UserView.as_view()),
    path('logout/', LogoutView.as_view(), name="LogOut"),
]