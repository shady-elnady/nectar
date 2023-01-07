from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Currency
from .Serializer import CurrencySerializer



class CurrencyViewSet(ModelViewSet):
    queryset = Currency.objects.all()
    serializer_class = CurrencySerializer
    # permission_classes = [permissions.IsAuthenticated]

