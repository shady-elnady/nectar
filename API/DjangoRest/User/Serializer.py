from django.contrib.auth.models import Group
from rest_framework.serializers import HyperlinkedModelSerializer

from .models import User, Following, Profile


# Serializers define the API representation.
class UserSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'is_staff']


class GroupSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class FollowingSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Following
        fields = "___all__"


class ProfileSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = "___all__"

