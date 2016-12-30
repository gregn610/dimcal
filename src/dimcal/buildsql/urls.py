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
    url(r'^(?P<dialect>[a-zA-Z][a-zA-Z]_?\w*)/[tT][aA][bB][lL][eE].[sS][qQ][lL]$',
        SQLTableView.as_view(content_type='text/plain; charset=utf-8'),
        name='sqltable'
        ),
    url(r'^(?P<dialect>[a-zA-Z][a-zA-Z]_?\w*)/[cC][oO][mM][mM][oO][nN].[sS][qQ][lL]$',
        SQLCommonView.as_view(content_type='text/plain; charset=utf-8'),
        name='sqlcommon'
        ),
    url(r'^(?P<dialect>[a-zA-Z][a-zA-Z]_?\w*)/[cC][aA][lL][cC][uU][lL][aA][tT][iI][oO][nN][sS].[sS][qQ][lL]$',
        SQLCalculationsView.as_view(content_type='text/plain; charset=utf-8'),
        name='sqlcalcs'
        ),
    url(r'^(?P<dialect>[a-zA-Z][a-zA-Z]_?\w*)/(?P<country>[a-zA-Z][a-zA-Z]_?\w*)/[dD][aA][tT][aA].[sS][qQ][lL]$',
        SQLDataView.as_view( content_type='text/plain; charset=utf-8'),
        name='sqldata'
        ),
]