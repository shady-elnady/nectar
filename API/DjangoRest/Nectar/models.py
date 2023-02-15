from django.db import models
from django.utils.text import slugify
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
import calendar

from .methods import upload_to, uploadSVG_to

# Create your models here.


class BaseModel(models.Model):
    created_date= models.DateTimeField(
        auto_now_add=True,
        editable=False,
        verbose_name=_("Created Date"),
    )
    last_updated= models.DateTimeField(
        auto_now=True,
        editable=False,
        blank=True,
        null=True,
        verbose_name=_("Last Update"),
    )

    class Meta:
        abstract= True


class BaseModelName(models.Model):
    name= models.CharField(
        max_length= 100,
        primary_key= True,
        verbose_name= _("Name"),
    )

    @property
    def slug(self) -> str:
        return slugify(f"{self.name}")

    def __str__(self) -> str:
        return f"{self.name}"

    def __decode__(self) -> str:
        return f"{self.name}"
    
    # def get_absolute_url(self):
    #     return reverse("Vegetable:vegetable_detail", args=[self.slug])

    class Meta:
        abstract= True


class BaseModelNative(BaseModelName):
    native= models.CharField(
        max_length=20,
        unique=True,
        null=True,
        blank=True,
        verbose_name=_("Native"),
    )

    class Meta:
        abstract= True


class BaseModelImage(BaseModelName):  ########## 
    image= models.ImageField(
        upload_to= upload_to,
        default= "images/{instance.__class__.__name__}/default.jpg",
        null= True,
        blank= True,
        verbose_name= _("Image"),
    )

    class Meta:
        abstract= True


class BaseModelImageOnly(models.Model):
    image= models.ImageField(
        upload_to= upload_to,
        default= "images/{instance.__class__.__name__}/default.jpg",
        null= True,
        blank= True,
        verbose_name= _("Image"),
    )

    @property
    def slug(self):
        return slugify(f"{self.pk}")

    def __str__(self):
        return f"{self.pk}"

    def __decode__(self):
        return f"{self.pk}"
    
    # def get_absolute_url(self):
    #     return reverse("Vegetable:vegetable_detail", args=[self.slug])

    class Meta:
        abstract= True


class BaseModelNameSVG(BaseModelName):
    svg_img= models.ImageField(
        upload_to= uploadSVG_to,
        default= "svg/{instance.__class__.__name__}/default.svg",
        null= True,
        blank= True,
        verbose_name= _("SVG Image"),
    )

    class Meta:
        abstract= True


class BaseModelSVG(models.Model):
    svg_img= models.ImageField(
        upload_to= uploadSVG_to,
        default= "svg/{instance.__class__.__name__}/default.svg",
        null= True,
        blank= True,
        verbose_name= _("SVG Image"),
    )

    class Meta:
        abstract= True

########################################################################


class WeekDays(models.TextChoices):
    Saturday= "Sat", _(calendar.day_name[0])
    Sunday= "Sun", _(calendar.day_name[1])
    Monday= "Mon", _(calendar.day_name[2])
    Tuesday= "Tue", _(calendar.day_name[3])
    Wednesday= "Wed", _(calendar.day_name[4])
    Thursday= "Thu", _(calendar.day_name[5])
    Friday= "Fri", _(calendar.day_name[6])



class Scores(models.TextChoices):
    A= "A", "⭐"
    B= "B", "⭐⭐"
    C= "C", "⭐⭐⭐"
    D= "D", "⭐⭐⭐⭐"
    E= "E", "⭐⭐⭐⭐⭐"
    F= "F", "⭐⭐⭐⭐⭐⭐"
    G= "G", "⭐⭐⭐⭐⭐⭐⭐"
    H= "H", "⭐⭐⭐⭐⭐⭐⭐⭐"
    I= "I", "⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    J= "J", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    K= "K", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    L= "L", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    M= "M", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    N= "N", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"
    O= "O", "⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐"




