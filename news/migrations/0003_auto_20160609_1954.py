# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-09 19:54
from __future__ import unicode_literals

from django.db import migrations
import sorl.thumbnail.fields


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0002_auto_20160603_1447'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='image',
            field=sorl.thumbnail.fields.ImageField(null=True, upload_to='news/', verbose_name='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435'),
        ),
    ]
