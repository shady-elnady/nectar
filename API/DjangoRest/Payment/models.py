from django.db import models
from django.conf import settings
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelNative, PaymentMethod

# Create your models here.


class Currency(BaseModelNative):
    code= models.CharField(
        max_length= 3,
        unique= True,
        verbose_name= _("Code"),
    )
    emoji= models.CharField(
        max_length= 5,
        null= True,
        blank= True,
        verbose_name= _("Emoji"),
    )

    # def get_absolute_url(self):
        #     return reverse("_detail", kwargs={"pk": self.pk})

    class Meta:
        verbose_name= _("Currency")
        verbose_name_plural= _("Currencies")



# class Payment(models.Model):
    
#     payment_method= models.CharField(
#         max_length= 2,
#         choices= PaymentMethod.choices,
#         verbose_name= _("Payment Method"),
#     )
#     charge_id= models.CharField(
#         max_length=50,
#         unique= True,
#         verbose_name= _("Charge ID"),
#     )
#     currency= models.ForeignKey(
#         Currency,
#         default= settings.DEFAULT_CURRENCY,
#         on_delete= models.CASCADE,
#         related_name= _("Payments"),
#         verbose_name= _("Currency"),
#     )
#     amount= models.FloatField(
#         verbose_name= _("Amount"),
#     )
#     payment_time= models.DateTimeField(
#         auto_now_add= True,
#         editable= False,
#         verbose_name= _("Payment Time"),
#     )
    
#     class Meta:
#         verbose_name= _("Payment")
#         verbose_name_plural= _("Payments")


# TODO PAYMENT
# class Payment:
#     class PayMethod(models.TextChoices):
#         check= "Check"
#         PayPal= "PayPal"

#     payment_method= models.CharField(max_length=10, choices=PayMethod.choices)
#     customer= models.ForeignKey(Customer, on_delete=models.CASCADE)
#     payment_date= models.DateTimeField(auto_now_add= True)
#     amount= models.DecimalField(max_digits=5, decimal_places=2)  #  المبلغ
#     currency= models.ForeignKey(Currency, on_delete=models.CASCADE)

# TODO CURRENCY API
# https://m3o.com/account/keys

# API_key=  N2Q1OWUwNDctZDM4Ny00MDNkLWIxOGUtYWM1MTJlNGExYTUx

"""
    curl "https://api.m3o.com/v1/currency/Codes" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $M3O_API_TOKEN" \
    -d '{}'
"""

##  https://openexchangerates.org/account/app-ids
# api ID= 82775e187c684ecaa9efc98e7f0e9381