from pages.views import gatherData
from django.urls import path
from django.conf.urls import include, url
from .views import *

urlpatterns = [
path('', testPage, name='test'), # Página Principal
path('ajax/gatherData', gatherData, name='gather_data'),
path('login', login, name='login_page'),
path('register', register, name='register_page'),
path('index', index, name='index_page'),
]