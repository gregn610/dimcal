from django.conf.urls import url

#from . import views
from .views import *

app_name = 'dcal'
urlpatterns = [
    url(r'^$',      IndexView.as_view(), name='index'),
    url(r'^about$', AboutView.as_view(), name='about'),

    url(r'^(?P<year>\d{4})/$', YearView.as_view(), name='year'),
    url(r'^(?P<year>\d{4})/(?P<month>\d{2})/$', YearMonthView.as_view(month_format='%m'), name='year_month'),
    url(r'^(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/$', YearMonthDayView.as_view(), name='year_month_day'),

    url(r'^(?P<country>[A-Z][A-Z]_?\w*)/$', CountryView.as_view(), name='country'),

    url(r'^(?P<country>[A-Z][A-Z]_?\w*)/(?P<year>[0-9]{4})/$',
        CountryYearView.as_view(),
        name='country_year'),

]