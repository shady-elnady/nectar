from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Card, Coupon, LineInCard
from .Serializer import CardSerializer, LineInCardSerializer, CouponSerializer 


class CardViewSet(ModelViewSet):
    queryset = Card.objects.all()
    serializer_class = CardSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CouponViewSet(ModelViewSet):
    queryset = Coupon.objects.all()
    serializer_class = CouponSerializer
    # permission_classes = [permissions.IsAuthenticated]


class LineInCardViewSet(ModelViewSet):
    queryset = LineInCard.objects.all()
    serializer_class = LineInCardSerializer
    # permission_classes = [permissions.IsAuthenticated]