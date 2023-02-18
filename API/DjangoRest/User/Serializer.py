from django.contrib.auth.models import Group
from rest_framework.serializers import (
    HyperlinkedModelSerializer,
    EmailField,
    CharField,
 )

from .models import User, Following, Profile
from Language.Serializer import LanguageSerializer
from Location.Serializer import AddressSerializer
from MyCart.Serializer import MyCartSerializer
from Order.Serializer import PromoCardSerializer

# Serializers define the API representation.



class GroupSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']


class FollowingSerializer(HyperlinkedModelSerializer):
    class Meta:
        model = Following
        fields = "__all__"



class UserSerializer(HyperlinkedModelSerializer):
    my_basket = MyCartSerializer(many= False)

    class Meta:
        model = User
        fields = [
            "url",
            "username",
            "email",
            "Profile",
            "my_basket",
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
    
    # def create(self, validated_data):
    #     user = User(
    #         email=validated_data['email'],
    #         username=validated_data['username']
    #     )
    #     user.set_password(validated_data['password'])
    #     user.save()
    #     return user



class MyProfileSerializer(HyperlinkedModelSerializer):
    user = UserSerializer(many= False)
    language = LanguageSerializer(many= False)
    delivery_address =AddressSerializer(many= False) 
    billing_address =AddressSerializer(many= False) 
    promo_card = PromoCardSerializer(many= False)
    class Meta:
        model = Profile
        fields = [
            "url",
            "user",
            "image",
            "phone_number",
            "full_name",
            "family_name",
            "birth_date",
            "gender",
            "language",
            "age",
            "delivery_address",
            "billing_address",
            "promo_card",
            "my_basket",
            "slug",
        ]


# class LogInSerialzer(HyperlinkedModelSerializer):
#     email = EmailField()
#     password =  CharField()