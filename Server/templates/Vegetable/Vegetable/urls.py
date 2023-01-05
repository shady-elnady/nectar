from django.urls import path
from .views import (
    home,
    about,
    contact,
    vegetable,
    project_listing,
    project_detail,
    create_project
)

app_name = "Vegetable"

urlpatterns = [
    path("", home, name=f"home{app_name}"),
    path("about/", about, name=f"about{app_name}"),
    path("contact/", contact, name=f"contact{app_name}"),
    path("vegetable/", vegetable, name=f"vegetable{app_name}"),
    path("projects/", project_listing, name="project"),
    path("<slug:id>/", project_detail, name="vegetable_detail"),
    path("project/new", create_project, name="create_project"),
]
