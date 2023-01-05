from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import View, CreateView
from django.urls import reverse_lazy
from django.forms import modelformset_factory
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required, permission_required
from guardian.shortcuts import get_objects_for_user

from Vegetable.forms import VegetableForm, VegetableImageForm
from Vegetable.models import Vegetable, VegetableImage


# Create your views here.


app_name= "Vegetable"

context = {
    "app_name": app_name,
}


def home(req):    
    return render(req, f"{app_name}/home.html", context)


def about(req):
    return render(req, f"{app_name}/about.html", context)


def contact(req):
    return render(req, f"{app_name}/contact.html", context)


@login_required
def vegetable(request):   
    context["vegetables"]= Vegetable.objects.all()
    return render(request, f"{app_name}/vegetable.html", context)


## Class Based View
class NewVegetableView(View):
    def post(self, request):
        form = VegetableForm(request.post)
        if form.valid():
            form.save()
            return redirect(reverse_lazy(f"home{app_name}"))
        context["form"]= form
        return render(request=request, template_name=f"home{app_name}", context=contact)


    def get(self, request):
        form = VegetableForm()
        context["form"]= form
        return render(request=request, template_name=f"{app_name}/vegetable.html", context=contact)


## Generic Class Based View
class VegetableView(CreateView): 
    model= Vegetable
    form_class= VegetableForm
    success_url: reverse_lazy(f"vegetable{app_name}")
    template_name: "{}/vegetable.html".format(app_name)



## 
@login_required
def post(request):
 
    ImageFormSet = modelformset_factory(VegetableImage,
                                        form=VegetableImageForm, extra=5)
    #'extra' means the number of photos that you can upload   ^
    if request.method == 'POST':
    
        vegetableForm = VegetableForm(request.POST)
        formset = ImageFormSet(request.POST, request.FILES,
                               queryset=VegetableImage.objects.none())
    
    
        if vegetableForm.is_valid() and formset.is_valid():
            for img in request.FILES.getlist('images'):
                # loop for images code
                    pass
            vegetable_form = vegetableForm.save(commit=False)
            # fields
            ##post_form.user = request.user
            vegetable_form.save()
    
            for form in formset.cleaned_data:
                #this helps to not crash if the user   
                #do not upload all the photos
                if form:
                    image = form['image']
                    photo = VegetableImage(post=vegetable_form, image=image)
                    photo.save()
            # use django messages framework
            messages.success(request,
                             "Yeeew, check it out on the home page!")
            return HttpResponseRedirect("/")
        else:
            print(vegetableForm.errors, formset.errors)
    else:
        vegetableForm = VegetableForm()
        formset = ImageFormSet(queryset=VegetableImage.objects.none())
    return render(request, 'index.html',
                  {'vegetableForm': vegetableForm, 'formset': formset})

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

@login_required
#@permission_required("project.view_project")
def project_listing(request):
    # project_data = get_objects_for_user(
    #     request.user, "project.dg_view_project", klass=Vegetable
    # )
    vegetables = Vegetable.objects.all()
    return render(request, f"{app_name}/project.html", {"vegetables": vegetables})


@login_required
@permission_required("project.view_project")
def project_detail(request, id):
    project = get_object_or_404(Vegetable, slug=id)
    return render(request, f"{app_name}/detail.html", {"detail": project})


def create_project(request):

    if request.method == "POST":
        form = VegetableForm(request.POST)
        files = request.FILES.getlist("image")
        if form.is_valid():
            f = form.save(commit=False)
            f.user = request.user
            f.save()
            for i in files:
                VegetableImage.objects.create(project=f, image=i)
            messages.success(request, "New Project Added")
            return HttpResponseRedirect(f"{app_name}/projects")
        else:
            print(form.errors)
    else:
        form = VegetableForm()
        imageform = VegetableImageForm()

    return render(request, f"{app_name}/create_project.html", {"form": form, "imageform": imageform})