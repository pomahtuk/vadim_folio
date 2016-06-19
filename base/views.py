from django.shortcuts import render
from .models import SettingsObject


# Create your views here.
def index(request):
    settings_data = SettingsObject.objects.all()[:1]

    return render(request, 'index.html', {
        'settings': settings_data[0]
    })
