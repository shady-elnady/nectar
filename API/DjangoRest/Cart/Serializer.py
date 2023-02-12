from rest_framework.serializers import HyperlinkedModelSerializer, StringRelatedField

from .models import Cart, Coupon, LineInCart
from User.Serializer import UserSerializer
from Product.Serializer import ProductSerializer
# Serializers define the API representation.


class CouponSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Coupon
        fields = [
            "url",
            "promo_code",
            "discount",
            "slug",
        ]


class LineInMyCartSerializer(HyperlinkedModelSerializer):
    cart = StringRelatedField(many= False)
    product = ProductSerializer(many= False) 
    class Meta:
        model = LineInCart
        fields = [
            "url",
            "cart",
            "product",
            "amount",
            "total_line_price",
            "slug",
        ] 


class MyCartSerializer(HyperlinkedModelSerializer):
    # customer = UserSerializer(many= False) 
    Lines_In_Cart = LineInMyCartSerializer(many= True)
    promo_code = CouponSerializer(many= False)
    class Meta:
        model = Cart
        fields = [
            "url",
            # "customer",
            "Lines_In_Cart",
            "payment_method",
            "promo_code",
            "is_finished",
            "created_at",
            "Total_Cost",
            "slug",
        ]
    
    def create(self, validated_data):
        tracks_data = validated_data.pop('lines_in_cart')
        cart = Cart.objects.create(**validated_data)
        for track_data in tracks_data:
            LineInCart.objects.create(album=cart, **track_data)
        return cart

