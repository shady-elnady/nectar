from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Order, Refund 
from MyCart.Serializer import MyCartSerializer
from Location.Serializer import AddressSerializer
# Serializers define the API representation.


class RefundSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Refund
        fields = [
            "url",
            "order",
            "reason",
            "is_accepted",
            "created_date",
            "last_updated",
            "slug",
        ] 


class OrderSerializer(HyperlinkedModelSerializer):
    Refunds =RefundSerializer(many= True) 
    my_cart =MyCartSerializer(many= False) 
    shipping_address =AddressSerializer(many= False) 
    billing_address =AddressSerializer(many= False) 
    class Meta:
        model = Order
        fields = [
            "url",
            "serial_no",
            "my_cart",
            "received_date",
            "is_received",
            "is_refund_requested",
            "is_refund_granted",
            "shipping_address",
            "billing_address",
            "slug",
        ]