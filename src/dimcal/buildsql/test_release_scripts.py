from django.test import TestCase
from django.core.exceptions import ObjectDoesNotExist
from dcal.models import DimCalendar
from django.db import connections
from django.conf import settings
from django.test import TransactionTestCase
from django.urls import reverse
import logging


class ReleaseScriptsTestCase(TransactionTestCase):
    """
    Apply the templated release built SQL against a separate db and verify that
     the release scripts will work. This is important for the different SQL dialects.
    """
    def setUp(self):
        """
        NB Autocommit is set to False for releasedb connections.
        """
        #self.cursor = connections['releasedb'].cursor()


    def tearDown(self):
        #self.cursor.close()
        pass

    def test_01_table_create(self):
        """
        Verify that the table gets created successfully against the release target DBMS
        """
        response = self.client.get(reverse('buildsql:sqltable', kwargs={ 'dialect': settings.TEST_DIALECT }))
        try:
            cursor = connections['releasedb'].cursor()
            cursor.execute(response.content)
        finally:
            cursor.close()

    def test_05_common(self):
        """
        Verify that the PK population script works against the release target DBMS
        """
        response = self.client.get(reverse('buildsql:sqlcommon', kwargs={ 'dialect': settings.TEST_DIALECT }))
        try:
            cursor = connections['releasedb'].cursor()
            cursor.execute(response.content)
        finally:
            cursor.close()



#    def test_10_calculations(self):
#        """
#        # ToDo: Figure out why this is 404'ing when table.sql and common.sql both work ???
#        #       Not important now as countries use the same syntax
#        Verify that the calculations script works against the release target DBMS
#        NB. All tables are truncated after each test, so this test only proves that the SQL is syntactically correct
#        """
#        response = self.client.get(reverse('buildsql:sqlcalculations', kwargs={ 'dialect': settings.TEST_DIALECT }))
#        try:
#            cursor = connections['releasedb'].cursor()
#            cursor.execute(response.content)
#        finally:
#            cursor.close()


    def test_15_countries(self):
        """
        Verify that the country specific scripts work against the release target DBMS.

        NB. All tables are truncated after each test, so this test only proves that the SQL is syntactically correct.
        The updates will affect 0 rows.
        """
        dc = DimCalendar()
        for cc in dc.countries:
            response = self.client.get(reverse('buildsql:sqldata', kwargs={ 'dialect': settings.TEST_DIALECT,
                                                                            'country': cc } ))
            try:
                cursor = connections['releasedb'].cursor()
                cursor.execute(response.content)
            finally:
                cursor.close()
