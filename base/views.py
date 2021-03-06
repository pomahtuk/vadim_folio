from django.shortcuts import render
from .models import SettingsObject, Page
from news.models import News
from recommendations.models import Recommendations
from works.models import Work


# Create your views here.
def index(request):
    settings_data = SettingsObject.objects.all()[:1]
    pages = Page.objects.all()
    news = News.objects.filter(published=True).order_by('-pub_date')
    recommendations = Recommendations.objects.filter(published=True).order_by('-pub_date')
    works = Work.objects.filter(published=True).prefetch_related('details')

    return render(request, 'index.html', {
        'settings': settings_data[0],
        'pages': pages,
        'news': news,
        'recommendations': recommendations,
        'works': works,
        'split_list': [9, 18, 27, 36, 45],
    })
