from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Prefix, Unit


# Serializers define the API representation.
class PrefixSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Prefix
        fields = "__all__"



class UnitSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Unit
        fields = "__all__" 