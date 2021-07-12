from pages.views import loginValidation, registerUser
from django.urls import path
from django.conf.urls import include, url
from .views import *

urlpatterns = [
path('', index, name='index_page'),
path('login', login, name='login_page'),
path('ajax/loginValidation', loginValidation, name='login_validation'),
path('register', register, name='register_page'),
path('ajax/registerUser', registerUser, name='register_user'),
]