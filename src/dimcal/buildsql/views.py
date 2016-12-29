from django.http import Http404
from django.shortcuts import render
from django.db import models
# Create your views here.
from django.http import Http404
from dcal.models import DimCalendar
from django.views.generic import TemplateView, ListView

# Create your views here.
class SQLIndexView(TemplateView):
    """
    Index of countries and SQL dialects
    """
    template_name = "buildsql/index.html"

    def get_context_data(self, **kwargs):
        context = super(TemplateView, self).get_context_data(**kwargs)
        dc = DimCalendar()
        context['calcs'] = DimCalendar().calcs
        context['countries'] = DimCalendar().countries

        return context


class SQLTableView(TemplateView):
    """
    Tables & indexes
    """
    template_name = "buildsql/table.sql92.sql"

    def get_context_data(self, **kwargs):
        context = super(TemplateView, self).get_context_data(**kwargs)
        dc = DimCalendar()
        context['calcs'] = dc.calcs
        context['countries'] = dc.countries

        dialect = context['dialect'] or 'SQL92'
        dialect = dialect.upper()
        if dialect == 'TSQL':
            self.template_name = "buildsql/table.tsql.sql"
        if dialect == 'PLPGSQL':
            self.template_name = "buildsql/table.plpgsql.sql"

        return context


class SQLCommonView(TemplateView):
    """
    Insert keys
    """
    template_name = "buildsql/common.sql92.sql"

    def get_context_data(self, **kwargs):
        context = super(TemplateView, self).get_context_data(**kwargs)
        dc = DimCalendar()
        context['calcs'] = dc.calcs
        context['countries'] = dc.countries

        dialect = context['dialect'] or 'SQL92'
        dialect = dialect.upper()
        if dialect == 'TSQL':
            self.template_name = "buildsql/common.tsql.sql"
        if dialect == 'PLPGSQL':
            self.template_name = "buildsql/common.plpgsql.sql"

        return context


class SQLDataView(TemplateView):
    """
    SQL Updates for a dim_calendar country
    """
    template_name = "buildsql/data.sql92.sql"

    def get_queryset(self):
        # DimCalendar only has attributes for populated countries
        page = 'hol_' + self.kwargs['country'].lower()
        if hasattr(DimCalendar, page):
            filter_dict = {page: True}
            queryset = DimCalendar.objects.filter(models.Q(**filter_dict)).order_by('calendar_date')
            return queryset
        else:
            raise Http404('Oops, no data found')

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(TemplateView, self).get_context_data(**kwargs)
        context['country_col'] = 'hol_' + self.kwargs['country'].lower()

        # bucket the Dim_Calendars by decade
        year_dict = {}
        for dc in self.get_queryset():
            year_dict.setdefault(dc.calendar_date.year, []).append(dc)
        context['year_dict'] = year_dict

        dialect = context['dialect'] or 'SQL92'
        dialect = dialect.upper()
        if dialect == 'TSQL':
            self.template_name = "buildsql/data.tsql.sql"
        if dialect == 'PLPGSQL':
            self.template_name = "buildsql/data.plpgsql.sql"

        return context







