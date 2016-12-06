from django.test import TestCase
from django.core.exceptions import ObjectDoesNotExist
from .models import DimCalendar
from datetime import date
from dateutil import easter
from workalendar.core import WesternCalendar, ChristianMixin
import workalendar.europe


class ChristianCalendarTester(WesternCalendar, ChristianMixin):
    FIXED_HOLIDAYS = () # Don't want New Years day in here
    include_epiphany              = True
    include_clean_monday          = True
    include_annunciation          = True
    include_ash_wednesday         = True
    include_palm_sunday           = True
    include_holy_thursday         = True
    include_good_friday           = True
    include_easter_monday         = True
    include_easter_saturday       = True
    include_easter_sunday         = True
    include_all_saints            = True
    include_immaculate_conception = True
    include_christmas             = True
    include_christmas_eve         = True
    include_ascension             = True
    include_assumption            = True
    include_whit_sunday           = True
    include_whit_monday           = True
    include_corpus_christi        = True
    #include_boxing_day            = True # Surely belongs in Western ???


class DimCalendarChristianTestCase(TestCase):
    """
    Make sure the db and workalendar agree on the christian holidays.
    """
    
    def setUp(self):
        self.wkalendars = ChristianCalendarTester()

        # One place to change the range for all tests
        self.yr_start = 2037 # 2038 ends in Jan in SQL data
        self.yr_end   = 1970
        self.yr_step  =   -1

    def compare_calendar_func(self, feast_func, filter_args):
        """Different from countries as the wkalendar object doesn't change per test"""
        db_hols = DimCalendar.objects.filter(**filter_args)
        for year in range(self.yr_start, self.yr_end, self.yr_step):
            wkal_dt = feast_func(year)
            try:
                dc = db_hols.get(calendar_date=wkal_dt)
                self.assertEqual(dc.calendar_date, wkal_dt)
            except:
                self.fail("{0}\n{1:%A %Y-%m-%d} not in the database".format(feast_func.__name__, wkal_dt))





    def test_to_db_calc_clean_mon(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_clean_monday
        filter_args = {'calc_western_clean_mon': True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_ash_wed(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_ash_wednesday
        filter_args = {'calc_western_ash_wed' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_palm_sun(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_palm_sunday
        filter_args = {'calc_western_palm_sun' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_holy_thu(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_holy_thursday
        filter_args = {'calc_western_holy_thu' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_good_fri(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_good_friday
        filter_args = {'calc_western_good_fri' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_easter_mon(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_easter_monday
        filter_args = {'calc_western_easter_mon' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_easter_sat(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_easter_saturday
        filter_args = {'calc_western_easter_sat' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_easter_sun(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_easter_sunday
        filter_args = {'calc_western_easter_sun' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_ascension_thu(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_ascension_thursday
        filter_args = {'calc_western_ascension_thu' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_whit_sun(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_whit_sunday
        filter_args = {'calc_western_whit_sun' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_whit_mon(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_whit_monday
        filter_args = {'calc_western_whit_mon' : True}
        self.compare_calendar_func(feast_func, filter_args)


    def test_to_db_calc_corpuschristi_thu(self):
        """
        Test all feast Workalendar holidays are in the database
        """
        feast_func = self.wkalendars.get_corpus_christi
        filter_args = {'calc_western_corpuschristi_thu' : True}
        self.compare_calendar_func(feast_func, filter_args)



#    def test_to_db_calc_epiphany(self):
#        """
#        Test all feast Workalendar holidays are in the database
#        """
#        feast_func = self.wkalendars.holidays
#        filter_args = {'calc_western_epiphany': True}
#        self.compare_calendars(feast_set, filter_args)



#   def test_to_db_calc_annunciation(self):
#       """
#       Test all feast Workalendar holidays are in the database
#       """
#       feast_func = self.wkalendars.get_an
#       filter_args = {'calc_western_annunciation': True}
#       self.compare_calendars(feast, filter_args)


#   def test_to_db_calc_all_saints(self):
#       """
#       Test all feast Workalendar holidays are in the database
#       """
#       feast_func = self.wkalendars.get_all
#       filter_args = {'calc_western_all_saints' : True}
#       self.compare_calendars(feast, filter_args)


#    def test_to_db_calc_immaculate_conception(self):
#        """
#        Test all feast Workalendar holidays are in the database
#        """
#        feast_func = self.wkalendars.get_im
#        filter_args = {'calc_western_immaculate_con' : True}
#        self.compare_calendars(feast, filter_args)


#    def test_to_db_calc_christmas(self):
#        """
#        Test all feast Workalendar holidays are in the database
#        """
#        feast_func = self.wkalendars.get_ch
#        filter_args = {'calc_western_christmas' : True}
#        self.compare_calendars(feast, filter_args)
#
#
#    def test_to_db_calc_christmas_eve(self):
#        """
#        Test all feast Workalendar holidays are in the database
#        """
#        feast = 'Christmas Eve'
#        filter_args = {'calc_western_christmas_eve' : True}
#        self.compare_calendars(feast, filter_args)
#

#    def test_to_db_calc_assumption(self):
#        """
#        Test all feast Workalendar holidays are in the database
#        """
#        feast_func = self.wkalendars.get_ass
#        filter_args = {'calc_western_assumption' : True}
#        self.compare_calendars(feast, filter_args)