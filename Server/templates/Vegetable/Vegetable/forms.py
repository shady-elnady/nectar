from django import forms

from .models import Vegetable, VegetableImage


class VegetableForm(forms.ModelForm):

    class Meta:
        model = Vegetable
        fields = [
            "name",
            "availability",
            "price",
            "describtion",
            "reviews",
            "star",
            "image",
        ]


class VegetableImageForm(forms.ModelForm):
    image = forms.ImageField(
        label="Image",
        widget=forms.ClearableFileInput(attrs={"multiple": True}),
    )

    class Meta:
        model = VegetableImage
        fields = ("name", "image",)