from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Order, Refund, Invoice
from .Serializer import OrderSerializer, RefundSerializer, InvoiceSerializer


class RefundViewSet(ModelViewSet):
    queryset = Refund.objects.all()
    serializer_class = RefundSerializer
    # permission_classes = [permissions.IsAuthenticated]


class OrderViewSet(ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    # permission_classes = [permissions.IsAuthenticated]


class InvoiceViewSet(ModelViewSet):
    queryset = Invoice.objects.all()
    serializer_class = InvoiceSerializer
    # permission_classes = [permissions.IsAuthenticated]

