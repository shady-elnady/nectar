from django.contrib import admin
from django.apps import apps

# from guardian.admin import GuardedModelAdmin

# Register your models here.

app_config = apps.get_app_config('Utils') # Replace your_app_name it is just a placeholder
models = apps.get_models()


for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass


