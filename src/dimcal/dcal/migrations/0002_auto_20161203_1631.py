# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2016-12-03 16:31
from __future__ import unicode_literals

from django.db import migrations
from pathlib import Path

class Migration(migrations.Migration):
    """
    Set up indexes and populate PK
    """
    dependencies = [
        ('dcal', '0001_initial'),
    ]

    file_sql = [Path(file).read_text() for file in sorted(Path('./sql/').glob('setup_*.sql'))]
    if not file_sql:
        raise FileNotFoundError

    operations = [
        migrations.RunSQL(sql) for sql in file_sql
    ]
