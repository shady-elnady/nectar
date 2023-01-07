from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Category, Brand
from .Serializer import CategorySerializer, BrandSerializer


class BrandViewSet(ModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    # permission_classes = [permissions.IsAuthenticated]



class CategoryViewSet(ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    # permission_classes = [permissions.IsAuthenticated]