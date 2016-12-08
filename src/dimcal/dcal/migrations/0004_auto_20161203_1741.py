# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2016-12-03 17:41
from __future__ import unicode_literals
from django.db import migrations
from pathlib import Path

class Migration(migrations.Migration):

    dependencies = [
        ('dcal', '0003_auto_20161203_1655'),
    ]

    file_sql = [ Path(file).read_text() for file in sorted(Path('./sql/').glob('hol_*.sql'))]
    operations = [
        migrations.RunSQL( sql ) for sql in file_sql
    ]

