from rest_framework.serializers import HyperlinkedModelSerializer 
from rest_framework.reverse import reverse

from .models import Category, Brand 


# Serializers define the API representation.


class CategorySerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Category
        fields = (
            "url",
            'name',
            'image',
            'category_parent', 
            'slug',
        )
    
    def to_representation(self, instance):
        self.fields['category_parent'] = CategorySerializer()
        return super(CategorySerializer, self).to_representation(instance)

  
class BrandSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Brand 
        fields = [
            "url",
            "name",
            "image",
            "slug",
        ] 

