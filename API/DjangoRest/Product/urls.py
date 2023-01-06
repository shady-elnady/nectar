from django.urls import path
from .views import (
    product,
    product_detail,
    add_product,
)

app_name = "Product"

urlpatterns = [
    path("all/", product, name= "All"),
    path("add_product/", add_product, name="Add_Product"),
    path("<slug:id>/", product_detail, name="Product_Detail"),
]
