from django.contrib import admin

from .models import Cart, LineInCart

# # Register your models here.

 
class LineInCartAdmin(admin.StackedInline):
    model = LineInCart
 
@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    inlines = [LineInCartAdmin]
 
    class Meta:
       model = Cart
 
@admin.register(LineInCart)
class LineInCartAdmin(admin.ModelAdmin):
    pass