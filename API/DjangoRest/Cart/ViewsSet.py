from rest_framework.response import Response
from rest_framework import status
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated 

from .models import Cart, Coupon, LineInCart
from .Serializer import MyCartSerializer, LineInMyCartSerializer, CouponSerializer 

from itertools import chain


class MyCartViewSet(ModelViewSet):
    queryset = Cart.objects.all()
    serializer_class = MyCartSerializer
    ordering_fields = ('created_at')
    permission_classes = [ IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(user_id=self.request.user)
    
    def get_queryset(self):
        querySet = Cart.objects.all().filter(customer=self.request.user).order_by('created_at')
        if (self.request.query_params.get('is_finished') ):
            return querySet.filter( is_finished = self.request.query_params.get('is_finished')).order_by('created_at')
        return querySet


class CouponViewSet(ModelViewSet):
    queryset = Coupon.objects.all()
    serializer_class = CouponSerializer
    permission_classes = [IsAuthenticated]


class LineInMyCartViewSet(ModelViewSet):
    queryset = LineInCart.objects.all()
    serializer_class = LineInMyCartSerializer
    permission_classes = [IsAuthenticated]
    
    def update(self, request, pk=None, *args, **kwargs):
        instance = self.get_object()
        data = {
            "amount":  request.data.get("amount"),
            }
        print("shady amount: " ,data)
        context={'request': request}
        serializer = self.serializer_class(
            instance=instance,
            data= data,
            partial=True,
            context = context,
        )
        if serializer.is_valid():
            serializer.save()
            # return Response(
            #     # data=serializer.data,
            #     status=status.HTTP_201_CREATED,
            # )
            return Response(
                {
                "status":status.HTTP_204_NO_CONTENT,
                "message": "Success Updated",
                "data": data,
            })
        else:
            return Response(
                data=serializer.errors,
                status=status.HTTP_400_BAD_REQUEST,
            )
    
    def get_queryset(self):
        return LineInCart.objects.filter(cart__in= Cart.objects.filter(customer=self.request.user))


### https://stackoverflow.com/questions/69210993/django-rest-framework-ordering-by-count-of-filtered-pre-fetched-related-objects