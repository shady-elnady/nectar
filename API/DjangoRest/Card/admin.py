from django.contrib import admin

# Register your models here.

from .models import Card, LineInCard

# # Register your models here.

 
class LineInCardAdmin(admin.StackedInline):
    model = LineInCard
 
@admin.register(Card)
class CardAdmin(admin.ModelAdmin):
    inlines = [LineInCardAdmin]
 
    class Meta:
       model = Card
 
@admin.register(LineInCard)
class LineInCardAdmin(admin.ModelAdmin):
    pass