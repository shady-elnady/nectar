from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelName
# Create your models here.



class Department(BaseModelName):
    products = models.ManyToManyField(
        "Product.Product",
        verbose_name= _("Products"),
    )

    class Meta:
        verbose_name= _("Category")
        verbose_name_plural= _("Categories")