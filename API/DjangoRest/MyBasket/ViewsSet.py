from django.shortcuts import get_object_or_404

from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from .models import MyBasket, MyBasketItem
from .Serializer import MyBasketSerializer, MyBasketItemSerializer



class MyBasketViewSet(viewsets.ModelViewSet):
    queryset = MyBasket.objects.all()
    serializer_class = MyBasketSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(customer=self.request.user)
    
    def get_queryset(self):
        return MyBasket.objects.filter(customer=self.request.user)



class MyBasketItemViewSet(viewsets.ModelViewSet):
    queryset = MyBasketItem.objects.all()
    serializer_class = MyBasketItemSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(my_basket=MyBasket.get_object_or_404(customer=self.request.user))
    
    def get_queryset(self):
        return MyBasketItem.objects.filter(my_basket= MyBasket.get_object_or_404(customer=self.request.user))
