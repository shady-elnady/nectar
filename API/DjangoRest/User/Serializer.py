from django.contrib.auth.models import Group
from rest_framework.serializers import HyperlinkedModelSerializer

from Language.Serializer import LanguageSerializer
from .models import User, Following, Profile


# Serializers define the API representation.
class UserSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = [
            "url",
            "username",
            "email",
            "is_active",
            "is_staff",
            "is_superuser",
            "slug",
        ]


class GroupSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class FollowingSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Following
        fields = "__all__"


class ProfileSerializer(HyperlinkedModelSerializer):
    user = UserSerializer(many= False)
    language = LanguageSerializer(many= False)
    class Meta:
        model = Profile
        fields = "__all__"

