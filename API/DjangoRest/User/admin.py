from django.contrib import admin


from .models import User
from Product.models import FavoriteProduct
# Register your models here.

class FavoriteProductAdmin(admin.StackedInline):
    model = FavoriteProduct
 
@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    inlines = [FavoriteProductAdmin]
 
    class Meta:
       model = User
 
@admin.register(FavoriteProduct)
class FavoriteProductAdmin(admin.ModelAdmin):
    pass