from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from .models import MyCart, MyCartItem
from .Serializer import MyCartSerializer, MyCartItemSerializer, CouponSerializer



class MyCartViewSet(viewsets.ModelViewSet):
    queryset = MyCart.objects.all()
    serializer_class = MyCartSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(customer=self.request.user)
    
    def get_queryset(self):
        return MyCart.objects.filter(customer=self.request.user)



class MyCartItemViewSet(viewsets.ModelViewSet):
    queryset = MyCartItem.objects.all()
    serializer_class = MyCartItemSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(my_cart=MyCart.objects.get(customer=self.request.user))
    
    def get_queryset(self):
        return MyCartItem.objects.filter(my_cart__in= MyCart.objects.filter(customer=self.request.user))
