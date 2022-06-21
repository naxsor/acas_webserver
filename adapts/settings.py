"""
Django settings for adapts project.
Generated by 'django-admin startproject' using Django 3.1.2.
For more information on this file, see
https://docs.djangoproject.com/en/3.1/topics/settings/
For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.1/ref/settings/
"""

from pathlib import Path
import os
import json

with open('/etc/config.json') as config_file:
	config = json.load(config_file)

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!

SECRET_KEY = config['SECRET_KEY']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = [
    'acas.uprrp.edu',
    '127.0.0.1'
]
# Application definition
INSTALLED_APPS = [
    'django.contrib.contenttypes',
    'blog.apps.BlogConfig',
    'users.apps.UsersConfig',
    'sensors.apps.SensorsConfig',
    'project.apps.ProjectConfig',
    'app.apps.AppConfig',
    'crispy_forms',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'storages',
    'bootstrap4',
    'bootstrap_datepicker_plus',
    'ckeditor',
    'ckeditor_uploader',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.RemoteUserMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'adapts.middleware.TimezoneMiddleware',
]

AUTHENTICATION_BACKENDS = [
    'django.contrib.auth.backends.RemoteUserBackend',
    'django.contrib.auth.backends.ModelBackend',
]

ROOT_URLCONF = 'adapts.urls'

CSRF_COOKIE_SECURE = False
SESSION_COOKIE_SECURE = False


TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
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

WSGI_APPLICATION = 'adapts.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases


DATABASE_ROUTERS = ['blog.router.FailoverRouter']
DATABASE_APPS_MAPPING = {'sensors': 'sensor_db'}

DATABASES = {
    'default_write': { #ADAPTS COMPUTER - ACAS DATABASE
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config.get('db_name'),
        'USER': config.get('db_username'),
        'PASSWORD': config.get('db_password'),
        'HOST': config.get('db_ip'),
        'PORT': config.get('db_port')
    },
    'sensor_db_write': { #ADAPTS COMPUTER - SENSOR DATABASE
	    'ENGINE': 'django.db.backends.postgresql',
        'NAME': config.get('db_sensor_name'),
        'USER': config.get('db_sensor_username'),
        'PASSWORD': config.get('db_sensor_password'),
        'HOST': config.get('db_ip'),
        'PORT': config.get('db_sensor_sport'),
    },
    'default': { #WEBSERVER COMPUTER  - ACAS DATABASE
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config.get('db_name'),
        'USER': config.get('db_username'),
        'PASSWORD': config.get('db_password'),
        'HOST':config.get('db_ip_failover'),
        'PORT': config.get('db_port')
    },
    'sensor_db': { #WEBSERVER COMPUTER - SENSOR DATABASE
	    'ENGINE': 'django.db.backends.postgresql',
        'NAME': config.get('db_sensor_name'),
        'USER': config.get('db_sensor_username'),
        'PASSWORD': config.get('db_sensor_password'),
        'HOST': config.get('db_ip_failover'),
        'PORT': config.get('db_sensor_sport'),
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

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
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

DATETIME_FORMAT = ['%Y-%m-%d %H:%M:%S.%f']

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

CRISPY_TEMPLATE_PACK = 'bootstrap4'

LOGIN_REDIRECT_URL = 'blog-home'
LOGIN_URL = 'login'

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = config.get('EMAIL_USER')
EMAIL_HOST_PASSWORD = config.get('EMAIL_PASS')

AWS_S3_REGION_NAME = 'us-east-2'
AWS_STORAGE_BUCKET_NAME = config.get('AWS_STORAGE_BUCKET_NAME')
AWS_ACCESS_KEY_ID = config.get('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = config.get('AWS_SECRET_ACCESS_KEY')
AWS_QUERYSTRING_AUTH = False
AWS_S3_FILE_OVERWRITE = False
AWS_DEFAULT_ACL = None

DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

CKEDITOR_BASEPATH = "/static/ckeditor/ckeditor/"
CKEDITOR_UPLOAD_PATH = "uploads/"
CKEDITOR_FILENAME_GENERATOR = 'adapts.utils.get_filename'

CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'full',
        'height': '400',
        'width': 'full',
        'removePlugins': 'stylesheetparser',
    },
}



