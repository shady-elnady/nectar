from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Language


# Serializers define the API representation.



class LanguageSerializer(HyperlinkedModelSerializer):

    class Meta:
        model = Language
        fields = [
             "url",
             "name",
            "native",
            "iso_639_1",
            "is_rtl",
            "slug",
        ]
