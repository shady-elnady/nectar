from django.contrib import admin
from django.apps import apps
from guardian.admin import GuardedModelAdmin

from .models import Vegetable, VegetableImage

# # Register your models here.

 
class VegetableImageAdmin(admin.StackedInline):
    model = VegetableImage
 
@admin.register(Vegetable)
class VegetableAdmin(admin.ModelAdmin):
    inlines = [VegetableImageAdmin]
 
    class Meta:
       model = Vegetable
 
@admin.register(VegetableImage)
class VegetableImageAdmin(admin.ModelAdmin):
    pass



# Register your models here.

models = apps.get_models()

class ProjectAdmin(GuardedModelAdmin):
    pass



for model in models:
    try:
        admin.site.register(model, ProjectAdmin)
    except admin.sites.AlreadyRegistered:
        pass
