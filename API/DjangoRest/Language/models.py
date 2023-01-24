from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelNative
from Application.models import Application

# Create your models here.


class Language(BaseModelNative):
    iso_639_1= models.CharField(
        max_length= 5,
        unique= True,
        verbose_name= _("ISO_639_1"),
    )
    is_rtl = models.BooleanField(
        default= False,
        verbose_name= _("is RightToLeft"),
    )
    applicatins_support = models.ManyToManyField(
        Application,
        related_name= _("Language_Supported"),
       verbose_name= _("Applicatins Support"),        
    )

    class Meta:
        verbose_name= _("Language")
        verbose_name_plural= _("Languages")
