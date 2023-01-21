from django.contrib.auth.models import Group
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework import permissions

from .models import User, Following, Profile
from .Serializer import (
    UserSerializer, GroupSerializer,
    FollowingSerializer, ProfileSerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('created_date')
    serializer_class = UserSerializer
    # permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        querySet = User.objects.all()
        username = self.request.query_params.get('username')
        # user = get_object_or_404(User, username= username)
        if (username ):
            # return querySet.filter( username = username).order_by('created_at')
            return querySet.filter( username = username)
        return querySet


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    # permission_classes = [permissions.IsAuthenticated]


class FollowingViewSet(viewsets.ModelViewSet):
    queryset = Following.objects.all()
    serializer_class = FollowingSerializer
    # permission_classes = [permissions.IsAuthenticated]


class ProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer
    # permission_classes = [permissions.IsAuthenticated]