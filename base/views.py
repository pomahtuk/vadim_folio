from django.shortcuts import render
from .models import SettingsObject, Page


# Create your views here.
def index(request):
    settings_data = SettingsObject.objects.all()[:1]
    pages = Page.objects.all()

    return render(request, 'index.html', {
        'settings': settings_data[0],
        'pages': pages,
    })
