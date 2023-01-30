from rest_framework.response import Response
from rest_framework import status
from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated 

# from django_filters import DjangoFilterBackend
# from rest_framework import viewsets, filters

from .models import Card, Coupon, LineInCard
from .Serializer import CardSerializer, LineInCardSerializer, CouponSerializer 


class CardViewSet(ModelViewSet):
    queryset = Card.objects.all()
    serializer_class = CardSerializer
    # filter_backends = (DjangoFilterBackend, filters.OrderingFilter)
    ordering_fields = ('created_at')
    permission_classes = [ IsAuthenticated]

    # def perform_create(self, serializer):
    #     serializer.save(user_id=self.request.user)
    
    def get_queryset(self):
        querySet = Card.objects.all()
        is_finished = self.request.query_params.get('is_finished')
        if (is_finished ):
            return querySet.filter( is_finished = is_finished).order_by('created_at')
            # return querySet.filter(customer=self.request.user, is_finished = is_finished).order_by('created_at')
        return querySet



class CouponViewSet(ModelViewSet):
    queryset = Coupon.objects.all()
    serializer_class = CouponSerializer
    permission_classes = [IsAuthenticated]


class LineInCardViewSet(ModelViewSet):
    queryset = LineInCard.objects.all()
    serializer_class = LineInCardSerializer
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


### https://stackoverflow.com/questions/69210993/django-rest-framework-ordering-by-count-of-filtered-pre-fetched-related-objects