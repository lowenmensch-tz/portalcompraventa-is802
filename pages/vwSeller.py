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
        idSeller = int( request.POST.get('url').replace('seller', '').split('-')[0] ) #Vendedor
        emailSeller = self.engine.getUserEmailByID(id=idSeller)                      #Vendedor

        #emailCustomer = request.session.get('email')                 #Cliente
        #idCustomer = self.engine.getUserIDByEmail(email=emailCustomer) #Cliente

        print("ESTA ES MI ID: ", id)

        if request.method:

            try:
                
                sellerProducts = self.engine.getPublishedProductsByEmail(
                                                                email=self.engine.getUserEmailByID(id=idSeller) 
                                                        )
                profile           = self.engine.getUserInformationByEmail(
                                                                emailSeller
                                                        )
                raiting          = self.engine.raiting(idSeller)
                comment          = self.engine.comment(
                                                        tipo=1, 
                                                        fk_dirigidoA=idSeller
                                                    ) 
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'profile': profile, 
                                    'raiting': raiting,
                                    'product': processDataProduct(sellerProducts), 
                                    'comment': comment
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



    """
        Calificación del vendedor y comentario con respecto a este.
    """
    @csrf_exempt
    def raitingAndComment(self, request): 
        
        idCustomer = int( request.POST.get('url').replace('seller', '').split('-')[0] ) #id del publicador
        commentRequest = request.POST.get('comment') #Comentario del publicador
        emailSeller = request.POST.get('email') #email del publicador
        raiting = request.POST.get('raiting') #raiting del publicador
        idSeller = self.engine.getUserIDByEmail(email=emailSeller)

        if request.method:

            try:

                sqlComment = """
                            INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
                            ('Articulo', '%s', %s, %s);
                            """%(1, commentRequest, idCustomer, idSeller)

                sqlRaiting = """
                            INSERT INTO CALIFICACION (fk_usuarioCalificador,fk_usuarioCalificado,calificacion) VALUES
                            (%s,%s,%s);
                """%(idCustomer, idSeller, raiting)

                self.engine.dms(sql=sqlComment)
                self.engine.dms(sql=sqlRaiting)
                                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success'
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
