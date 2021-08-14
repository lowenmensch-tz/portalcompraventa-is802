"""
    @author kenneth.cruz@unah.hn
    @date   2021/08/03
    @version 0.1.0
"""

from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

from datetime import timedelta
from datetime import datetime


import json


class Statistics:
    """
        Todo lo relacionado con estadísticas 
        para la vista del administrador
    """
    

    def __init__(self, engine):
        """
            Constructor de la clase
        """
        self.engine = engine
        self.week = { 
                        'january': 'enero', 'february': 'Febrero', 'march': 'Marzo', 'april': 'Abril', 
                        'may': 'mayo', 'june': 'Junio', 'july': 'Julio', 'august': 'Agosto', 
                        'september': 'Septiembre', 'october': 'Octubre', 'november': 'Noviembre', 'december': 'Diciembre' 
                    }


    @csrf_exempt
    def index(self, request):
        return render(request, 'statisticsTest.html')


    def getNameMonth(self, week=0): 
        """
            Retorna el nombre del mes actual,
            junto con la fecha del día
            @param week: <int>
            @return: <str>
        """
        data = (datetime.now() - timedelta(seconds=week*7*24*60*60)).strftime('%B - %d').split("-")
        return "{} {}".format(self.week[data[0].lower().strip()], data[-1].strip()) 


    @csrf_exempt
    def getDailyReviews(self, request):
        """
            Obtiene la cantidad de visitas de todos los 
            productos durante las últimas 4 semanas 
            @param request: <HttpRequest>
            @return: <HttpResponse>
        """

        if request.method == 'POST':

            sql="""
                    SELECT 
                        Category, 
                        CONCAT(CAST(FORMAT(DurationTime, 2) AS CHAR), 's'), 
                        CONCAT(CAST( FORMAT((TotalReviews/(SELECT COUNT(*) FROM BITACORA))*100, 2)AS CHAR), '%') 
                    FROM 
                        vw_categoryReviews 
                    ORDER BY 
                        TotalReviews DESC 
                    ;
                """
            
            try: 
                result = self.engine.transaction(sql)
                resultDailyReviews = self.engine.transaction(sql="SELECT * FROM vw_dailyReviews;")[0]
                resultCategoryReviews = result[0:5]
                labels = [self.getNameMonth(3), self.getNameMonth(2), self.getNameMonth(1), self.getNameMonth()]

                if resultDailyReviews: 

                    return HttpResponse(json.dumps(
                                    {
                                        'status':'Success',
                                        'dailyReviews': [labels, resultDailyReviews],
                                        'categoryReviews': resultCategoryReviews, 
                                        'percentageVisitsCategory': self.processData(result)
                                    }
                                ), 
                                content_type="application/json")

                else: 
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")


    def processData(self, result):
        """
            Procesa los datos de la consulta
            @param data: <list>
            @return: <list>
        """
        labels = []
        data = []

        for row in result:
            labels.append(row[0])
            data.append(float(row[-1].replace('%', '').strip()))

        return [labels[0:5], data[0:5]]


    def getDataAverageProductPriceByDepartment(self):
        
        result = self.engine.averageProductPriceByDepartment()
        labels = []
        data = []

        for index in range(len(result)):
            
            labels.append( result[index][1] )
            data.append( float(result[index][0].replace(',','')) )
        
        if result: 

            return HttpResponse(json.dumps(
                            {
                                'status':'Success',
                                'labels':labels,
                                'data': data
                            }
                        ), 
                        content_type="application/json")


