from django.db import models

# Create your models here.
from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

# from polymorphic.models import PolymorphicModel

from Tools.models import BaseModelName, BaseModelNative, Measurements

# Create your models here.


class Category(BaseModelName):
    category_parent= models.ForeignKey(
        "self",
        null= True,
        blank= True,
        limit_choices_to= {"category_parent__isnull": True},
        on_delete= models.CASCADE,
        related_name= _("Sub Categories+"),
        verbose_name= _("Category Parent"),
    )

    class Meta:
        verbose_name= _("Category")
        verbose_name_plural= _("Categories")


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


class Unit(PolymorphicModel, BaseModelNative):
    
    symbol= models.CharField(
        max_length= 5,
        unique= True,
        verbose_name= _("Symbol"),
    )
    measurement= models.CharField(
        max_length= 2,
        choices= Measurements.choices,
        verbose_name= _("Measurement"),
    )
    convert_to= models.ManyToManyField(
        "self",
        through= "UnitConvert",
        verbose_name= _("Convert To"),
    )

    class Meta:
        verbose_name= _("Unit")
        verbose_name_plural= _("Units")

    # def get_absolute_url(self):
    #     return reverse("_detail", kwargs={"pk": self.pk})



class OriginalUnit(Unit):
    class InternationalSystemUnits(models.TextChoices):
        CGS= "CGS"
        MKS= "MKS"

    international_system_unit= models.CharField(
        max_length= 4,
        choices= InternationalSystemUnits.choices,
        verbose_name= _("International System Unit"),
    )

    class Meta:
        verbose_name= _("Original Unit")
        verbose_name_plural= _("Original Units")


class ComplexUnit(Unit):
    prefix= models.ForeignKey(
        Prefix,
        null= True,
        blank= True,
        on_delete= models.CASCADE,
        related_name= _("Units"),
        verbose_name= _("Prefix"),
    )
    power= models.SmallIntegerField(
        null= True,
        blank= True,
        verbose_name= _("Power"),
    )
    multiply= models.ForeignKey(
        Unit,
        null= True,
        blank= True,
        on_delete= models.CASCADE,
        related_name= _("Multiply_Units"),
        verbose_name= _("Multiply"),
    )
    divide= models.ForeignKey(
        Unit,
        null= True,
        blank= True,
        on_delete= models.CASCADE,
        related_name= _("Divide_Units"),
        verbose_name= _("Divide"),
    )

    class Meta:
        verbose_name= _("Complex Unit")
        verbose_name_plural= _("Complex Units")


class UnitConvert(models.Model):
    unit= models.ForeignKey(
        Unit,
        on_delete= models.CASCADE,
        verbose_name= _("Unit"),
    )
    to_unit= models.ForeignKey(
        Unit,
        on_delete= models.CASCADE,
        related_name= _("Coverted_Units"),
        verbose_name= _("to Unit"),
    )
    equation= models.CharField(
        max_length= 20,
        null= True,
        blank= True,
        verbose_name= _("Equation"),
    )

    def slug(self):
        return slugify(f"{self.unit.symbol} to {self.to_unit.symbol}")

    def __str__(self):
        return f"{self.unit.symbol} to {self.to_unit.symbol}"

    def __decode__(self):
        return f"{self.unit.symbol} to {self.to_unit.symbol}"

    class Meta:
        unique_together= [
            ["unit", "to_unit"],
        ]
        verbose_name= _("Unit Convert")
        verbose_name_plural= _("Units Convert")
