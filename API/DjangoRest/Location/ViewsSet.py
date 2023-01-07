from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import (
    Country, Governorate,Geo,
    City, Region, Street, Address,
)
from .Serializer import (
    StreetSerializer, RegionSerializer,
    CitySerializer, GovernorateSerializer,
    AddressSerializer, GeoSerializer,
    CountrySerializer,
) 


class StreetViewSet(ModelViewSet):
    queryset = Street.objects.all()
    serializer_class = StreetSerializer
    # permission_classes = [permissions.IsAuthenticated]


class RegionViewSet(ModelViewSet):
    queryset = Region.objects.all()
    serializer_class = RegionSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CityViewSet(ModelViewSet):
    queryset = City.objects.all()
    serializer_class = CitySerializer
    # permission_classes = [permissions.IsAuthenticated]


class GovernorateViewSet(ModelViewSet):
    queryset = Governorate.objects.all()
    serializer_class = GovernorateSerializer
    # permission_classes = [permissions.IsAuthenticated]


class AddressViewSet(ModelViewSet):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer
    # permission_classes = [permissions.IsAuthenticated]


class GeoViewSet(ModelViewSet):
    queryset = Geo.objects.all()
    serializer_class = GeoSerializer
    # permission_classes = [permissions.IsAuthenticated]


class CountryViewSet(ModelViewSet):
    queryset = Country.objects.all()
    serializer_class = CountrySerializer
    # permission_classes = [permissions.IsAuthenticated]

