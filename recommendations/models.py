# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from sorl.thumbnail import ImageField

@python_2_unicode_compatible
class Recommendations(models.Model):
    title = models.CharField(max_length=200, verbose_name='Заголовок')
    # TODO: check russian letters in file name
    image = ImageField(upload_to='recommendations/', verbose_name='Изображение', null=True, blank=True)
    content = models.TextField(verbose_name='Содержание')
    published = models.BooleanField(verbose_name='Опубликовано?', default=False)
    pub_date = models.DateTimeField('Дата публикации')

    class Meta:
        verbose_name = 'Рекоммендация'
        verbose_name_plural = 'Рекоммендации'

    def __str__(self):
        return self.title
