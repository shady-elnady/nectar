from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _


from Nectar.models import BaseModelImage
# Create your models here.



class Brand(BaseModelImage):
    class Meta:
        verbose_name= _("Brand")
        verbose_name_plural= _("Brands")



class Category(BaseModelImage):
    category_parent= models.ForeignKey(
        "self",
        null= True,
        blank= True,
        limit_choices_to= {"category_parent__isnull": True},
        on_delete= models.CASCADE,
        related_name= _("Sub_Categories+"),
        verbose_name= _("Category Parent"),
    )

    class Meta:
        verbose_name= _("Category")
        verbose_name_plural= _("Categories")