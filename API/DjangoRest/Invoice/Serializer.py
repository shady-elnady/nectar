from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Order, Refund, Invoice


# Serializers define the API representation.


class RefundSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Refund
        fields = "__all__" 


class OrderSerializer(HyperlinkedModelSerializer):
    Refunds =RefundSerializer(many= True) 
    class Meta:
        model = Order
        fields = "__all__" 


class InvoiceSerializer(HyperlinkedModelSerializer):

    class Meta:
        model = Invoice
        fields = "__all__" 
