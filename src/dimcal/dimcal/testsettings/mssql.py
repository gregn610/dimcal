"""
Django settings for testing dimcal project releases against different DBMSs.
Import the main settings.py file nad override as appropriate
"""

from dimcal.settings import *

# https://django-mssql.readthedocs.io/en/latest/index.html
DATABASES['releasedb'] = {
        'ENGINE'   : 'sqlserver_ado',
        'AUTOCOMMIT': False,
        'USER'     : 'releaseuser',
        'NAME'     : 'releasedb',
        'PASSWORD' : '735341548690707',
        'TEST': {
                    'NAME' : 'releasetestdb',
                },
    }
TEST_DIALECT='TSQL'