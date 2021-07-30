"""
    @author kenneth.cruz@unah.hn
    @version 0.1.0
    @date   2021/07/29
"""


from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from pages.Tools import processDataProduct

import json


class SellerProduct:


    def __init__(self, engine):
        self.engine = engine
    

    @csrf_exempt
    def index(self, request, url):
        return render(request, 'sellerProduct.html')


    """
        Lista de productos del vendedor
        Permite: 
            - Editar un producto 
            - Dar de baja (Eliminar)
            - Actualizar un producto
    """
    @csrf_exempt
    def listProductPublisher(self, request):
        id =  self.engine.getUserIDByEmail(request.session.get('email')) #id del perfil del usuario

        if request.method:

            try:
                
                products = self.engine.getPublishedProductsByEmail(
                                                                            email=
                                                                            self.engine.getUserEmailByID(id=id) 
                                                                    )
                name = " ".join( self.engine.getUserInformationByEmail(email=request.session.get('email'))[0][:2] )
                raiting = self.engine.raiting(id)

                print("Length product: {} Products: {}\nName: {}\nRaiting: {}".format(len(products), products, name, raiting))
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'raiting': raiting,
                                    'product': processDataProduct(products), 
                                    'name': name
                                }
                            ),
                            content_type="application/json"
                        )

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")  
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")
        


    """
        Permite: 
            - Editar un producto 
            - Dar de baja (Eliminar)
            - Actualizar un producto
    """
    @csrf_exempt
    def listProductSeller(self, request):
        
        print("ESTA ES MI URL: ", request.POST.get('url'))
        idSeller = int( request.POST.get('url').replace('seller', '').split('-')[0] ) #Vendedor

        if request.method:

            try:
                
                sellerProducts = self.engine.getPublishedProductsByEmail(
                                                                            email=
                                                                            self.engine.getUserEmailByID(id=idSeller) 
                                                                    )
                raiting = self.engine.raiting(idSeller)
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'raiting': raiting,
                                    'product': processDataProduct(sellerProducts), 
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


    
    