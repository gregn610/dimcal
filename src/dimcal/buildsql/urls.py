from django.conf.urls import url

#from . import views
from .views import *

app_name = 'buildsql'
urlpatterns = [
    url(r'^$',
        SQLIndexView.as_view(),
        name='sqlindex'
        ),
#
    url(r'^table.sql$',
        SQLTableView.as_view( content_type='text/plain; charset=utf-8'),
        name='sqltable'
        ),
    url(r'^(?P<country>[a-zA-Z][a-zA-Z]_?\w*)/data.sql$',
        SQLDataView.as_view( content_type='text/plain; charset=utf-8'),
        name='sqldata'
        ),
]