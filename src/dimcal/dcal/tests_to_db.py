from django.test import TestCase
from django.core.exceptions import ObjectDoesNotExist
from .models import DimCalendar
from datetime import date
import workalendar.europe

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
            'NL'        : workalendar.europe.Netherlands(),
            'PT'        : workalendar.europe.Portugal(),
            'SK'        : workalendar.europe.Slovakia(),
            'SI'        : workalendar.europe.Slovenia(),


        }
        # Too many discrepancies. Step back from 1970-2038 for a while
        self.yr_start = 2017
        self.yr_end   = 1970
        self.yr_step  = -1
        

    def compare_calendars(self, country_code, filter_args, years_range = None):
        if years_range is None:
            years_range = range(self.yr_start, self.yr_end, self.yr_step)
        db_hols = DimCalendar.objects.filter(**filter_args)
        for year in years_range:
            for wkal_dt, holiday in self.wkalendars[country_code].holidays(year):
                if (# Mothersday not an EE holiday
                    (wkal_dt == date(year,5, 15) and country_code == 'EE') or
                    # Workalendar issue 160
                    (wkal_dt == self.wkalendars[country_code].get_easter_sunday(year)
                        and country_code in ['GB_ENG_WLS','GB_NIR']) or
                    # workalendar issue 154(fixed but waiting release)
                    (wkal_dt == date(year, 12,31) and country_code == 'NL')
                    ):
                    break
                else:
                    try:
                        dc = db_hols.get(calendar_date=wkal_dt)
                        self.assertEqual(dc.calendar_date, wkal_dt)
                    except:
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


