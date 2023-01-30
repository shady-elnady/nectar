from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated

from .models import Prefix, Unit
from .Serializer import PrefixSerializer, UnitSerializer



class PrefixViewSet(ModelViewSet):
    queryset = Prefix.objects.all()
    serializer_class = PrefixSerializer
    permission_classes = [IsAuthenticated]



class UnitViewSet(ModelViewSet):
    queryset = Unit.objects.all()
    serializer_class = UnitSerializer
    permission_classes = [IsAuthenticated]

