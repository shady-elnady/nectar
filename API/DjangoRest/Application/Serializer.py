from rest_framework.serializers import HyperlinkedModelSerializer

from .models import Platform , Application 


# Serializers define the API representation.



class PlatformSerializer(HyperlinkedModelSerializer):

    class Meta:
        model = Platform
        fields = [
             "url",
             "name",
            "native",
            "slug",
        ]



class ApplicationSerializer(HyperlinkedModelSerializer):
    platform = PlatformSerializer(many= False)
    class Meta:
        model = Application
        fields = [
             "url",
             "name",
            "native",
            "platform",
            "slug",
        ]
