from django.contrib import admin
from django.forms import ModelForm
from .models import Recommendations
from suit_redactor.widgets import RedactorWidget
from suit.widgets import SuitSplitDateTimeWidget
from sorl.thumbnail.admin import AdminImageMixin


class RecommendationsForm(ModelForm):
    class Meta:
        widgets = {
            'content': RedactorWidget(editor_options={'lang': 'ru'}),
            'pub_date': SuitSplitDateTimeWidget,
        }


class RecommendationsAdmin(AdminImageMixin, admin.ModelAdmin):
    form = RecommendationsForm
    list_display = ('title', 'pub_date', 'published')
    list_editable = ('published',)


admin.site.register(Recommendations, RecommendationsAdmin)
