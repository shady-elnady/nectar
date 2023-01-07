from rest_framework.viewsets import ModelViewSet
from rest_framework import permissions

from .models import Department 
from .Serializer import DepartmentSerializer


class DepartmentViewSet(ModelViewSet):
  
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer
    # permission_classes = [permissions.IsAuthenticated]