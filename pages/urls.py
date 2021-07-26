from pages.views import almacenarArticulo 
from pages.views import productCategories
from pages.views import loggedInValidator
from pages.views import loginValidation 
from pages.views import registerUser
from pages.views import findProducts
from pages.views import updateUser
from pages.views import register
from pages.views import details
from pages.views import profile
from pages.views import seller
from pages.views import logout
from pages.views import login
from pages.views import index
from pages.views import user

from django.urls import path

from django.conf.urls import include
from django.conf.urls import url


urlpatterns = [
path('', index, name='index_page'),
path('login', login, name='login_page'),
path('ajax/loginValidation', loginValidation, name='login_validation'),
path('register', register, name='register_page'),
path('ajax/registerUser', registerUser, name='register_user'),

path('categories', productCategories, name='categories_page'),
path('ajax/findProducts', findProducts, name='find_products'),
path('ajax/almacenarArticulo', almacenarArticulo, name='almacenar_Articulo'),

path('user-profile', profile.userProfile, name='user_profile'),
path('ajax/updateUser', updateUser, name='update_User'),

#path('ajax/userProfile', userProfile, name='user_Profile'),
path('user', user, name='user'),
path('logout', logout),

url(r'^seller/ajax/sellerProfileDescription$', seller.profileDescription),
url(r'^seller/ajax/ratingAndComment$', seller.ratingAndComment),
url(r'^seller\/(\d{1,4}\-[0-9a-zA-Z-]+)$', seller.seller),
#
#path('seller/', seller.seller, name='seller_page'),

url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/productDetailsDescription$', details.productDetailsDescription),
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/review$', details.review, name='review'),
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/$', details.productDetails), # esta cosa solo es de prueba UwU
#url(r'^user\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/userProfile$', userProfile, name='user_Profile'),
url(r'^details\/(\d{1,4}\-[0-9a-zA-Z-]+)/ajax/loggedValidator', loggedInValidator),

]
