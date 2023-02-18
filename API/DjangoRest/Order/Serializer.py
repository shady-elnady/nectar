from rest_framework.serializers import HyperlinkedModelSerializer

# from MyCart.Serializer import MyCartSerializer
from .models import Order, Refund, Delivery, Payment, PromoCard
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

class PromoCardSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = PromoCard
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
    delivery = DeliverySerializer(many= False)
    Payments = PaymentSerializer(many= True)
    
    class Meta:
        model = Order
        fields = [
            "url",
            "my_cart",
            "is_refund_requested",
            "is_refund_granted",
            "delivery",
            "total_order_cost",
            "delvirey_cost",
            "Payments",
            "received_date",
            "Final_Order_Cost",
            "Total_amounts_Paid",
            "Refund",
            "slug",
        ]