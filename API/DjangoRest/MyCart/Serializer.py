from rest_framework.serializers import HyperlinkedModelSerializer

from .models import MyCart,  MyCartItem, Coupon
from Product.Serializer import ProductSerializer

# Serializers define the API representation.

class CouponSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Coupon
        fields = [
            "url",
            "promo_code",
            "discount",
            "created_date",
            "end_time",
            "last_updated",
            "slug",
        ]
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
    promo_code = CouponSerializer(many= False) 
    
    class Meta:
        model = MyCart
        fields = [
            "url",
            "my_cart_items",
            "promo_code",
            "is_finished",
            "Total_MyCart_Cost",
            "payment_method",
            "created_date",
            "last_updated",
            "slug",
        ]
 