from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from Nectar.models import BaseModel

from Location.models import Address
from MyCart.models import MyCart

# Create your models here.


class Order(models.Model):
    serial_no= models.CharField(
        max_length= 20,
        primary_key= True,
        verbose_name= _("Serial Number"),
    )
    my_cart = models.OneToOneField(
        MyCart,
        on_delete= models.CASCADE,
        related_name= _("Order"),
        verbose_name= _("My Cart"),
    )
    received_date = models.DateTimeField(
        auto_now_add= True,
        editable= True,
        blank=True,
        verbose_name=_("Received Date"),
    ) # تاريخ الاستلام
    is_received = models.BooleanField(
        default= False,
        verbose_name= _("is Received"),
    ) # تم الاستلام
    is_refund_requested = models.BooleanField(
        default= False,
        verbose_name= _("is Refund Requested"),
    ) # هو طلب استرداد
    is_refund_granted = models.BooleanField(
        default= False,
        verbose_name= _("is Refund Granted"),
    ) # تم رد الأموال الممنوحة
    shipping_address = models.ForeignKey(
        Address,
        related_name= _('Shipping_Orders'),
        on_delete= models.SET_NULL,
        blank= True,
        null= True,
        verbose_name= _("Shipping Address")
    ) # عنوان الشحن
    billing_address = models.ForeignKey(
        Address,
        related_name= _('Billing_Orders'),
        on_delete= models.SET_NULL,
        blank= True,
        null= True,
        verbose_name= _("Billing Address")
    ) # عنوان وصول الفواتير
    
    @property
    def slug(self):
        return slugify(f"{self.serial_no}_{self.cart.customer.username}")

    def __str__(self) -> str:
        return f"{self.serial_no}_{self.cart.customer.username}"

    def __str__(self):
        return f"{self.serial_no}_{self.cart.customer.username}"

    class Meta:
        verbose_name= _("Order")
        verbose_name_plural= _("Orders")


class Refund(BaseModel):
    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        related_name= _("Refund"),
        verbose_name= _("Order"),
    )
    reason = models.TextField(
        null= True,
        blank= True,
        verbose_name= _("Reason"),
    )
    is_accepted = models.BooleanField(
        default=False,
        verbose_name= _("is Accepted"),
    )

    @property
    def slug(self):
        return slugify(f"{self.serial_no}_{self.cart.customer.username}")

    def __str__(self) -> str:
        return f"{self.serial_no}_{self.cart.customer.username}"

    def __str__(self):
        return f"{self.serial_no}_{self.cart.customer.username}"

    class Meta:
        verbose_name= _("Refund")
        verbose_name_plural= _("Refunds")

