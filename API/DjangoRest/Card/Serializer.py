from rest_framework.serializers import HyperlinkedModelSerializer, StringRelatedField, RelatedField



from .models import Card, Coupon, LineInCard
from User.Serializer import UserSerializer
from Product.Serializer import ProductSerializer
# Serializers define the API representation.



class TagListingField(RelatedField):
 
    def to_representation(self, value):
        print(value)
        return value


class CouponSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Coupon
        fields = [
            "url",
            "promo_code",
            "discount",
            "slug",
        ]


class LineInCardSerializer(HyperlinkedModelSerializer):
    card = StringRelatedField(many= False)
    product = ProductSerializer(many= False) 
    class Meta:
        model = LineInCard
        fields = [
            "url",
            "card",
            "product",
            "amount",
            "total_line_price",
            "slug",
        ] 


class CardSerializer(HyperlinkedModelSerializer):
    customer = UserSerializer(many= False) 
    # lines_in_card = LineInCardSerializer(many= True)
    lines_in_card = TagListingField(many= True, queryset= LineInCard.objects.all())
    promo_code = CouponSerializer(many= False)
    class Meta:
        model = Card
        fields = [
            "url",
            "customer",
            "lines_in_card",
            "payment_method",
            "promo_code",
            "created_at",
            "total_cost",
            "slug",
        ]
    
    def create(self, validated_data):
        tracks_data = validated_data.pop('lines_in_card')
        card = Card.objects.create(**validated_data)
        for track_data in tracks_data:
            LineInCard.objects.create(album=card, **track_data)
        return card

