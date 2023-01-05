from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from guardian.shortcuts import assign_perm

from Lab.models import BaseModelImage, BaseModelName

# Create your models here.


class Vegetable(BaseModelName, BaseModelImage):
    availability = models.CharField(max_length=30, verbose_name=_("Availability"),null=True)
    price = models.FloatField(verbose_name=_("Price"),)
    describtion = models.TextField(max_length=1000, verbose_name=_("Describtion"),)
    reviews = models.SmallIntegerField(verbose_name=_("Reviews"),null=True)
    star = models.SmallIntegerField(verbose_name=_("Star"),null=True)
    
    def get_absolute_url(self):
        return reverse("Vegetable:vegetable_detail", args=[self.slug])

    class Meta:
        permissions = [
            ("can_add_new_project", "can add new project"),
            ("dg_view_project", "OLP can view project"),
        ]
        verbose_name = _("Vegetable")
        verbose_name_plural = _("Vegetables")



class VegetableImage(BaseModelName, BaseModelImage):
    vegetable = models.ForeignKey(Vegetable, on_delete=models.CASCADE, verbose_name=_("Vegetable"),)

    class Meta:
        verbose_name = _("Vegetable Image")
        verbose_name_plural = _("Vegetable Images")



# @receiver(post_save, sender=Vegetable)
# def set_permission(sender, instance, **kwargs):
#     assign_perm("dg_view_project", instance.user, instance)