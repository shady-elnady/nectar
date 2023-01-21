from django.contrib.auth.models import Group
from rest_framework.serializers import HyperlinkedModelSerializer, RelatedField, EmailField, CharField


from .models import User, Following, Profile
# from Nectar.Serializer import AgeSerializer
from Language.Serializer import LanguageSerializer
from Location.Serializer import AddressSerializer
from Product.Serializer import ProductSerializer


# Serializers define the API representation.

class UserSerializer(HyperlinkedModelSerializer):
    favorites_products = ProductSerializer(many= True)
    class Meta:
        model = User
        fields = [
            "url",
            "username",
            "email",
            "is_active",
            "is_verified",
            "is_staff",
            "is_superuser",
            "favorites_products",
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
    address = AddressSerializer(many= False)
    class Meta:
        model = Profile
        fields = [
            "url",
            "image",
            "user",
            "phone_number",
            "full_name",
            "family_name",
            "birth_date",
            "gender",
            "language",
            "address",
            "age",
            "slug",
        ]


class LogInSerialzer(HyperlinkedModelSerializer):
    email = EmailField()
    password =  CharField()