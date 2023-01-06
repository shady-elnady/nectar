from django.urls import path

from .views import paypal


app_name = "Payment"


urlpatterns = [
    path("paypal/", paypal, name="paypal"),
]
