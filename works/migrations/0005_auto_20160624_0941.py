# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-24 09:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('works', '0004_auto_20160623_1444'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workpart',
            name='work',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='details', to='works.Work', verbose_name='\u041f\u0440\u043e\u0435\u043a\u0442'),
        ),
    ]
