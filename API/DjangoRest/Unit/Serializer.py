from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Prefix, Unit


# Serializers define the API representation.
class PrefixSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Prefix
        fields = [
            "url",
            "name",
            "native",
            "symbol",
            "power",
            "slug",
        ]



class UnitSerializer(HyperlinkedModelSerializer):
    prefix = PrefixSerializer(many= False) 
    class Meta:
        model = Unit
        fields = [
            "url",
            "name",
            "native",
            "symbol",
            "prefix",
            "base_unit",
            "measurement",
            "slug",
        ] 
    
    def to_representation(self, instance):
        self.fields['base_unit'] = UnitSerializer()
        return super(UnitSerializer, self).to_representation(instance)

  