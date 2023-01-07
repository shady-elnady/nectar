from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Language


# Serializers define the API representation.



class LanguageSerializer(HyperlinkedModelSerializer):

    class Meta:
        model = Language
        fields = "__all__" 
