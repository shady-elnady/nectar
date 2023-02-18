from django.db import models
from django.conf import settings
from django.utils.text import slugify
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _


# Create your models here.


class Notifecation(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete= models.CASCADE,
        default= get_user_model(),
        related_name= _("Notifecations"),
        verbose_name= _("User"),
    )
    message = models.TextField(
        max_length= 300,
        verbose_name= _("Message"),
    )

    @property
    def slug(self) -> str:
        return slugify(f"{self.pk}")

    def __str__(self) -> str:
        return f"{self.user.username} > {self.product.name}"

    def __decode__(self) -> str:
        return f"{self.user.username} > {self.product.name}"

    class Meta:
        verbose_name= _("Notifecation")
        verbose_name_plural= _("Notifecations")
