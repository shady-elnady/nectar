from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from django.conf import settings

from Nectar.models import BaseModel
from Product.models import Product

# Create your models here.


class MyBasket(BaseModel):
    customer = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        related_name= _("Have_Baskets"),
        to_field= 'username',
        verbose_name= _("Customer"),
    )

    @property
    def Total_My_Basket_Cost(self) -> float:
        total = 0
        for My_Basket_Item in self.My_Basket_Items.all():
            total += My_Basket_Item.total_item_price
        return total

    @property
    def slug(self):
        return slugify(f"{self.pk} - {self.customer.username}")

    def __str__(self):
        return f"{self.pk} - {self.customer.username}"

    def __decode__(self):
        return f"{self.pk} - {self.customer.username}"

    class Meta:
        verbose_name = _("MyBasket")
        verbose_name_plural = _("MyBaskets")



class MyBasketItem(BaseModel):
    my_basket = models.ForeignKey(
        MyBasket,
        on_delete=models.CASCADE,
        related_name= _("My_Basket_Items"),
        verbose_name= _("My Basket"),
    )
    product = models.ForeignKey(
        Product,
        related_name= _("My_Basket"),
        on_delete=models.CASCADE,
        verbose_name= _("Product"),
    )
    amount = models.SmallIntegerField(
        verbose_name= _("Amount"),
    )

    @property
    def total_item_price(self) -> float:
        return self.product.price * self.amount

    @property
    def slug(self):
        return slugify(f"{self.my_basket.customer.username} -> {self.product.name}")

    def __str__(self):
        return f"{self.my_basket.customer.username} -> {self.product.name}"

    def __decode__(self):
        return f"{self.my_basket.customer.username} -> {self.product.name}"

    class Meta:
        unique_together = (
            "my_basket",
            "product",
        )
        verbose_name = _("MyBasket Item")
        verbose_name_plural = _("MyBasket Items")