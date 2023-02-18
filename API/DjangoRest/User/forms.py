from django import forms
from django.contrib.auth.models import Group
from django.contrib.auth.forms import (
    ReadOnlyPasswordHashField, AuthenticationForm,
    AuthenticationForm, UsernameField,
    UserCreationForm,
)

from .models import User, Profile


class UserLoginForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super(UserLoginForm, self).__init__(*args, **kwargs)

    username = UsernameField(
        widget=forms.TextInput(
            attrs={
                "name": "username",
                "autocapitalize": "none",
                "maxlength": 60,
                "type": "email",
                "class": "form-style",
                "placeholder": "Your Email",
                "id": "logemail",
                "autocomplete": "off",
            },
        )
    )
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "type": "password",
                "name": "password",
                "class": "form-style",
                "placeholder": "Your Password",
                "id": "logpass",
                "autocomplete": "off",
            },
        )
    )


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email']


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image']     