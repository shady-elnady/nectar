from django.db.models.signals import post_save
from django.dispatch import receiver
from django.apps import apps
from django.contrib.auth import get_user_model
from django.core.signals import setting_changed
from django.test import override_settings

from .models import User, Profile


# @override_settings(
#     AUTH_USER_MODEL = 'User.User'
# )

# @receiver(setting_changed)
# def user_model_swapped(**kwargs):
#     if kwargs['setting'] == 'AUTH_USER_MODEL':
#         apps.clear_cache()
#         from .models import User
#         User = get_user_model()


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        profile = Profile.objects.create(user=instance)
        profile.save()


# @receiver(post_save, sender=User)
# def save_profile(sender, instance, **kwargs):
#     instance.Profile.save()
