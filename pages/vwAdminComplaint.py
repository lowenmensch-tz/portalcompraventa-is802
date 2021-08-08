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
                        d.id_denuncia AS ID,
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


    @csrf_exempt
    def getDataOfAComplaint(self, request): 
        """
            Obtiene la información de una denuncia, asociada a una única persona
        """
        
        if request.method == 'POST':

            idComplaint = int(request.POST.get('idComplaint'))

            sql = """
                    SELECT
                        COUNT(*)
                    FROM 
                        DENUNCIA AS d
                    GROUP BY
                        d.fk_usuarioDenunciado
                    HAVING
                        d.fk_usuarioDenunciado = (
                            SELECT
                                fk_usuarioDenunciado
                            FROM
                                DENUNCIA
                            WHERE
                                id_denuncia = %s
                        );
            """%(idComplaint)

            try:
                
                result = self.engine.transaction( sql )[0][0]

                if result:
                    return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success', 
                                    'numberOfComplainst': result
                                }),content_type="application/json"
                        )
                else:
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


    @csrf_exempt
    def updateUserStatusReported(self, request): 
        """
            Actualiza el estado de una denuncia
            - 0: Rechazada, ninguna acción 
            - 1: Aceptada, damos de baja a un usuario 
                    - Se cambia el estado de la entidad USUARIO
                        - No puede acceder al sistema
                        - No se pueden visualizar sus productos
                        - Sus comentarios desaparecen
        """
        
        if request.method == 'POST':

            idComplaint = int(request.POST.get('idComplaint'))
            state  = int(request.POST.get('state')) #Estado de la denuncia
            deleteUser = int(request.POST.get('deleteUser')) # 0 Desestimar denuncia | 1 Dar de baja al usuario denunciado
            
            print("Respuesta desde el SERVER: ", request.POST)
            
            sqlSelect = """
                SELECT
                    fk_usuarioDenunciado
                FROM
                    DENUNCIA
                WHERE
                    id_denuncia = %s
            """%(idComplaint)

            
            message = ""

            try:
                
                if deleteUser: #1 Dar de baja al usuario denunciado

                    idReportedUser = self.engine.transaction( sqlSelect )[0][0]   

                    sqlUpdateComplaint = """
                            UPDATE DENUNCIA 
                            SET estado = %s
                            WHERE fk_usuarioDenunciado = %s
                            """%(state, idReportedUser)
                    
                    # 0 Dado de baja
                    sqlUpdateStateUser = """
                            UPDATE USUARIO
                            SET estado = %s
                            WHERE id_usuario = %s
                            """%(0, idReportedUser)
                    
                    self.engine.dms( sqlUpdateComplaint )        #Cambia el estado de la denuncia
                    self.engine.dms( sqlUpdateStateUser )       #Cambia el estado del usuario denunciado; ya no será visible en el sistema, no podrá acceder, no podrá comentar

                    message = "El usuario <strong>{}</strong> ha sido dado de baja".format( 
                                                        self.engine.transaction( 
                                                                    "SELECT nombre_completo FROM USUARIO WHERE id_usuario = %s"%(idReportedUser) 
                                                                )[0][0] 
                                                            )

                else:         #0 Desestimar denuncia

                    sqlUpdateComplaint = """
                            UPDATE DENUNCIA 
                            SET estado = %s
                            WHERE id_denuncia = %s
                            """%(state, idComplaint)

                    self.engine.dms( sqlUpdateComplaint )        #Cambia el estado de la denuncia

                    message = "La denuncia se ha atendido de forma satisfactoria"

                return HttpResponse(
                        json.dumps(  
                                { 
                                    'status':'Success',
                                    'message':message
                                }),content_type="application/json"
                        )
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")