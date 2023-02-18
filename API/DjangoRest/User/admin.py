from django.contrib import admin


from .models import User
from Product.models import FavoriteProduct
from Notifecation.models import Notifecation
# Register your models here.


 
class NotifecationAdmin(admin.StackedInline):
    model = Notifecation
 

class FavoriteProductAdmin(admin.StackedInline):
    model = FavoriteProduct
 

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    inlines = [FavoriteProductAdmin, NotifecationAdmin]
 
    class Meta:
       model = User

@admin.register(Notifecation)
class NotifecationAdmin(admin.ModelAdmin):
    pass

@admin.register(FavoriteProduct)
class FavoriteProductAdmin(admin.ModelAdmin):
    pass
