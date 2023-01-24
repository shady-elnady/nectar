from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Language 
from Application.Serializer import ApplicationSerializer


# Serializers define the API representation.



class LanguageSerializer(HyperlinkedModelSerializer):
    applicatins_support = ApplicationSerializer(many= True)
    class Meta:
        model = Language
        fields = [
             "url",
             "name",
            "native",
            "iso_639_1",
            "is_rtl",
            "applicatins_support",
            "slug",
        ]
