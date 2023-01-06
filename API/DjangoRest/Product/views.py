from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import View, CreateView
from django.urls import reverse_lazy
from django.forms import modelformset_factory
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required, permission_required

from Product.forms import ProductForm, ProductImageForm
from Product.models import Product, ProductImage


# Create your views here.


app_name= "Product"

context = {
    "app_name": app_name,
}


@login_required
def product(request):   
    context["products"]= Product.objects.all()
    return render(request, f"{app_name}/product.html", context)


## Class Based View
class NewProductView(View):
    def post(self, request):
        form = ProductForm(request.post)
        if form.valid():
            form.save()
            return redirect(reverse_lazy(f"home{app_name}"))
        context["form"]= form
        return render(request=request, template_name=f"home{app_name}", context=context)


    def get(self, request):
        form = ProductForm()
        context["form"]= form
        return render(request=request, template_name=f"{app_name}/product.html", context=context)


## Generic Class Based View
class ProductView(CreateView): 
    model= Product
    form_class= ProductForm
    success_url: reverse_lazy(f"product{app_name}")
    template_name: "{}/product.html".format(app_name)



## 
@login_required
def post(request):
 
    ImageFormSet = modelformset_factory(
        ProductImage,
        form=ProductImageForm,
        extra=5,
    )
    #'extra' means the number of photos that you can upload   ^
    if request.method == 'POST':
    
        productForm = ProductForm(request.POST)
        formset = ImageFormSet(
            request.POST,
            request.FILES,
            queryset=ProductImage.objects.none(),
        )
    
    
        if productForm.is_valid() and formset.is_valid():
            for img in request.FILES.getlist('images'):
                # loop for images code
                    pass
            product_form = productForm.save(commit=False)
            # fields
            ##post_form.user = request.user
            product_form.save()
    
            for form in formset.cleaned_data:
                #this helps to not crash if the user   
                #do not upload all the photos
                if form:
                    image = form['image']
                    photo = ProductImage(post=product_form, image=image)
                    photo.save()
            # use django messages framework
            messages.success(
                request,
                "Yeeew, check it out on the home page!",
            )
            return HttpResponseRedirect("/")
        else:
            print(productForm.errors, formset.errors)
    else:
        productForm = ProductForm()
        formset = ImageFormSet(queryset=ProductImage.objects.none())
    return render(request, 'index.html',
                  {'vegetableForm': productForm, 'formset': formset})

# Templete
"""
    <form id="post_form" method="post" action="" enctype="multipart/form-data">
    
        {% csrf_token %}
        {% for hidden in postForm.hidden_fields %}
            {{ hidden }}
        {% endfor %}
    
        {% for field in postForm %}
            {{ field }} <br />
        {% endfor %}
    
        {{ formset.management_form }}
        {% for form in formset %}
            {{ form }}
        {% endfor %}
    
    
        <input type="submit" name="submit" value="Submit" />
    </form>

"""

#################
#  https://github.com/veryacademy/yt-django-4-baseline-multiple-image-form

#@permission_required("project.view_project")
@login_required
def project_listing(request):
    # project_data = get_objects_for_user(
    #     request.user, "project.dg_view_project", klass=Vegetable
    # )
    products = Product.objects.all()
    return render(request, f"{app_name}/project.html", {"products": products})


# @permission_required("project.view_project")
@login_required
def product_detail(request, id):
    project = get_object_or_404(Product, slug=id)
    return render(request, f"{app_name}/detail.html", {"detail": project})


@login_required
def add_product(request):

    if request.method == "POST":
        form = ProductForm(request.POST)
        files = request.FILES.getlist("image")
        if form.is_valid():
            f = form.save(commit=False)
            f.user = request.user
            f.save()
            for i in files:
                ProductImage.objects.create(project=f, image=i)
            messages.success(request, "New Project Added")
            return HttpResponseRedirect(f"{app_name}/projects")
        else:
            print(form.errors)
    else:
        form = ProductForm()
        imageform = ProductImageForm()

    return render(request, f"{app_name}/create_project.html", {"form": form, "imageform": imageform})