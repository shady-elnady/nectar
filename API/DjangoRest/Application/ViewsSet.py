from rest_framework import viewsets
from rest_framework import permissions

from .models import Platform, Application 
from .Serializer import PlatformSerializer, ApplicationSerializer


class PlatformViewSet(viewsets.ModelViewSet):
    queryset = Platform.objects.all()
    serializer_class = PlatformSerializer
    # permission_classes = [permissions.IsAuthenticated]



class ApplicationViewSet(viewsets.ModelViewSet):
    queryset = Application.objects.all()
    serializer_class = ApplicationSerializer
    # permission_classes = [permissions.IsAuthenticated]

