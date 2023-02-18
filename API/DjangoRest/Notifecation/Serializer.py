from rest_framework.serializers import HyperlinkedModelSerializer

# from MyCart.Serializer import MyCartSerializer
from .models import Notifecation

# Serializers define the API representation.


class NotifecationSerializer(HyperlinkedModelSerializer):
    
    class Meta:
        model = Notifecation
        fields = [
            "url",
            "message",
            "slug",
        ]
