from rest_framework.serializers import HyperlinkedModelSerializer

from .models import (
    Country, Governorate,Geo,
    City, Region, Street, Address,
)
from Payment.Serializer import CurrencySerializer
from Language.Serializer import LanguageSerializer



class CountrySerializer(HyperlinkedModelSerializer):
    currency = CurrencySerializer(many= False)
    language = LanguageSerializer(many= False)
    class Meta:
        model = Country
        fields = [
            "url",
            "name",
            "native",
            "svg_img",
            "continent",
            "capital",
            "flag_emoji",
            "currency",
            "language",
            "tel_code",
            "slug",
        ]

class GovernorateSerializer(HyperlinkedModelSerializer):
    country = CountrySerializer(many= False)
    class Meta:
        model = Governorate
        fields = [
            "url",
            "name",
            "native",
            "tel_code",
            "country",
            "slug",
        ] 

class CitySerializer(HyperlinkedModelSerializer):
    governorate = GovernorateSerializer(many= False) 
    class Meta:
        model = City
        fields = [
            "url",
            "name",
            "native",
            "country",
            "governorate",
            "slug",
        ] 

class RegionSerializer(HyperlinkedModelSerializer):
    city = CitySerializer(many= False)
    class Meta:
        model = Region
        fields = [
            "url",
            "name",
            "native",
            "city",
            "slug",
        ]  

class StreetSerializer(HyperlinkedModelSerializer):
    region = RegionSerializer(many= False)
    class Meta:
        model = Street
        fields = [
            "url",
            "name",
            "native",
            "region",
            "slug",
        ]

class GeoSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Geo
        fields = [
            "url",
            "lat",
            "lang",
            "slug",
        ] 

class AddressSerializer(HyperlinkedModelSerializer):
    street = StreetSerializer(many= False)
    geo = GeoSerializer(many= False)
    class Meta:
        model = Address
        fields = [
            "url",
            "name",
            "native",
            "street",
            "geo",
            "slug",
        ]





