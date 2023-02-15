from django.contrib import admin

from .models import Order, Payment 

# # Register your models here.

 
class PaymentAdmin(admin.StackedInline):
    model = Payment
 
@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    inlines = [PaymentAdmin]
    class Meta:
       model = Order
 
@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    pass