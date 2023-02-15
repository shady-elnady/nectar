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
            "My_Cart_Item_Price",
            "created_date",
            "last_updated",
            "slug",
        ]



class MyCartSerializer(HyperlinkedModelSerializer):
    My_Cart_Items = MyCartItemSerializer(many= True) 
    order = OrderSerializer(many= False) 
    
    class Meta:
        model = MyCart
        fields = [
            "url",
            "My_Cart_Items",
            "is_finished",
            "Total_MyCart_Cost",
            "order",
            "created_date",
            "last_updated",
            "slug",
        ]
 