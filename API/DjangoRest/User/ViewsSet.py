from django.contrib.auth.models import Group
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser 
from .models import User, Following, Profile
from .Serializer import (
    UserSerializer, GroupSerializer,
    FollowingSerializer, MyProfileSerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('created_date')
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]

    def get_queryset(self):
        querySet = User.objects.all()
        if (self.request.query_params.get('username') ):
            return querySet.filter( username = self.request.query_params.get('username'))
        return querySet


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]


class FollowingViewSet(viewsets.ModelViewSet):
    queryset = Following.objects.all()
    serializer_class = FollowingSerializer
    permission_classes = [IsAuthenticated]


class MyProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = MyProfileSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Profile.objects.all().filter(user=self.request.user)

