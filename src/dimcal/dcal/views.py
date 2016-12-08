from datetime import date

from django.shortcuts import render, get_object_or_404
from django.db import models
# Create your views here.
from django.http import HttpResponse
from django.views.generic.detail import DetailView
from django.views.generic.dates import YearArchiveView, MonthArchiveView
from .models import DimCalendar
from django.http import Http404
from django.views.generic import TemplateView, ListView

class AboutView( TemplateView):
    template_name = "dcal/about.html"


class IndexView( TemplateView):
    template_name = "dcal/index.html"


class CountryView( ListView):
    template_name = "dcal/country.html"
    make_object_list = True


    def get_queryset(self):
        # DimCalendar will only have attributes for completed data sets
        page  = 'hol_' + self.kwargs['country'].lower()
        if hasattr(DimCalendar, page):
            filter_dict = {page: True}
            queryset = DimCalendar.objects.filter(models.Q(**filter_dict)).order_by('calendar_date')
            return queryset

        else:
            raise Http404('Oops, missing data set')

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(ListView, self).get_context_data(**kwargs)
        context['country'] = self.kwargs['country']
        return context




class CountryYearView( ListView):
    template_name = "dcal/country_year.html"
    make_object_list = True

    def get_queryset(self):
        # DimCalendar will only have attributes for completed data sets
        page = 'hol_' + self.kwargs['country'].lower()
        if hasattr(DimCalendar, page):
            filter_dict = {page: True}
            queryset = DimCalendar.objects.filter(
                models.Q(**filter_dict)).filter(
                calendar_date__year = self.kwargs['year']).order_by('calendar_date')
            return queryset

        else:
            raise Http404('Oops, missing data set')


    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(ListView, self).get_context_data(**kwargs)
        context['country'] = self.kwargs['country']
        context['year']    = self.kwargs['year']
        return context



class YearView(YearArchiveView):
    queryset = DimCalendar.objects.all()
    date_field = 'calendar_date'
    make_object_list = True
    allow_future = True


class YearMonthView(MonthArchiveView):
    queryset = DimCalendar.objects.all()
    date_field = 'calendar_date'
    make_object_list = True
    allow_future = True

class YearMonthDayView(DetailView):
    #model = DimCalendar
    date_field = 'calendar_date'
    make_object_list = True
    allow_future = True

#    def get_queryset(self):
#        return DimCalendar.objects.all()
#                .filter(calendar_date__month =self.kwargs['month'])\
#                .filter(calendar_date__day = self.kwargs['day'])

    def get_object(self):
        return get_object_or_404(DimCalendar, calendar_date="{}-{}-{}".format(self.kwargs['year'], self.kwargs['month'],self.kwargs['day']))



