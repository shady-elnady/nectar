"""
Django settings for Config project.

Generated by 'django-admin startproject' using Django 4.1.4.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.1/ref/settings/

https://github.com/django/django/blob/main/django/conf/global_settings.py
"""

from pathlib import Path
from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-o!%_dz*#--)5ukgjqaflm%o_c^fu)s!u!!zg0v!3vha)-q*^ma'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = [
    "*",
    "localhost",
    "127.0.0.1",
    "herokuapp.com",
]

AUTH_USER_MODEL = "User.User"


SITE_ID = 1


## Application definition
THIRD_LIBRARIES= [
    'rest_framework',
    'rest_framework_simplejwt',
]

MY_APP= [
    "Nectar",
    "Application",
    "Unit",
    "Language",
    "Location",
    "Department",
    "Category",
    "Payment",
    "User",
    "Product",
    "Card",
    "Basket",
    "Order",
    "Utils",
    "API",
    "GraphQL",
]

INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.admin',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',    
    ## Libraries
    *THIRD_LIBRARIES,
    ## My Apps
    *MY_APP,
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # for Langauge
    'django.middleware.locale.LocaleMiddleware',
]



ROOT_URLCONF = 'Config.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            BASE_DIR / "templates",
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'Config.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'DataBase/db.sqlite3',
    }
}


# Classes used to implement DB routing behavior.
DATABASE_ROUTERS = []

# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGES = [
    ('en', _('English')),
    ('ar', _('Arabic')),
    ('fr', _('French')),
    ('es', _('Spanish')),
    ('de', _('German')),
]

# Languages using BiDi (right-to-left) layout
# LANGUAGES_BIDI = ["he", "ar", "ar-dz", "ckb", "fa", "ur"]
LANGUAGES_BIDI = [
    'ar', 
]

LANGUAGE_CODE = 'en-us'

## Accept-Language add to header request
# Accept-Language: en-us

LOCALE_PATHS = [
    '/home/www/project/common_files/locale',
    '/var/local/translations/locale',
    BASE_DIR / "Locales"
]

# Local time zone for this installation. All choices can be found here:
# https://en.wikipedia.org/wiki/List_of_tz_zones_by_name (although not all
# systems may support all possibilities). When USE_TZ is True, this is
# interpreted as the default user time zone.
TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/


STATIC_URL = '/static/'

MEDIA_URL = "media/"

if DEBUG:
    STATICFILES_DIRS = [
        BASE_DIR / "static",
        # "/var/www/example.com/static/",
    ]
    STATIC_ROOT = BASE_DIR / 'staticFiles'
    MEDIA_ROOT = BASE_DIR / "../media"
else:
    STATIC_ROOT = BASE_DIR / "static"
    MEDIA_ROOT = BASE_DIR / "media"

# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

DEFAULT_CURRENCY = "$"

##  All Auth Configurations
LOGIN_URL = reverse_lazy('User:LogIn')
LOGIN_REDIRECT_URL = reverse_lazy('home')
LOGOUT_REDIRECT_URL = reverse_lazy('User:LogIn')
# ACCOUNT_LOGOUT_ON_GET = False
# ACCOUNT_EMAIL_REQUIRED = True
# ACCOUNT_EMAIL_VERIFICATION = "mandatory"
# ACCOUNT_AUTHENTICATED_LOGIN_REDIRECTS =True
# SOCIALACCOUNT_LOGIN_ON_GET = True


REST_FRAMEWORK = {
    # Use Django's standard `django.contrib.auth` permissions,
    # or allow read-only access for unauthenticated users.
    # 'DEFAULT_PERMISSION_CLASSES': [
    #     'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly',
    # ],
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],
    ### for Simple JWT
    # 'DEFAULT_AUTHENTICATION_CLASSES': (
    #     'rest_framework_simplejwt.authentication.JWTAuthentication',
    # ),
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,
}


# # The email backend to use. For possible shortcuts see django.core.mail.
# # The default is to use the SMTP backend.
# # Third-party backends can be specified by providing a Python path
# # to a module that defines an EmailBackend class.
# EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"

# # Host for sending email.
# EMAIL_HOST = "localhost"

# # Port for sending email.
# EMAIL_PORT = 25

# # Whether to send SMTP 'Date' header in the local time zone or in UTC.
# EMAIL_USE_LOCALTIME = False

# # Optional SMTP authentication information for EMAIL_HOST.
# EMAIL_HOST_USER = ""
# EMAIL_HOST_PASSWORD = ""
# EMAIL_USE_TLS = False
# EMAIL_USE_SSL = False
# EMAIL_SSL_CERTFILE = None
# EMAIL_SSL_KEYFILE = None
# EMAIL_TIMEOUT = None