from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Product, ProductImage
from Category.Serializer import CategorySerializer, BrandSerializer
from Unit.Serializer import UnitSerializer
from Payment.Serializer import CurrencySerializer
# Serializers define the API representation.



class ProductImageSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = ProductImage
        fields = [
            "url",
            "product",
            "image",
            "slug",
        ] 



class ProductSerializer(HyperlinkedModelSerializer):
    product_images = ProductImageSerializer(many= True) 
    brand = BrandSerializer(many= False) 
    category = CategorySerializer(many= False) 
    unit = UnitSerializer(many= False) 
    currency = CurrencySerializer(many= False) 
    class Meta:
        model = Product
        fields = [
            "url",
            "name",
            "image",
            "nutritions",
            "amount",
            "reviews",
            "brand",
            "category",
            "unit",
            "serial",
            "currency",
            "price",
            "detail",
            "is_favorite",
            "product_images",
            "slug",
        ] 