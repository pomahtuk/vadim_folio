from django.contrib import admin
# Register your models here.
from suit.admin import SortableModelAdmin
from mptt.admin import MPTTModelAdmin
from .models import Page, SettingsObject
from sorl.thumbnail.admin import AdminImageMixin

class CategoryAdmin(MPTTModelAdmin, SortableModelAdmin, AdminImageMixin):
    mptt_level_indent = 20
    list_display = ('title', 'slug', 'is_active')
    list_editable = ('is_active',)

    # Specify name of sortable property
    sortable = 'order'


class SettingsAdmin(admin.ModelAdmin):
    list_display = ('mail', 'phone', 'address')

admin.site.register(Page, CategoryAdmin)
admin.site.register(SettingsObject, SettingsAdmin)
