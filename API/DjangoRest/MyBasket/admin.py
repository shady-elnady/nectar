from django.contrib import admin

from .models import MyBasket, MyBasketItem

# # Register your models here.

 
class MyBasketItemAdmin(admin.StackedInline):
    model = MyBasketItem
 
@admin.register(MyBasket)
class MyBasketAdmin(admin.ModelAdmin):
    inlines = [MyBasketItemAdmin]
 
    class Meta:
       model = MyBasket
 
@admin.register(MyBasketItem)
class MyBasketItemAdmin(admin.ModelAdmin):
    pass