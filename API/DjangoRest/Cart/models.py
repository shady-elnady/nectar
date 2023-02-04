from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from django.conf import settings

from Nectar.models import PaymentMethod
from Product.models import Product

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


class Cart(models.Model):
    customer = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        to_field= 'username',
        verbose_name= _("Customer"),
    ) 
    lines_in_cart = models.ManyToManyField(
        Product,
        through= "LineInCart",
        verbose_name= _("Lines In Cart"),
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
    
    @property
    def Total_Cost(self) -> float:
        total = 0
        for lineInCart in self.Lines_In_Cart.all():
            total += lineInCart.total_line_price
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
        verbose_name= _("Cart")
        verbose_name_plural= _("Carts")


class LineInCart(models.Model):
    cart= models.ForeignKey(
        Cart,
        on_delete= models.CASCADE,
        related_name= "Lines_In_Cart",
        verbose_name= _("Cart"),
    )
    product= models.ForeignKey(
        Product,
        on_delete= models.CASCADE,
        related_name= "Lines_In_Carts",
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
        return slugify(f"{self.cart.pk}_{self.product.name}")

    def __str__(self) -> str:
        return f"{self.cart.pk}_{self.product.name}"

    def __decode__(self) -> str:
        return f"{self.cart.pk}_{self.product.name}"
    
    class Meta:
        unique_together = [
            [
                "cart",
                "product",
            ]
        ]
        verbose_name= _("Line In Cart")
        verbose_name_plural= _("Lines In Cart")