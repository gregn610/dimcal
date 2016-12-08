from django.test import TestCase
from django.core.exceptions import ObjectDoesNotExist
from .models import DimCalendar
from datetime import date
from workalendar.core import Calendar, MON, TUE, WED, THU, FRI, SAT, SUN
import workalendar.europe
import workalendar.africa
import workalendar.america

class DimCalendarHolidayTestCase(TestCase):
    def setUp(self):
        self.wkalendars = {
            'BE'        : workalendar.europe.Belgium(),
#            'BG': workalendar.europe.Bulgaria(),
#            'CY': workalendar.europe.Cyprus(),
            'CZ'        : workalendar.europe.CzechRepublic(),
            'DK'        : workalendar.europe.Denmark(),
            'EE'        : workalendar.europe.Estonia(),
            'ES_NAT'    : workalendar.europe.Spain(),
            'GB_ENG_WLS': workalendar.europe.UnitedKingdom(),
            'GB_NIR'    : workalendar.europe.UnitedKingdomNorthernIreland(),
            'GR'        : workalendar.europe.Greece(),
            'FI'        : workalendar.europe.Finland(),
            'FR'        : workalendar.europe.France(),
#            'HR'        : workalendar.europe.Croatia(),
            'HU'        : workalendar.europe.Hungary(),
#            'IE'        : workalendar.europe.Ireland(),
            'IT'        : workalendar.europe.Italy(),
#            'LT'        : workalendar.europe.Latvia(),
            'LU'        : workalendar.europe.Luxembourg(),
            'MG'        : workalendar.africa.Madagascar(),
            'NL'        : workalendar.europe.Netherlands(),
            'PA'        : workalendar.america.Panama(),
            'PT'        : workalendar.europe.Portugal(),
            'SK'        : workalendar.europe.Slovakia(),
            'SI'        : workalendar.europe.Slovenia(),
            'ST'        : workalendar.africa.SaoTomeAndPrincipe(),
            'ZA'        :workalendar.africa.SouthAfrica()
        }

        # Too many discrepancies. Step back from 1970-2038 for a while
        self.yr_start = 2017
        self.yr_end   = 1970
        self.yr_step  = -1

    def suppress_discrepancy(self, wkal_dt, year, country_code):
        """
        Don't raise errors for some spcific known dates. Need to fix SQL or fix workalendar
        :param wkal_dt:
        :param year:
        :param country_code:
        :return: Boolean
        """
        # and wkal_dt == Calendar.get_nth_weekday_in_month(year, 5,MON,2 )
        return (
                    # EE independence
                    (country_code == 'EE'
                     and year < 1991) or
                    # National flag day not an EE holiday
                    (country_code == 'EE'
                     and wkal_dt == date(year, 6, 4)) or
                    # Workalendar issue 160
                    (country_code in ['GB_ENG_WLS','GB_NIR']
                     and wkal_dt == self.wkalendars[country_code].get_easter_sunday(year)) or
                    # workalendar issue 154(fixed but waiting release)
                    (country_code == 'NL'
                    and wkal_dt == date(year, 12,31)) or
                    # 1 January	New Year's Day not proclaimed if 1 January falls on Saturday or Sunday
                    (country_code in ['GB_ENG_WLS', 'GB_NIR']
                     and wkal_dt.month == 1
                     and wkal_dt.day == 1)
        )


    def compare_calendars(self, country_code, filter_args, years_range = None):
        if years_range is None:
            years_range = range(self.yr_start, self.yr_end, self.yr_step)
        try:
            db_hols = DimCalendar.objects.filter(**filter_args)
            for year in years_range:
                # Suppress known discrepancies with workalendar
                for wkal_dt, holiday in self.wkalendars[country_code].holidays(year):
                    if self.suppress_discrepancy(wkal_dt, year, country_code):
                        break
                    else:
                        dc = db_hols.get(calendar_date=wkal_dt)
                        self.assertEqual(dc.calendar_date, wkal_dt)
        except ObjectDoesNotExist as e:
            self.fail("{0}\n{2}\n{1:%A %Y-%m-%d} not in the database".format(country_code, wkal_dt, holiday))



    def test_to_db_hol_be(self):
        """
        Test all Belgian Workalendar holidays are in the database
        """
        country_code = 'BE'
        filter_args = {'hol_' + country_code.lower(): True }
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_cz(self):
        """
        Test all Czech Workalendar holidays are in the database
        """
        country_code = 'CZ'
        filter_args = {'hol_' + country_code.lower(): True }
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_dk(self):
        """
        Test all Denmark Workalendar holidays are in the database
        """
        country_code = 'DK'
        filter_args = {'hol_' + country_code.lower(): True }
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_ee(self):
        """
        Test all Estonia Workalendar holidays are in the database
        """
        country_code = 'EE'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_es(self):
        """
        Test all Spanish Workalendar holidays are in the database
        """
        country_code = 'ES_NAT'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_fi(self):
        """
        Test all Finland Workalendar holidays are in the database
        """
        country_code = 'FI'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_fr(self):
        """
        Test all French Workalendar holidays are in the database
        """
        country_code = 'FR'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_gr(self):
        """
        Test all Greece Workalendar holidays are in the database
        """
        country_code = 'GR'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)



    def test_to_db_hol_hu(self):
        """
        Test all Hungary Workalendar holidays are in the database
        """
        country_code = 'HU'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)



    def test_to_db_hol_it(self):
        """
        Test all Italy Workalendar holidays are in the database
        """
        country_code = 'IT'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_lu(self):
        """
        Test all Luxembourg Workalendar holidays are in the database
        """
        country_code = 'LU'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_nl(self):
        """
        Test all Netherlands Workalendar holidays are in the database
        """
        country_code = 'NL'
        filter_args = {'hol_' + country_code.lower(): True }
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_gb_eng_wls(self):
        """
        Test all England and Wales Workalendar holidays are in the database
        """
        country_code = 'GB_ENG_WLS' # Uppercase
        filter_args = {'hol_' + country_code.lower(): True }
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_gb_ni(self):
        """
        Test all Northern Ireland Workalendar holidays are in the database
        """
        country_code = 'GB_NIR'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_pt(self):
        """
        Test all Portugal Workalendar holidays are in the database
        """
        country_code = 'PT'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)



    def test_to_db_hol_si(self):
        """
        Test all Slovenia Workalendar holidays are in the database
        Overrides default year range
        """
        country_code = 'SI'
        filter_args = {'hol_' + country_code.lower(): True}

        # Slovenian independence
        yr_range = range(2037, 1991, -1)

        self.compare_calendars(country_code, filter_args, yr_range)



    def test_to_db_hol_sk(self):
        """
        Test all Slovakia Workalendar holidays are in the database
        """
        country_code = 'SK'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


    def test_to_db_hol_za(self):
        """
        Test all Slovakia Workalendar holidays are in the database
        """
        country_code = 'ZA'
        filter_args = {'hol_' + country_code.lower(): True}
        self.compare_calendars(country_code, filter_args)


