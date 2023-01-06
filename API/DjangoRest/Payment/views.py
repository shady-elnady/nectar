from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.

app_name = "Payment"


@login_required
def paypal(req):
    context = {
        "app_name": app_name
    }
    return render(req, f"{app_name}/paypal.html", context=context)
