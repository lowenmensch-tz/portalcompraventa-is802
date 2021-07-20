from pages.views import loginValidation, logout, productCategories, productDetails, registerUser, user, loggedInValidator, userProfile, almacenarArticulo
from django.urls import path
from django.conf.urls import include, url
from .views import *

urlpatterns = [
path('', index, name='index_page'),
path('login', login, name='login_page'),
path('ajax/loginValidation', loginValidation, name='login_validation'),
path('register', register, name='register_page'),
path('ajax/registerUser', registerUser, name='register_user'),
path('categories', productCategories, name='categories_page'),
path('ajax/findProducts', findProducts, name='find_products'),
path('ajax/almacenarArticulo', almacenarArticulo, name='almacenar_Articulo'),
path('ajax/userProfile', userProfile, name='user_Profile'),
path('user', user, name='user'),
path('logout', logout),
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/loggedValidator', loggedInValidator),
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/$', productDetails), # esta cosa solo es de prueba UwU
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/productDetailsDescription$', productDetailsDescription),

]
