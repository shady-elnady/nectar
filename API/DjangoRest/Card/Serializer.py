from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Card, Coupon, LineInCard


# Serializers define the API representation.


class CouponSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Coupon
        fields = "__all__" 


class LineInCardSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = LineInCard
        fields = "__all__" 


class CardSerializer(HyperlinkedModelSerializer):
    products = LineInCardSerializer(many= True)
    
    class Meta:
        model = Card
        fields = "__all__" 

