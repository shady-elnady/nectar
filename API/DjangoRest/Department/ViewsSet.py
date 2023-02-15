from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated 

from .models import Department 
from .Serializer import DepartmentSerializer


class DepartmentViewSet(ModelViewSet):
  
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        queryset = Department.objects.all()
        name = self.request.query_params.get('name')
        if name:
            queryset = queryset.filter(name__contains=name) ## objects.filter(firstname__contains='bias').values()
        return queryset
