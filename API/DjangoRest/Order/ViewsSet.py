from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Order, Refund
from .Serializer import OrderSerializer, RefundSerializer 


class RefundViewSet(ModelViewSet):
    queryset = Refund.objects.all()
    serializer_class = RefundSerializer
    # permission_classes = [permissions.IsAuthenticated]


class OrderViewSet(ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    # permission_classes = [permissions.IsAuthenticated]

