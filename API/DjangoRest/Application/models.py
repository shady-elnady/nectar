from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _

from Nectar.models import BaseModelNative

# Create your models here.


class Platform(BaseModelNative):

    class Meta:
        verbose_name= _("Platform")
        verbose_name_plural= _("Platforms")


class Application(BaseModelNative):
    platform = models.ForeignKey(
        Platform,
        on_delete= models.CASCADE,
        related_name= _("Applications"),
        verbose_name= _("Platform"),
    )

    class Meta:
        verbose_name= _("Application")
        verbose_name_plural= _("Applications")
