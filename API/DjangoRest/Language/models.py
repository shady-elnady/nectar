from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelNative

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

    class Meta:
        verbose_name= _("Language")
        verbose_name_plural= _("Languages")
