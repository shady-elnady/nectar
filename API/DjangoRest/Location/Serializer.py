from rest_framework.serializers import HyperlinkedModelSerializer

from .models import (
    Country, Governorate,Geo,
    City, Region, Street, Address,
)


class StreetSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Street
        fields = "__all__" 


class RegionSerializer(HyperlinkedModelSerializer):
    Streets = StreetSerializer(many= True)

    class Meta:
        model = Region
        fields = "__all__" 


class CitySerializer(HyperlinkedModelSerializer):
    Regions = RegionSerializer(many= True) 
    class Meta:
        model = City
        fields = "__all__"


class GovernorateSerializer(HyperlinkedModelSerializer):
    Cities = CitySerializer(many= True)
    class Meta:
        model = Governorate
        fields = "__all__" 


class CountrySerializer(HyperlinkedModelSerializer):
    Cities = CitySerializer(many= True)
    Governorates = GovernorateSerializer(many= True) 

    class Meta:
        model = Country
        fields = "__all__"

class AddressSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Address
        fields = "__all__" 


class GeoSerializer(HyperlinkedModelSerializer):
    Address = AddressSerializer(many= True)

    class Meta:
        model = Geo
        fields = "__all__" 