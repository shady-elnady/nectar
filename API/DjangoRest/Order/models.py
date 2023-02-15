from django.db import models
from django.conf import settings
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModel
from Location.models import Address
from Payment.models import Currency, PaymentMethod

# Create your models here.

class PromoCode(BaseModel):
    coupon = models.AutoField(
        primary_key= True,
        verbose_name= _("Coupon"),
    )
    discount = models.FloatField(
        verbose_name= _("Discount"),
    )
    end_time = models.DateTimeField(
        blank=True,
        null=True,
        editable= True,
        verbose_name=_("End Time"),
    )
    
    @property
    def slug(self):
        return slugify(f"{self.coupon}")

    def __str__(self):
        return f"{self.coupon}"

    def __decode__(self):
        return f"{self.coupon}"
    
    class Meta:
        verbose_name= _("Promo Code")
        verbose_name_plural= _("Promo Codes")



class Delivery(models.Model):
    delivery_method = models.CharField(
        max_length= 20,
        primary_key= True,
        verbose_name= _("Delivery Method"),
    )    
    delivery_cost = models.FloatField(
        null= True,
        blank= True,
        verbose_name= _("Delivery Cost"),
    )

    @property
    def slug(self):
        return slugify(f"{self.delivery_method}")

    def __str__(self) -> str:
        return f"{self.delivery_method}"

    def __str__(self):
        return f"{self.delivery_method}"

    class Meta:
        verbose_name= _("Delivery")
        verbose_name_plural= _("Deliveries")



class Order(models.Model):
    my_cart = models.OneToOneField(
        to= "MyCart.MyCart",
        on_delete= models.CASCADE,
        related_name= _("Order"),
        verbose_name= _("My Cart"),
    )
    promo_code = models.ForeignKey(
        PromoCode,
        on_delete=models.SET_NULL,
        blank= True,
        null= True,
        verbose_name= _("Promo Code"),
    )
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
    delivery = models.ForeignKey(
        Delivery,
        on_delete= models.SET_NULL,
        related_name= _('Shipping_Orders'),
        blank= True,
        null= True,
        verbose_name= _("Delivery")
    )
    billing_address = models.ForeignKey(
        Address,
        related_name= _('Billing_Orders'),
        on_delete= models.SET_NULL,
        blank= True,
        null= True,
        verbose_name= _("Billing Address")
    ) # عنوان وصول الفواتير
    total_order_cost = models.FloatField(
        editable= False,
        verbose_name= _("Total Order Cost"),
    )
    delvirey_cost = models.FloatField(
        editable= False,
        verbose_name= _("Delivery Cost"),
    )
    payments = models.ManyToManyField(
        PaymentMethod,
        through= "Payment",
        verbose_name= _("Payments"),
    )
    received_date = models.DateTimeField(
        auto_now_add= True,
        editable= True,
        blank=True,
        verbose_name=_("Received Date"),
    ) # تاريخ الاستلام

    @property
    def Final_Order_Cost(self) :
        return self.total_order_cost-(self.total_order_cost * 100 / self.promo_code.discount)-self.delvirey_cost
    
    @property
    def slug(self):
        return slugify(f"{self.pk}_{self.my_cart.customer.username}")

    def __str__(self) :
        return f"{self.pk}_{self.my_cart.customer.username}"
    
    def save(self, *args, **kwargs):
        self.delvirey_cost = self.delivery.delivery_cost
        self.total_order_cost = self.my_cart.Total_MyCart_Cost()
        super(Order, self).save(*args, **kwargs)
    
    class Meta:
        verbose_name= _("Order")
        verbose_name_plural= _("Orders")



class Payment(models.Model):    
    order= models.ForeignKey(
        Order,
        on_delete= models.CASCADE,
        verbose_name= _("Order"),
    )
    payment_method= models.ForeignKey(
        PaymentMethod,
        on_delete= models.CASCADE,
        verbose_name= _("Payment Method"),
    )
    charge_id= models.CharField(
        max_length=50,
        unique= True,
        verbose_name= _("Charge ID"),
    )
    currency= models.ForeignKey(
        Currency,
        default= settings.DEFAULT_CURRENCY,
        on_delete= models.CASCADE,
        related_name= _("Payments"),
        verbose_name= _("Currency"),
    )
    amount= models.FloatField(
        verbose_name= _("Amount"),
    )
    payment_time= models.DateTimeField(
        auto_now_add= True,
        editable= False,
        verbose_name= _("Payment Time"),
    )
    
    @property
    def slug(self):
        return slugify(f"{self.charge_id}")

    def __str__(self) -> str:
        return f"{self.charge_id}"

    def __str__(self):
        return f"{self.charge_id}"
    
    class Meta:
        unique_together = (
            "order",
            "payment_method",
        )
        verbose_name= _("Payment")
        verbose_name_plural= _("Payments")


class Refund(BaseModel):
    order = models.OneToOneField(
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
        return slugify(f"Refund -> {self.order.pk}")

    def __str__(self) -> str:
        return f"Refund -> {self.order.pk}"

    def __str__(self):
        return f"Refund -> {self.order.pk}"

    class Meta:
        verbose_name= _("Refund")
        verbose_name_plural= _("Refunds")
