"""
    @author josue.virgilio@unah.hn, kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
"""


from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from pages.Tools import convertToDictionary
from pages.Tools import processDataProduct

import json



class UserProfile: 
    """
        Esta clase corresponde con la vista de User de cada usuario producto.
    """
    def __init__(self, engine):
        self.engine = engine

    """
        Retorna un JSON con la información del usuario.

        @param url: url que contiene el id del usuario a mostrar. La url esperada tiene la siguiente estructura 
                        5-carlos-sauceda
                        idUsuario-primerNombre-apellido
                        
        @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la petición dentro del mismo JSON se envia
                            una lista de tuplas que contiene la información del usuario ademas de la calificación y comentarios que este
                            ha recibido:
            
            Success: La ejecución fue exitosa y se encontraron registros.
            dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
            Empty: No se encontró el usuario
            requestError: No se recibió una petición POST.
    """

    @csrf_exempt
    def userProfile(self, request):

        if request.method:

            email = request.session.get('email') 
            idUser = self.engine.getUserIDByEmail( email=email ) 

            #id_usuarioLogueado = getIdUser(request.session.get('email'))

            #if idUser != 0: #and id_usuarioLogueado !=0:
                
            try:
                
                publishedProducts = self.engine.getPublishedProductsByEmail(email=email)
                profile           = self.engine.getUserInformationByEmail(email=email)
                
                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'profile': profile, 
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
