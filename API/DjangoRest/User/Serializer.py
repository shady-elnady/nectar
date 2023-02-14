from django.contrib.auth.models import Group
from rest_framework.serializers import (
    HyperlinkedModelSerializer,
    EmailField,
    CharField,
 )

from .models import User, Following, Profile
from Language.Serializer import LanguageSerializer
from Location.Serializer import AddressSerializer
from Product.Serializer import ProductSerializer
from MyCart.Serializer import MyCartSerializer

# Serializers define the API representation.

class UserSerializer(HyperlinkedModelSerializer):
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
            "Profile",
            "slug",
        ]
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance


class GroupSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class FollowingSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Following
        fields = "__all__"


class MyProfileSerializer(HyperlinkedModelSerializer):
    language = LanguageSerializer(many= False)
    address = AddressSerializer(many= False)
    my_basket = MyCartSerializer(many= False)
    favorites_products = ProductSerializer(many= True)
    class Meta:
        model = Profile
        fields = [
            "url",
            "image",
            "phone_number",
            "full_name",
            "family_name",
            "birth_date",
            "gender",
            "language",
            "address",
            "age",
            "my_basket",
            "favorites_products",
            "slug",
        ]


class LogInSerialzer(HyperlinkedModelSerializer):
    email = EmailField()
    password =  CharField()