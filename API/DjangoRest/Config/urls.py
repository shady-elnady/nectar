"""Config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView ,
    TokenVerifyView,
)

from API.router import router


urlpatterns = [
    ##
    path("", include("django.contrib.auth.urls")),
    path("", include("User.urls", namespace="User")),
    path("", include("Nectar.urls", namespace="Nectar")),
    # path("my-api/", include("API.urls", namespace="API")),
    ## Simple JWT Authentication Default URL
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # allow API users to verify HMAC-signed tokens without having access to your signing key
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    ## Rest Framwork URL
    path('api/', include((router.urls))),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    ## GraphQL URL
    path("graphql/", include("GraphQL.urls", namespace="GraphQL")),
    ##
    path("product/", include("Product.urls", namespace="Product")),
    path("payment/", include("Payment.urls", namespace="Payment")),
    ##
    path("admin/", admin.site.urls),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
