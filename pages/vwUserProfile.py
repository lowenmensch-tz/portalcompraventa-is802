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

        print( request.method )
        
        if request.method:

            email = request.session.get('email') 
            idUser = self.engine.getUserIDByEmail( email=email ) 

            #id_usuarioLogueado = getIdUser(request.session.get('email'))

            #if idUser != 0: #and id_usuarioLogueado !=0:
                
            estrellitasQuery = """SELECT SUBSTRING(CAST((SUM(calificacion) / COUNT(fk_usuarioCalificado)) AS CHAR), 1,4) as promedio_estrellas FROM CALIFICACION
                                WHERE fk_usuarioCalificado = %s;""" % (idUser)

            try:
                '''if calificacion != 0:
                    insertCalificacionQuery = """INSERT INTO CALIFICACION (fk_usuarioCalificador,fk_usuarioCalificado,calificacion) VALUES
                                                (%s,%s,%s);""" % (id_usuarioLogueado, id_usuario, calificacion)
                    cursor.execute(insertCalificacionQuery)
                if comentario != 0:
                    insertComentarioQuery = """INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
                                            ("Usuario",'%s',%s,%s);""" % (comentario, id_usuarioLogueado, id_usuario) # El valor de tipo por defecto va en Usuario
                    cursor.execute(insertComentarioQuery)
                database.commit()'''

                
                publishedProducts = self.engine.getPublishedProductsByEmail(email=email)
                profile           = self.engine.getUserInformationByEmail(email=email)
                comment           = self.engine.comment(id=idUser, type=1) # 1: 'Usuario'
                
                #datosUser = resultUser + resultEstrellitas + resultComentarios + resultArticulos # Lista de tuplas con los datos del usuario, calificacion, comentarios y articulos
                
                print( "ARTICULOS: ", publishedProducts )

                return HttpResponse(
                        json.dumps(
                                {
                                    'status':'Success', 
                                    'profile': profile, 
                                    'product': publishedProducts
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
