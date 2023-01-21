from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from django.conf import settings

from Nectar.models import PaymentMethod
from Product.models import Product
from Unit.models import Unit

# Create your models here.



class Coupon(models.Model):
    promo_code = models.CharField(
        primary_key= True,
        max_length=15,
    )
    discount = models.FloatField(
        verbose_name= _("Discount"),
    )

    def __str__(self):
        return self.promo_code
    
    @property
    def slug(self):
        return slugify(f"{self.promo_code}")

    def __decode__(self):
        return f"{self.promo_code}"
    
    class Meta:
        verbose_name= _("Coupon")
        verbose_name_plural= _("Coupons")


class Card(models.Model):
    customer = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        to_field= 'username',
        verbose_name= _("Customer"),
    ) 
    lines_in_card = models.ManyToManyField(
        Product,
        through= "LineInCard",
        verbose_name= _("Lines In Card"),
    )
    payment_method= models.CharField(
        max_length= 2,
        null= True,
        blank= True,
        choices= PaymentMethod.choices,
        verbose_name= _("Payment Method"),
    )
    promo_code = models.ForeignKey(
        Coupon,
        on_delete=models.SET_NULL,
        blank= True,
        null= True,
        verbose_name= _("Promo Code"),
    )
    is_finished = models.BooleanField(
        default= False,
        verbose_name= _("is Finished"),
    )
    created_at = models.DateTimeField(
        auto_now_add= True,
        verbose_name=_("Cearted At"),
    )

    # @property
    # def total_cost(self) -> float:
    #     total = 0
    #     for lineInCard in self.lines_in_card.all():
    #         total += lineInCard.total_line_price
    #     if self.promo_code:
    #         total -= self.promo_code.discount
    #     return total
    
    @property
    def Total_Cost(self) -> float:
        total = 0
        for lineInCard in self.Lines_In_Card.all():
            total += lineInCard.total_line_price
        if self.promo_code:
            total -= self.promo_code.discount
        return total
    
    @property
    def slug(self):
        return slugify(f"{self.pk}_{self.customer.username}")

    def __str__(self) -> str:
        return f"{self.pk}_{self.customer.username}"

    def __decode__(self) -> str:
        return f"{self.pk}_{self.customer.username}"
    
    class Meta:
        verbose_name= _("Card")
        verbose_name_plural= _("Cards")


class LineInCard(models.Model):
    card= models.ForeignKey(
        Card,
        on_delete= models.CASCADE,
        related_name= "Lines_In_Card",
        verbose_name= _("Card"),
    )
    product= models.ForeignKey(
        Product,
        on_delete= models.CASCADE,
        related_name= "In_Cards",
        verbose_name= _("Product"),
    ) 
    amount = models.SmallIntegerField(
        verbose_name= _("Amount"),
    )

    @property
    def total_line_price(self) -> float:
        return self.product.price * self.amount
    
    @property
    def slug(self):
        return slugify(f"{self.card.pk}_{self.product.name}")

    def __str__(self) -> str:
        return f"{self.card.pk}_{self.product.name}"

    def __decode__(self) -> str:
        return f"{self.card.pk}_{self.product.name}"
    
    class Meta:
        unique_together = [
            [
                "card",
                "product",
            ]
        ]
        verbose_name= _("Line In Card")
        verbose_name_plural= _("Lines In Card")