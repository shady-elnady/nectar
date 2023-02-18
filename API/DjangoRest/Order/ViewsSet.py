from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from .models import (
    Order, Refund, Delivery,
    Payment, PromoCard,
)
from .Serializer import ( 
    RefundSerializer,
    PromoCardSerializer, OrderSerializer,
    PaymentSerializer, DeliverySerializer
)



class RefundViewSet(ModelViewSet):
    queryset = Refund.objects.all()
    serializer_class = RefundSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class PromoCardViewSet(ModelViewSet):
    queryset = PromoCard.objects.all()
    serializer_class = PromoCardSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class PaymentViewSet(ModelViewSet):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class DeliveryViewSet(ModelViewSet):
    queryset = Delivery.objects.all()
    serializer_class = DeliverySerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class OrderViewSet(ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]
