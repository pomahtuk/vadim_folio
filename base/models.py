# -*- encoding: utf-8 -*-
from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible
from django.db import models
from mptt.models import MPTTModel, TreeForeignKey
from sorl.thumbnail import ImageField
from embed_video.fields import EmbedVideoField


# Create your models here.
@python_2_unicode_compatible
class Page(MPTTModel):
    GENERIC = 'GE'
    NEWS = 'NW'
    RECOMMENDATIONS = 'RC'
    PROJECTS = 'PJ'
    PROFILE = 'PR'
    PROFILE_CHILD = 'PC'
    MAIN = 'MN'
    CONTACTS = 'CT'

    PAGE_TYPE_CHOICES = (
        (GENERIC, 'Базовая'),
        (NEWS, 'Новости'),
        (RECOMMENDATIONS, 'Рекоммендации'),
        (PROJECTS, 'Проекты'),
        (PROFILE, 'Профиль'),
        (PROFILE_CHILD, 'Профиль - страница'),
        (MAIN, 'Главная'),
        (CONTACTS, 'Контакты'),
    )

    title = models.CharField(max_length=200, verbose_name='Заголовок')
    slug = models.CharField(max_length=255, verbose_name='URL', null=True, blank=True)
    content = models.TextField(verbose_name='Содержание')
    parent = TreeForeignKey('self', null=True, blank=True, related_name='children', db_index=True,
                            verbose_name='Родительская страница')
    order = models.PositiveIntegerField(verbose_name='Порядок')
    is_active = models.BooleanField(null=False, default=False, verbose_name='Активная')
    role = models.CharField(
        max_length=2,
        choices=PAGE_TYPE_CHOICES,
        default=GENERIC,
        verbose_name='Тип страницы'
    )
    use_video = models.BooleanField(null=False, default=False, verbose_name='Видеобэкграунд?')
    # TODO: check russian letters in file name
    image = ImageField(upload_to='pages/', verbose_name='Изображение', null=True, blank=True)
    video = EmbedVideoField(verbose_name='Ссылка на youtube', null=True, blank=True)

    class MPTTMeta:
        order_insertion_by = ['order']

    class Meta:
        verbose_name = 'Страница'
        verbose_name_plural = 'Страницы'

    def __str__(self):
        return self.title


# Create your models here.
@python_2_unicode_compatible
class SettingsObject(models.Model):
    fb_url = models.CharField(max_length=200, verbose_name='Facebook')
    insta_url = models.CharField(max_length=200, verbose_name='Instagramm')
    vk_url = models.CharField(max_length=200, verbose_name='Vkontakte')
    youtube_url = models.CharField(max_length=200, verbose_name='Youtube')
    twitter_url = models.CharField(max_length=200, verbose_name='Twitter')
    phone = models.CharField(max_length=200, verbose_name='Телефон')
    address = models.CharField(max_length=200, verbose_name='Адрес')
    mail = models.CharField(max_length=200, verbose_name='Почта')

    class Meta:
        verbose_name = 'Настройки'
        verbose_name_plural = 'Настройки'

    def __str__(self):
        return self.mail
