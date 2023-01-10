from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Currency


# Serializers define the API representation.
class CurrencySerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Currency
        fields = [
            "url",
            "name",
            "native",
            "code",
            "emoji",
            "slug",
        ] 