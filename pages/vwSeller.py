"""
    @author kenneth.cruz@unah.hn
    @date   2021/07/24
    @version 0.1.0
"""


from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from pages.Tools import processDataProduct

import json



class Seller: 
    """
        Esta clase corresponde con la vista de User de cada usuario producto.
    """
    def __init__(self, engine):
        self.engine = engine

        
    """
        Devuelve la vista del Vendedor.
        
        @param request
        @param url
    """
    @csrf_exempt
    #def seller(self, request): 
    def seller(self, request, url): 
        return render(request, 'seller.html')


    """
    """
    @csrf_exempt
    def profileDescription(self, request):
        
        print("ESTA ES MI URL: ", request.POST.get('url'))
        id = int( request.POST.get('url').replace('seller', '').split('-')[0] )

        print("ESTA ES MI ID: ", id)

        if request.method:

            try:
                
                publishedProducts = self.engine.getPublishedProductsByEmail(
                                                                email=self.engine.getUserEmailByID(id=id) 
                                                        )
                profile           = self.engine.getUserInformationByEmail(
                                                                email=self.engine.getUserEmailByID(id=id) 
                                                        )
                raiting          = self.engine.raiting(id)
                #comment           = 
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'profile': profile, 
                                    'raiting': raiting,
                                    'product': processDataProduct(publishedProducts)
                                }
                            ),
                            content_type="application/json"
                        )

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")  
            #else:
            #    return HttpResponse(json.dumps({'status':'Empty', 'errorMessage':'No se encontro el usuario'}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")