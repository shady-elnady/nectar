from django.apps import AppConfig
from django.core.signals import setting_changed



class UserConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'User'

    # def ready(self):
    #     from . import signals
