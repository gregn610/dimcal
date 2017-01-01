"""
Django settings for testing dimcal project releases against different DBMSs.
Import the main settings.py file nad override as appropriate
"""

from dimcal.settings import *

# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES['releasedb'] = {
        'ENGINE'   : 'django.db.backends.postgresql',
        'USER'     : 'releaseuser',
        'NAME'     : 'releasedb',
        'PASSWORD' : '735341548690707',
        'TEST': {
                    'NAME' : 'releasetestdb',
                },
    }
TEST_DIALECT='PLPGSQL'

DEBUG=True
DJANGO_LOG_LEVEL=DEBUG