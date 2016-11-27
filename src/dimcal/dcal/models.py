# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
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
    hol_gb_eng_wls          = models.NullBooleanField()
    hol_gb_sct              = models.NullBooleanField()
    hol_gb_nir              = models.NullBooleanField()
    hol_us_fed              = models.NullBooleanField()

    class Meta:
        managed = False
        db_table = 'dim_calendar'

    def _get_countries(self):
        return [att[4:] for att in dir(DimCalendar) if att.startswith('hol_') and getattr(self, att)]

    countries = property(_get_countries)


    def _get_calcs(self):
        return [att[4:] for att in dir(DimCalendar) if getattr(self, att) and (att.startswith('calc_') and not att.startswith('calc_tbc'))]

    calcs = property(_get_calcs)

#   def get_absolute_url(self):
#       return '/%s/%s/%s/' % (self.calendar_date.year,
#                              self.calendar_date.month,
#                              self.calendar_date.day
#                              )

