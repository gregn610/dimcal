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
    calc_eastern_easter_sun        = models.NullBooleanField()
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
    hol_de_bw                  = models.NullBooleanField()
    hol_de_by                  = models.NullBooleanField()
    hol_de_be                  = models.NullBooleanField()
    hol_de_bb                  = models.NullBooleanField()
    hol_de_gdr                 = models.NullBooleanField()
    hol_de_hb                  = models.NullBooleanField()
    hol_de_hh                  = models.NullBooleanField()
    hol_de_he                  = models.NullBooleanField()
    hol_de_mv                  = models.NullBooleanField()
    hol_de_ni                  = models.NullBooleanField()
    hol_de_nw                  = models.NullBooleanField()
    hol_de_rp                  = models.NullBooleanField()
    hol_de_sl                  = models.NullBooleanField()
    hol_de_sn                  = models.NullBooleanField()
    hol_de_st                  = models.NullBooleanField()
    hol_de_sh                  = models.NullBooleanField()
    hol_de_th                  = models.NullBooleanField()
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
    hol_mg                     = models.NullBooleanField()
    hol_mt                     = models.NullBooleanField()
    hol_nl                     = models.NullBooleanField()
    hol_pa                     = models.NullBooleanField()
    hol_pl                     = models.NullBooleanField()
    hol_pt                     = models.NullBooleanField()
    hol_ro                     = models.NullBooleanField()
    hol_se                     = models.NullBooleanField()
    hol_si                     = models.NullBooleanField()
    hol_sk                     = models.NullBooleanField()
    hol_st                     = models.NullBooleanField()
    hol_us_fed                 = models.NullBooleanField()
    hol_uy                     = models.NullBooleanField()
    hol_za                     = models.NullBooleanField()




    class Meta:
        db_table = 'dim_calendar'

    # static methods would look better but then can't get to a model static method from a template
    def _get_countries(self):
        return [att[4:] for att in dir(DimCalendar) if att.startswith('hol_') ]

    def _get_date_countries(self):
        return [att for att in self._get_countries() if getattr(self, 'hol_'+att)]

    countries      = property(_get_countries)
    date_countries = property(_get_date_countries)


    def _get_calcs(self):
        return [att[5:] for att in dir(DimCalendar) if att.startswith('calc_')
                and not att.startswith('calc_tbc') ]

    def _get_date_calcs(self):
        return [att for att in self._get_calcs() if getattr(self, 'calc_'+att) ]

    calcs      = property(_get_calcs)
    date_calcs = property(_get_date_calcs)



