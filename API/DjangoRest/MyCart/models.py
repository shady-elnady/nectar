from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from django.conf import settings
from Nectar.models import BaseModel

from Nectar.models import PaymentMethod
from Product.models import Product

# Create your models here.


class Coupon(BaseModel):
    promo_code = models.AutoField(
        primary_key= True,
        verbose_name= _("Promo Coupon Code"),
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

    def __str__(self):
        return f"{self.promo_code}"
    
    @property
    def slug(self):
        return slugify(f"{self.promo_code}")

    def __decode__(self):
        return f"{self.promo_code}"
    
    class Meta:
        verbose_name= _("Coupon")
        verbose_name_plural= _("Coupons")


class MyCart(BaseModel):
    id = models.AutoField(
        primary_key= True,
        verbose_name= _("ID"),
    )
    customer = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        to_field= 'username',
        related_name= _ ("My_Carts"),
        verbose_name= _("Customer"),
    ) 
    my_cart_items = models.ManyToManyField(
        Product,
        through= "MyCartItem",
        verbose_name= _("My Cart Items"),
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
    
    @property
    def Total_MyCart_Cost(self) -> float:
        total = 0
        for myCartItem in self.my_cart_items.all():
            total += myCartItem.my_cart_item_price
        if self.promo_code:
            total -= self.promo_code.discount
        return total
    
    @property
    def slug(self):
        return slugify(f"{self.id}_{self.customer.username}")

    def __str__(self) -> str:
        return f"{self.id}_{self.customer.username}"

    def __decode__(self) -> str:
        return f"{self.id}_{self.customer.username}"
    
    class Meta:
        verbose_name= _("My Cart")
        verbose_name_plural= _("My Carts")


class MyCartItem(BaseModel):
    my_cart= models.ForeignKey(
        MyCart,
        on_delete= models.CASCADE,
        related_name= "My_Cart_Items",
        verbose_name= _("My Cart"),
    )
    product= models.ForeignKey(
        Product,
        on_delete= models.CASCADE,
        related_name= "my_cart",
        verbose_name= _("Product"),
    ) 
    amount = models.PositiveSmallIntegerField(
        default= 1,
        verbose_name= _("Amount"),
    )

    @property
    def my_cart_item_price(self) -> float:
        return self.product.price * self.amount
    
    @property
    def slug(self):
        return slugify(f"{self.my_cart.id}-{self.my_cart.customer.username}->{self.product.name}")

    def __str__(self) -> str:
        return f"{self.my_cart.id}-{self.my_cart.customer.username}->{self.product.name}"

    def __decode__(self) -> str:
        return f"{self.my_cart.id}-{self.my_cart.customer.username}->{self.product.name}"
    
    class Meta:
        unique_together = [
            [
                "my_cart",
                "product",
            ]
        ]
        verbose_name= _("My Cart Item")
        verbose_name_plural= _("My Cart Items")