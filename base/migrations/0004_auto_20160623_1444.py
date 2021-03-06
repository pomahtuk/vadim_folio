# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-23 14:44
from __future__ import unicode_literals

from django.db import migrations, models
import embed_video.fields
import sorl.thumbnail.fields


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0003_settingsobject'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='image',
            field=sorl.thumbnail.fields.ImageField(blank=True, null=True, upload_to='pages/', verbose_name='\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435'),
        ),
        migrations.AddField(
            model_name='page',
            name='use_video',
            field=models.BooleanField(default=False, verbose_name='\u0412\u0438\u0434\u0435\u043e\u0431\u044d\u043a\u0433\u0440\u0430\u0443\u043d\u0434?'),
        ),
        migrations.AddField(
            model_name='page',
            name='video',
            field=embed_video.fields.EmbedVideoField(blank=True, null=True, verbose_name='\u0421\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 youtube'),
        ),
    ]
