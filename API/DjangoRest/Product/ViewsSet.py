from django.db.models import Q
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated
# from rest_framework import filters

from .models import Product, ProductImage
from .Serializer import ProductSerializer, ProductImageSerializer


class ProductViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    # filter_backends = (filters.DjangoFilterBackend,)
    # permission_classes = [IsAuthenticated]

    def get_queryset(self):
        queryset = Product.objects.all()
        name = self.request.query_params.get('name')
        category_name = self.request.query_params.get("category_name")
        if name:
            queryset = queryset.filter(name__contains=name)
        if category_name:
            queryset = queryset.filter(Q(category__category_parent__name__contains=category_name) | Q(category__name__contains=category_name) )
        return queryset



class ProductImageViewSet(ModelViewSet):
    queryset = ProductImage.objects.all()
    serializer_class = ProductImageSerializer
    # filter_backends = (filters.DjangoFilterBackend,)
    # permission_classes = [IsAuthenticated]


