from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from .models import Notifecation
from .Serializer import NotifecationSerializer



class NotifecationViewSet(ModelViewSet):
    queryset = Notifecation.objects.all()
    serializer_class = NotifecationSerializer
    permission_classes = [IsAuthenticated, IsAdminUser]

    def get_queryset(self):
        return Notifecation.objects.all().filter(user=self.request.user)