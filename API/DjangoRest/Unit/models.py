from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelNative, Measurements

# Create your models here.


class Prefix(BaseModelNative):
    symbol= models.CharField(
        max_length= 2,
        unique= True,
        verbose_name= _("Symbol"),
    )
    power= models.IntegerField(
        verbose_name= _("Power"),
    )

    class Meta:
        verbose_name= _("Prefix")
        verbose_name_plural= _("Prefixes")


class Unit(BaseModelNative):
    
    symbol= models.CharField(
        max_length= 5,
        unique= True,
        verbose_name= _("Symbol"),
    )
    prefix= models.ForeignKey(
        Prefix,
        null= True,
        blank= True,
        on_delete= models.CASCADE,
        related_name= _("Units"),
        verbose_name= _("Prefix"),
    )
    base_unit= models.ForeignKey(
        "self",
        null= True,
        blank= True,
        limit_choices_to= {"prefix__isnull": True},
        on_delete= models.CASCADE,
        related_name= _("Sub_Units"),
        verbose_name= _("Base Unit"),
    )
    measurement= models.CharField(
        null= True,
        blank= True,
        max_length= 2,
        choices= Measurements.choices,
        verbose_name= _("Measurement"),
    )

    class Meta:
        verbose_name= _("Unit")
        verbose_name_plural= _("Units")

    # def get_absolute_url(self):
    #     return reverse("_detail", kwargs={"pk": self.pk})