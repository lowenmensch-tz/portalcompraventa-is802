from pages.views import gatherData
from django.urls import path
from django.conf.urls import include, url
from .views import *

urlpatterns = [
path('', testPage, name='test'),
path('ajax/gatherData', gatherData, name='gather_data'),
]