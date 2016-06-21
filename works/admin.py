# -*- coding: utf-8 -*-
from django.contrib import admin
from suit_redactor.widgets import RedactorWidget
from .models import Work, WorkPart
from django.forms import ModelForm
from sorl.thumbnail.admin import AdminImageMixin


class WorkPartForm(ModelForm):
    class Meta:
        widgets = {
            'content': RedactorWidget(editor_options={'lang': 'ru'}),
        }

class WorkPartInline(AdminImageMixin, admin.StackedInline):
    form = WorkPartForm
    model = WorkPart
    extra = 0

class WorkAdmin(admin.ModelAdmin):
    ordering = ('-title',)
    list_display = ('title', 'published')
    list_editable = ('published',)
    inlines = [
        WorkPartInline,
    ]
    # suit_form_includes = (
    #     ('admin/extra.html', 'top'),
    # )


admin.site.register(Work, WorkAdmin)
