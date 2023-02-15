from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Currency, PaymentMethod


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


class PaymentMethodSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = PaymentMethod
        fields = [
            "url",
            "name",
            "native",
            "emoji",
            "slug",
        ] 