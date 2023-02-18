from django.db import models
from django.conf import settings
from django.utils.text import slugify
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModel
from Product.models import Product

# Create your models here.


class MyCart(BaseModel):
    customer = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        to_field= 'username',
        # default= get_user_model(),
        related_name= _ ("My_Carts"),
        verbose_name= _("Customer"),
    ) 
    is_finished = models.BooleanField(
        default= False,
        verbose_name= _("is Finished"),
    )
    
    @property
    def Total_MyCart_Cost(self):
        total = 0
        for myCartItem in self.My_Cart_Items.all():
            total += myCartItem.My_Cart_Item_Price
        return total
    
    @property
    def slug(self):
        return slugify(f"Cart > {self.customer.username}")

    def __str__(self) -> str:
        return f"Cart > {self.customer.username}"

    def __decode__(self) -> str:
        return f"Cart > {self.customer.username}"
    
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
    amount = models.FloatField(
        default= 1,
        verbose_name= _("Amount"),
    )

    @property
    def My_Cart_Item_Price(self) :
        return self.product.price * self.amount
    
    @property
    def slug(self):
        return slugify(f"{self.my_cart.customer.username} > {self.product.name}")

    def __str__(self) -> str:
        return f"{self.my_cart.customer.username} > {self.product.name}"

    def __decode__(self) -> str:
        return f"{self.my_cart.customer.username} > {self.product.name}"
    
    class Meta:
        unique_together = [
            [
                "my_cart",
                "product",
            ]
        ]
        verbose_name= _("My Cart Item")
        verbose_name_plural= _("My Cart Items")