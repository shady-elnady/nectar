from django.contrib import admin

from .models import MyCart, MyCartItem

# # Register your models here.

 
class MyCartItemAdmin(admin.StackedInline):
    model = MyCartItem
 
@admin.register(MyCart)
class MyCartAdmin(admin.ModelAdmin):
    inlines = [MyCartItemAdmin]
 
    class Meta:
       model = MyCart
 
@admin.register(MyCartItem)
class MyCartItemAdmin(admin.ModelAdmin):
    pass