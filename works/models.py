# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from sorl.thumbnail import ImageField
from embed_video.fields import EmbedVideoField

@python_2_unicode_compatible
class Work(models.Model):
    title = models.CharField(max_length=200, verbose_name='Назавние')
    published = models.BooleanField(verbose_name='Опубликовано?', default=False)
    use_video = models.BooleanField(null=False, default=False, verbose_name='Видеобэкграунд?')
    image = ImageField(upload_to='works/', verbose_name='Изображение', null=True, blank=True)
    video = EmbedVideoField(verbose_name='Ссылка на youtube', null=True, blank=True)

    class Meta:
        verbose_name = 'Проект'
        verbose_name_plural = 'Проекты'

    def __str__(self):
        return self.title


@python_2_unicode_compatible
class WorkPart(models.Model):
    title = models.CharField(max_length=200, verbose_name='Заголовок')
    content = models.TextField(verbose_name='Описание')
    use_video = models.BooleanField(null=False, default=False, verbose_name='Видеобэкграунд?')
    image = ImageField(upload_to='works/', verbose_name='Изображение', null=True, blank=True)
    video = EmbedVideoField(verbose_name='Ссылка на youtube', null=True, blank=True)
    work = models.ForeignKey(Work, verbose_name='Проект', null=True, related_name='details')

    class Meta:
        verbose_name = 'Подробность'
        verbose_name_plural = 'Подробности'

    def __str__(self):
        return self.title
