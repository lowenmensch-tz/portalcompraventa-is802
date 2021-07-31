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
        Dar de baja a un producto seleccionado por el publicador
    """
    @csrf_exempt
    def deleteProductPublisher(self, request):

        print(request.POST)

        idProduct = int( request.POST.get('idProduct') )

        if request.method:

            # '0': producto dado de baja
            sql = """
            UPDATE ARTICULO 
            SET publicado = 0
            WHERE id_articulo = %s 
            """%( idProduct )

            try:
                self.engine.dms(sql=sql)                
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                }
                            ),
                            content_type="application/json"
                        )

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")  
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


    
    