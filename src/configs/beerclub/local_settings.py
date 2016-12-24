import os

# Should we override this?
#ADMINS = (
#           ('William', 'william@blackhats.net.au'),
#    )
ALLOWED_HOSTS = ['*']


# Do something smarter here
SECRET_KEY = 'toeueoausnaolrcxkaoeumaosnuehmkoasnhaoehu'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': '/var/www/db/django/db.sqlite3',
        'ATOMIC_REQUESTS' : True,
    }
}

# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

TIME_ZONE = 'Australia/Brisbane'

LANGUAGE_CODE = 'en-au'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# If you get 400 here with this set to False, but works on True,
#  it's because you need to setup Allowed_hosts
DEBUG = False

# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = "/var/www/its_django/"

STATIC_URL = '/static/'

MEDIA_URL = '/media/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')

MEDIA_ROOT = os.path.join(BASE_DIR,'media')

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}




