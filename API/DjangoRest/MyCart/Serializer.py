from rest_framework.serializers import HyperlinkedModelSerializer

from .models import MyCart,  MyCartItem
from Product.Serializer import ProductSerializer
from Order.Serializer import OrderSerializer

# Serializers define the API representation.


class MyCartItemSerializer(HyperlinkedModelSerializer):
    product = ProductSerializer(many= False)
    
    class Meta:
        model = MyCartItem
        fields = [
            "url",
            "my_cart",
            "product",
            "amount",
            "my_cart_item_price",
            "created_date",
            "last_updated",
            "slug",
        ]



class MyCartSerializer(HyperlinkedModelSerializer):
    my_cart_items = MyCartItemSerializer(many= True) 
    Order = OrderSerializer(many= False) 
    
    class Meta:
        model = MyCart
        fields = [
            "url",
            "my_cart_items",
            "is_finished",
            "Total_MyCart_Cost",
            "Order",
            "created_date",
            "last_updated",
            "slug",
        ]
 