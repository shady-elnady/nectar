from django.urls import path
from .views import (
    home,
    about,
    contact,
)

app_name = "Nectar"

urlpatterns = [
    path("", home, name=f"Home"),
    path("about/", about, name=f"About"),
    path("contact/", contact, name=f"Contact"),
]
