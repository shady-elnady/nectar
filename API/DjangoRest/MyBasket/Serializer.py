from rest_framework.serializers import HyperlinkedModelSerializer

from .models import MyBasket,  MyBasketItem
from Product.Serializer import ProductSerializer

# Serializers define the API representation.

class MyBasketItemSerializer(HyperlinkedModelSerializer):
    product = ProductSerializer(many= False)
    
    class Meta:
        model = MyBasketItem
        fields = [
            "url",
            "my_basket",
            "product",
            "amount",
            "total_item_price",
            "created_date",
            "last_updated",
            "slug",
        ]



class MyBasketSerializer(HyperlinkedModelSerializer):
    My_Basket_Items = MyBasketItemSerializer(many= True) 
    
    class Meta:
        model = MyBasket
        fields = [
            "url",
            "My_Basket_Items",
            "Total_My_Basket_Cost",
            "created_date",
            "last_updated",
            "slug",
        ]
 