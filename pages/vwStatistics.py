"""
    @author kenneth.cruz@unah.hn
    @date   2021/08/03
    @version 0.1.0
"""

from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 


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


    @csrf_exempt
    def index(self, request):
        return render(request, 'statisticsTest.html')


    @csrf_exempt
    def getDataAverageProductPriceByDepartment(self, request):
        
        if request.method == 'POST':
            
            try: 

                result = self.engine.averageProductPriceByDepartment()
                labels = []
                data = []

                for index in range(len(result)):
                    
                    labels.append( result[index][1] )
                    data.append( float(result[index][0].replace(',','')) )
                
                print(labels)
                print(data)

                if result: 

                    return HttpResponse(json.dumps(
                                    {
                                        'status':'Success',
                                        'labels':labels,
                                        'data': data
                                    }
                                ), 
                                content_type="application/json")

                else: 
                    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")