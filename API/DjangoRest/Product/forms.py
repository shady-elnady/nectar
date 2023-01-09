from django import forms

from .models import Product, ProductImage


class ProductForm(forms.ModelForm):

    class Meta:
        model = Product
        fields = "__all__" 

class ProductImageForm(forms.ModelForm):
    image = forms.ImageField(
        label="Image",
        widget=forms.ClearableFileInput(attrs={"multiple": True}),
    )

    class Meta:
        model = ProductImage
        fields = "__all__" 
