from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions
from rest_framework import filters

from .models import Product, ProductImage
from .Serializer import ProductSerializer, ProductImageSerializer




class ProductViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    # permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        queryset = Product.objects.all()
        name = self.request.query_params.get('name')
        if name:
            queryset = queryset.filter(name__contains=name) ## objects.filter(firstname__contains='bias').values()
        return queryset



class ProductImageViewSet(ModelViewSet):
    queryset = ProductImage.objects.all()
    serializer_class = ProductImageSerializer
    # permission_classes = [permissions.IsAuthenticated]


