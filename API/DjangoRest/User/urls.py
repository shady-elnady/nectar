from django.urls import path
# from django.contrib.auth import views

from .views import LogView, SignUpView
# from .forms import UserLoginForm


app_name = "User"


urlpatterns = [
    path(
        'logIn/',
        LogView.as_view(),
        name='LogIn'
    ),
    # path(
    #     'logIn/',
    #     views.LoginView.as_view(
    #         template_name="Log/log_in_up.html",
    #         authentication_form=UserLoginForm
    #     ),
    #     name='LogIn'
    # ),
    path("signUp/", SignUpView.as_view(), name="SignUp"),
    # path("signUp/", signUp, name="SignUp"),

    # path('login/', name="login"),
    # path("logout/" ,name="logout"),
    # path("password_change/",name="password_change"),
    # path("password_change/done/",name="password_change_done"),
    # path("password_reset/", name="password_reset"),
    # path("password_reset/done/", name="password_reset_done"),
    # path("reset/<uidb64>/<token>/", name="password_reset_confirm"),
    # path("reset/done/", name="password_reset_complete"),
]