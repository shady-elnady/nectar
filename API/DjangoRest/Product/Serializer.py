from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Product, ProductImage


# Serializers define the API representation.



class ProductImageSerializer(HyperlinkedModelSerializer):

    class Meta:
        model = ProductImage
        fields = "__all__" 



class ProductSerializer(HyperlinkedModelSerializer):
    Images = ProductImageSerializer(many= True) 
    
    class Meta:
        model = Product
        fields = "__all__" 
