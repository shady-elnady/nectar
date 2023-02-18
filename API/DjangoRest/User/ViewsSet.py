from django.contrib.auth.models import Group
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser 
from .models import User, Following, Profile
from .Serializer import (
    UserSerializer, GroupSerializer,
    FollowingSerializer, MyProfileSerializer,
)
from django.contrib.auth import authenticate


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


class MyProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = MyProfileSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Profile.objects.all().filter(user=self.request.user)

    # def post(self, request,):
    #     username = request.data.get("username")
    #     password = request.data.get("password")
    #     user = authenticate(username=username, password=password)
    #     if user:
    #         return Response({"token": user.auth_token.key})
    #     else:
    #         return Response({"error": "Wrong Credentials"}, status=status.HTTP_400_BAD_REQUEST)



# from rest_framework.exceptions import PermissionDenied


# class PollViewSet(viewsets.ModelViewSet):
#     # ...

#     def destroy(self, request, *args, **kwargs):
#         poll = Poll.objects.get(pk=self.kwargs["pk"])
#         if not request.user == poll.created_by:
#             raise PermissionDenied("You can not delete this poll.")
#         return super().destroy(request, *args, **kwargs)


# class ChoiceList(generics.ListCreateAPIView):
#     # ...

#     def post(self, request, *args, **kwargs):
#         poll = Poll.objects.get(pk=self.kwargs["pk"])
#         if not request.user == poll.created_by:
#             raise PermissionDenied("You can not create choice for this poll.")
#         return super().post(request, *args, **kwargs)