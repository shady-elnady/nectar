from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Product, ProductImage
from .Serializer import ProductSerializer, ProductImageSerializer


class ProductViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    # permission_classes = [permissions.IsAuthenticated]



class ProductImageViewSet(ModelViewSet):
    queryset = ProductImage.objects.all()
    serializer_class = ProductImageSerializer
    # permission_classes = [permissions.IsAuthenticated]


