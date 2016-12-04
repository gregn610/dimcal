from __future__ import unicode_literals

from django.db import models


class DimCalendar(models.Model):
    dim_calendar_pk                = models.IntegerField(primary_key=True)
    calendar_date                  = models.DateField()
    #
    calc_full_moon                 = models.NullBooleanField()
    #
    calc_western_epiphany          = models.NullBooleanField()
    calc_western_clean_mon         = models.NullBooleanField()
    calc_western_annunciation      = models.NullBooleanField()
    calc_western_ash_wed           = models.NullBooleanField()
    calc_western_palm_sun          = models.NullBooleanField()
    calc_western_holy_thu          = models.NullBooleanField()
    calc_western_good_fri          = models.NullBooleanField()
    calc_western_easter_sat        = models.NullBooleanField()
    calc_western_easter_sun        = models.NullBooleanField()
    calc_western_easter_mon        = models.NullBooleanField()
    calc_western_all_saints        = models.NullBooleanField()
    calc_western_immaculate_con    = models.NullBooleanField()
    calc_western_christmas_eve     = models.NullBooleanField()
    calc_western_christmas         = models.NullBooleanField()
    calc_western_ascension_thu     = models.NullBooleanField()
    calc_western_assumption        = models.NullBooleanField()
    calc_western_whit_sun          = models.NullBooleanField()
    calc_western_whit_mon          = models.NullBooleanField()
    calc_western_corpuschristi_thu = models.NullBooleanField()
    #
    hol_at                     = models.NullBooleanField()
    hol_be                     = models.NullBooleanField()
    hol_bg                     = models.NullBooleanField()
    hol_ca_ab                  = models.NullBooleanField()
    hol_ca_bc                  = models.NullBooleanField()
    hol_ca_fed                 = models.NullBooleanField()
    hol_ca_mb                  = models.NullBooleanField()
    hol_ca_nat                 = models.NullBooleanField()
    hol_ca_nb                  = models.NullBooleanField()
    hol_ca_nl                  = models.NullBooleanField()
    hol_ca_ns                  = models.NullBooleanField()
    hol_ca_nt                  = models.NullBooleanField()
    hol_ca_nu                  = models.NullBooleanField()
    hol_ca_on                  = models.NullBooleanField()
    hol_ca_pe                  = models.NullBooleanField()
    hol_ca_qc                  = models.NullBooleanField()
    hol_ca_sk                  = models.NullBooleanField()
    hol_ca_yt                  = models.NullBooleanField()
    hol_cy                     = models.NullBooleanField()
    hol_cz                     = models.NullBooleanField()
    hol_dk                     = models.NullBooleanField()
    hol_ee                     = models.NullBooleanField()
    hol_es_nat                 = models.NullBooleanField()
    hol_fi                     = models.NullBooleanField()
    hol_fr                     = models.NullBooleanField()
    hol_gb_eng_wls             = models.NullBooleanField()
    hol_gb_sct                 = models.NullBooleanField()
    hol_gb_nir                 = models.NullBooleanField()
    hol_gr                     = models.NullBooleanField()
    hol_hr                     = models.NullBooleanField()
    hol_hu                     = models.NullBooleanField()
    hol_ie                     = models.NullBooleanField()
    hol_it                     = models.NullBooleanField()
    hol_lt                     = models.NullBooleanField()
    hol_lu                     = models.NullBooleanField()
    hol_lv                     = models.NullBooleanField()
    hol_mt                     = models.NullBooleanField()
    hol_nl                     = models.NullBooleanField()
    hol_pl                     = models.NullBooleanField()
    hol_pt                     = models.NullBooleanField()
    hol_ro                     = models.NullBooleanField()
    hol_si                     = models.NullBooleanField()
    hol_sk                     = models.NullBooleanField()
    hol_us_fed                 = models.NullBooleanField()



    class Meta:
        db_table = 'dim_calendar'

    def _get_countries(self):
        return [att[4:] for att in dir(DimCalendar) if att.startswith('hol_') and getattr(self, att)]

    countries = property(_get_countries)


    def _get_calcs(self):
        return [att[4:] for att in dir(DimCalendar) if getattr(self, att) and (att.startswith('calc_') and not att.startswith('calc_tbc'))]

    calcs = property(_get_calcs)



