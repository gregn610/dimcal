from django.test import TestCase
from django.core.exceptions import ObjectDoesNotExist
from .models import DimCalendar
from datetime import date
from workalendar.core import Calendar, MON, TUE, WED, THU, FRI, SAT, SUN
import workalendar.europe
import workalendar.africa
import workalendar.america
from .tests_to_db import DimCalendarHolidayTestCase

class WorkalendarHolidayTestCase(DimCalendarHolidayTestCase):
    def suppress_discrepancy(self, wkal_dt, year, country_code):
        """
        Don't raise errors for some specific known dates. Need to fix SQL or fix workalendar
        # Empty. Just override for now
        """
        return False


    def compare_calendars(self, country_code, filter_args, years_range = None):
        if years_range is None:
            years_range = range(self.yr_start, self.yr_end, self.yr_step)
        try:
            # Might be stepping backwards
            if self.yr_start < self.yr_end:
                filter_args['calendar_date__gte'] = date(self.yr_start, 1, 1)
                filter_args['calendar_date__lte'] = date(self.yr_end, 12, 31)
            else:
                filter_args['calendar_date__lte'] = date(self.yr_start, 12, 31)
                filter_args['calendar_date__gte'] = date(self.yr_end, 1, 1)

            sql_hols = DimCalendar.objects.filter(**filter_args)
            for sql_date in sql_hols.values_list('calendar_date', flat=True):
                if self.wkalendars[country_code].is_holiday(sql_date):
                    pass
                elif self.suppress_discrepancy(sql_date, sql_date.year, country_code):
                    # Suppress known discrepancies with workalendar
                    pass
                else:
                    self.fail("{0}\n{1:%A %Y-%m-%d} not in Workalendar".format(country_code, sql_date))

        except ObjectDoesNotExist as e:
            self.fail("{0}\n{2}\n{1:%A} not in the database".format(country_code))

