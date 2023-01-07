from django.contrib.auth.models import Group
from rest_framework import viewsets
from rest_framework import permissions

from .models import Language 
from .Serializer import LanguageSerializer


class LanguageViewSet(viewsets.ModelViewSet):
    queryset = Language.objects.all()
    serializer_class = LanguageSerializer
    # permission_classes = [permissions.IsAuthenticated]

