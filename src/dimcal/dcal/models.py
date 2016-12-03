from __future__ import unicode_literals

from django.db import models


class DimCalendar(models.Model):
    dim_calendar_pk         = models.IntegerField(primary_key=True)
    calendar_date           = models.DateField()
    calc_western_good_fri   = models.NullBooleanField()
    calc_western_easter_mon = models.NullBooleanField()
    calc_tbc1               = models.NullBooleanField()
    calc_tbc2               = models.NullBooleanField()
    calc_tbc3               = models.NullBooleanField()
    calc_tbc4               = models.NullBooleanField()
    calc_tbc5               = models.NullBooleanField()
    calc_tbc6               = models.NullBooleanField()
    calc_tbc7               = models.NullBooleanField()
    calc_tbc8               = models.NullBooleanField()
    calc_tbc9               = models.NullBooleanField()
    hol_be                  = models.NullBooleanField()
    hol_ca_ab               = models.NullBooleanField()
    hol_ca_bc               = models.NullBooleanField()
    hol_ca_fed              = models.NullBooleanField()
    hol_ca_mb               = models.NullBooleanField()
    hol_ca_nat              = models.NullBooleanField()
    hol_ca_nb               = models.NullBooleanField()
    hol_ca_nl               = models.NullBooleanField()
    hol_ca_ns               = models.NullBooleanField()
    hol_ca_nt               = models.NullBooleanField()
    hol_ca_nu               = models.NullBooleanField()
    hol_ca_on               = models.NullBooleanField()
    hol_ca_pe               = models.NullBooleanField()
    hol_ca_qc               = models.NullBooleanField()
    hol_ca_sk               = models.NullBooleanField()
    hol_ca_yt               = models.NullBooleanField()
    hol_fr                  = models.NullBooleanField()
    hol_gb_eng_wls          = models.NullBooleanField()
    hol_gb_sct              = models.NullBooleanField()
    hol_gb_nir              = models.NullBooleanField()
    hol_ie                  = models.NullBooleanField()
    hol_mt                  = models.NullBooleanField()
    hol_nl                  = models.NullBooleanField()
    hol_us_fed              = models.NullBooleanField()



    class Meta:
        db_table = 'dim_calendar'

    def _get_countries(self):
        return [att[4:] for att in dir(DimCalendar) if att.startswith('hol_') and getattr(self, att)]

    countries = property(_get_countries)


    def _get_calcs(self):
        return [att[4:] for att in dir(DimCalendar) if getattr(self, att) and (att.startswith('calc_') and not att.startswith('calc_tbc'))]

    calcs = property(_get_calcs)



