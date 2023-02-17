from django.db import models
from django.conf import settings
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse

from Nectar.models import BaseModelImage, BaseModelImageOnly 
from Unit.models import Unit 
from Payment.models import Currency
from Category.models import Brand, Category

# Create your models here.



class Product(BaseModelImage):
    nutritions = models.CharField(
        max_length= 30,
        null= True,
        blank =True,
        verbose_name= _("Nutritions"),
    )
    amount = models.FloatField(
        null= True,
        blank =True,
        default= 1,
        verbose_name= _("Amount"),
    )
    reviews = models.FloatField(
        null= True,
        blank =True,
        verbose_name= _("Reviews"),
    )    
    brand= models.ForeignKey(
        Brand,
        on_delete= models.CASCADE,
        related_name= _("Products"),
        verbose_name= _("Brand"),
    )
    category= models.ForeignKey(
        Category,
        limit_choices_to= {"category_parent__isnull": False},
        on_delete= models.CASCADE,
        related_name= _("Products"),
        verbose_name= _("Category"),
    )
    unit= models.ForeignKey(
        Unit,
        on_delete= models.CASCADE,
        related_name= _("Measurment_Products"),
        verbose_name= _("Unit"),
    )
    serial= models.CharField(
        max_length= 50,
        unique= True,
        verbose_name= _("Serial No."),
    )
    currency= models.ForeignKey(
        Currency,
        default= settings.DEFAULT_CURRENCY,
        on_delete= models.CASCADE,
        related_name= _("Products"),
        verbose_name= _("Currency"),
    )
    price= models.FloatField(
        verbose_name= _("Price"),
    ) 
    detail= models.TextField(
        blank= True,
        null= True,
        verbose_name= _("Detail"),
    )
    is_favorite = models.BooleanField(
        default= False,
        verbose_name= _("is Favorite"),
    )
    
    # def get_absolute_url(self):
    #     return reverse("Product:Product_Detail", args=[self.slug])

    class Meta:
        verbose_name= _("Product")
        verbose_name_plural= _("Products")



class ProductImage(BaseModelImageOnly):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name= _("product_images"),
        verbose_name=_("Product"),
    )

    class Meta:
        verbose_name = _("Product Image")
        verbose_name_plural = _("Product Images")


class FavoriteProduct(models.Model):
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name= _("Favorite_products"),
        verbose_name=_("Product"),
    )
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name= _("Favorite_products"),
        verbose_name= _("User"),
    )

    @property
    def slug(self) -> str:
        return slugify(f"{self.pk}")

    def __str__(self) -> str:
        return f"{self.user.username} > {self.product.name}"

    def __decode__(self) -> str:
        return f"{self.user.username} > {self.product.name}"

    class Meta:
        unique_together = (
            "product",
            "user",
        )
        verbose_name = _("Favorite Product")
        verbose_name_plural = _("Favorite Products")



# @receiver(post_save, sender=Vegetable)
# def set_permission(sender, instance, **kwargs):
#     assign_perm("dg_view_project", instance.user, instance)