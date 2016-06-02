from django.contrib import admin
from django.forms import ModelForm
from .models import News
from suit_redactor.widgets import RedactorWidget
from suit.widgets import SuitSplitDateTimeWidget


class NewsForm(ModelForm):
    class Meta:
        widgets = {
            'content': RedactorWidget(editor_options={'lang': 'ru'}),
            'pub_date': SuitSplitDateTimeWidget,
        }


class NewsAdmin(admin.ModelAdmin):
    form = NewsForm


admin.site.register(News, NewsAdmin)
