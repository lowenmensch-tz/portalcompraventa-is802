"""
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
"""


from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from pages.Tools import convertToDictionary
from pages.Binacle import Binacle

import json



class Details: 
    """
        Esta clase corresponde con la vista de Detales de un producto.
    """ 

    
    def __init__(self, engine):
        self.engine = engine
        
        
    """
        Devuelve la vista de Detalles del Producto.
        
        @param request
        @return render
    """
    @csrf_exempt
    def productDetails(self, request, url):
        return render(request,'detail.html',)


    """
        Devuelve un JSON con la información de los artículos publicados. 
        @param url: ejemplo de la url que se espera
                            12-dell-laptop-xps-15
                            idProducto-titulo-del-producto

        Por medio de la url se sustrae el id del producto y se busca en la base de datos.
    """
    @csrf_exempt
    def productDetailsDescription(self, request, url):
        
        #if request.method == 'POST':
            idProduct = int( url.split('-')[0] ) 
            email = request.session.get('email')
            sqlProduct = """
            SELECT 
                a.nombre AS Title, 
                a.descripcion AS Description,
                CAST(FORMAT(a.precio, 2) AS CHAR) AS Price, 
                a.fk_usuario AS User,
                a.id_articulo
            FROM 
                ARTICULO AS a
            INNER JOIN 
                CATEGORIA AS c ON a.fk_categoria = c.id_categoria
            INNER JOIN 
                DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
            WHERE 
                a.id_articulo = %s;
                """ % (idProduct)

            try:
                resultProduct = self.engine.transaction(sqlProduct)
                cust = self.engine.transaction("SELECT nombre_completo FROM USUARIO WHERE correo = '%s'"%(email))
                if resultProduct != []:
                    return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success', 
                                    'customer': cust,
                                    'title':resultProduct[0][0], 
                                    'description':resultProduct[0][1], 
                                    'price':resultProduct[0][2], 
                                    'image': convertToDictionary(
                                                                data=self.productDetailsImage(idProduct=idProduct), 
                                                                key='photo'
                                                            ),
                                    'rating': self.engine.raiting(resultProduct[0][3]),  # Calificación (promedio) del vendedor
                                    'comment': convertToDictionary(
                                                                    data=self.productDetailsComments(idProduct=idProduct),
                                                                    key=['userCommenting', 'comment']
                                                                ), 
                                    'profilePublisher': self.engine.getSellerProfileByIdProduct(idProduct=idProduct),
                                    'id_articulo':resultProduct[0][4]              # Información del usuario     
                                }),content_type="application/json"
                        )
                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        #else:
        #    return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")
    

    """
        Devuelve un JSON con la información de los comentarios (actualizados) de un producto.
    """
    @csrf_exempt
    def review(self, request, url):
        
        if request.method == 'POST':

            emailUserCommented = request.session.get('email')           # Obtiene el correo del usuario que ha hecho el comentario
            comment = request.POST.get('comentario')                  # Comentario de la reseña
            
            idProduct = int( url.split('-')[0] )                   # ID del producto
            idUserCommented = self.engine.getUserIDByEmail(emailUserCommented)     # Obtiene el id del usuario que ha hecho el comentario

            sqlComment = """
            INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
                ('Articulo', '%s', %s, %s);
            """%(comment, idUserCommented, idProduct)

            self.engine.dms(sqlComment)

            try: 
                updatedComments = self.productDetailsComments(idProduct=idProduct) 

                if updatedComments:
                    return HttpResponse(json.dumps(
                                    {
                                        'status':'Success',
                                        'comment': updatedComments,                      # Comentarios del producto
                                    }
                                ), 
                                content_type="application/json")

                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")


    """
        Devuelve un diccionario con la información de los comentarios, nombre de los usuarios de los artículos publicados.
        @param idProducto: Id del producto que se busca.
    """
    def productDetailsComments(self, idProduct):

        sql = """
        SELECT
            u.nombre_completo AS User,
            c.comentario AS Comment
        FROM
            COMENTARIO AS c
        INNER JOIN 
            USUARIO AS u ON c.fk_usuarioComentador = u.id_usuario
        WHERE
            tipo = 2 AND fk_dirigidoA = %s 
        """ % (idProduct) # REVISAR

        result = self.engine.transaction(sql) # Result viene vación incluso luego de insertar un comentario (ya se puede ingresar comentarios)

        return result


    """
        Devuelve un diccionario con la información de las url de las imagénes asociadas al artículo publicado.
    """
    def productDetailsImage(self, idProduct):

        sql = """
        SELECT
            enlace_imagen AS Image
        FROM
            IMAGEN
        WHERE
            fk_articulo = %s
        """ % (idProduct)

        result = self.engine.transaction(sql)

        return result


    """
    """
    @csrf_exempt
    def log(self, request, url):

        if request.method == 'POST':
            
            binacle = Binacle(self.engine)
            data = {
                "idUser":  self.engine.getUserIDByEmail( email=request.session.get('email') ),
                "idProduct": int(request.POST.get('idProduct')), 
                "startDate": request.POST.get('startDate'), 
                "endDate": request.POST.get('endDate')
            }

            try: 
                
                if request.POST: 

                    binacle.addRecordVisitedProduct(data)

                    return HttpResponse(json.dumps(
                                    {
                                        'status':'Success',
                                    }
                                ), 
                                content_type="application/json")

                else: 
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
