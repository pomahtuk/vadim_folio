from django.contrib import admin
# Register your models here.
from suit.admin import SortableModelAdmin
from mptt.admin import MPTTModelAdmin
from .models import Page

class CategoryAdmin(MPTTModelAdmin, SortableModelAdmin):
    mptt_level_indent = 20
    list_display = ('title', 'slug', 'is_active')
    list_editable = ('is_active',)

    # Specify name of sortable property
    sortable = 'order'

admin.site.register(Page, CategoryAdmin)