"""
    @author kenneth.cruz@unah.hn
    @date   2021/08/06
    @version 0.1.0
"""


from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from pages.Tools import convertToDictionary
from pages.Binacle import Binacle

import json



class AdministrationComplaint: 
    """
        Administración de las denuncias
    """


    def __init__(self, engine):
        self.engine = engine
        self.sql = """
                    SELECT
                        fn_getNameByID(d.fk_usuarioDenunciado) ReportedUser,
                        fn_getNameByID(d.fk_usuarioDenunciador) AS UserMakeReport,
                        c.comentario AS Comment,
                        CAST(c.fecha_publicacion AS CHAR) AS Date,
                        d.motivo AS Reason,
                        IF(d.estado=0, "Sín revisar", "Ejecutada") AS Status 
                    FROM
                        COMENTARIO AS c, DENUNCIA AS d
                    WHERE
                            c.tipo = 3 
                        AND 
                            d.fk_usuarioDenunciador = c.fk_usuarioComentador 
                        AND
                            d.fk_usuarioDenunciado  = c.fk_dirigidoA;
                    """


    @csrf_exempt
    def index(self, request):
        return render(request,'admin.html')


    @csrf_exempt
    def getAllDataComplaint(self, request): 
        """
            Obtiene la información de todas las denuncias
        """
        
        if request.method == 'POST':

            try:
                
                result = self.engine.transaction(self.sql)

                print(result)

                if result:
                    return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success', 
                                    'data': result
                                }),content_type="application/json"
                        )
                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


    @csrf_exempt
    def getAllDataComplaintChecked(self, request): 
        """
            Obtiene la información de todas las denuncias revisadas por el administrador
            - Denuncias que han sido ejecutadas
        """
        
        if request.method == 'POST':
            
            try:
                
                result = self.engine.transaction( self.sql.replace(";", " AND d.estado = 1;") )

                if result:
                    return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success', 
                                    'data': result
                                }),content_type="application/json"
                        )
                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


    @csrf_exempt
    def getAllDataComplaintNotChecked(self, request): 
        """
            Obtiene la información de todas las denuncias QUE NO han sido revisadas por el administrador
        """
        
        if request.method == 'POST':

            try:
                
                result = self.engine.transaction( self.sql.replace(";", " AND d.estado = 0;") )

                if result:
                    return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success', 
                                    'data': result
                                }),content_type="application/json"
                        )
                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")