from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Department 
from Product.Serializer import ProductSerializer

# Serializers define the API representation.

class DepartmentSerializer(HyperlinkedModelSerializer):
    products = ProductSerializer(many= True)

    class Meta:
        model = Department
        fields = "__all__"
