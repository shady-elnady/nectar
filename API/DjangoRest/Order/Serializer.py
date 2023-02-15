from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Order, Refund, Delivery, Payment, PromoCode
# from MyCart.Serializer import MyCartSerializer
from Location.Serializer import AddressSerializer
from Payment.Serializer import CurrencySerializer, PaymentMethodSerializer
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

class PromoCodeSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = PromoCode
        fields = [
            "url",
            "coupon",
            "discount",
            "end_time",
            "created_date",
            "last_updated",
            "slug",
        ]


class PaymentSerializer(HyperlinkedModelSerializer):
    payment_method = PaymentMethodSerializer(many= False)
    currency = CurrencySerializer(many= False) 
    
    class Meta:
        model = Payment
        fields = [
            "url",
            "order",
            "payment_method",
            "charge_id",
            "currency",
            "amount",
            "payment_time",
            "slug",
        ]


class DeliverySerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Delivery
        fields = [
            "url",
            "delivery_method",
            "delivery_cost",
            "slug",
        ] 


class OrderSerializer(HyperlinkedModelSerializer):
    Refund =RefundSerializer(many= False) 
    # my_cart =MyCartSerializer(many= False) 
    promo_code = PromoCodeSerializer(many= False)
    delivery = DeliverySerializer(many= False)
    payments = PaymentSerializer(many= True)
    shipping_address =AddressSerializer(many= False) 
    billing_address =AddressSerializer(many= False) 
    class Meta:
        model = Order
        fields = [
            "url",
            "my_cart",
            "promo_code",
            "is_refund_requested",
            "is_refund_granted",
            "shipping_address",
            "delivery",
            "billing_address",
            "total_order_cost",
            "delvirey_cost",
            "payments",
            "received_date",
            "Final_Order_Cost",
            "Refund",
            "slug",
        ]