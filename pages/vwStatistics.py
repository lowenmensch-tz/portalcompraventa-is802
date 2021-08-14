"""
    @author kenneth.cruz@unah.hn
    @date   2021/08/03
    @version 0.1.0
"""

from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.http import HttpResponse

from django.shortcuts import resolve_url
from django.shortcuts import render 

import re

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
    def statistics(self, request):
        """
          
            @param request: <HttpRequest>
            @return: <HttpResponse>
        """

        if request.method == 'POST':

            try: 

                #if resultDailyReviews: 

                return HttpResponse(json.dumps(
                                {
                                    'status':'Success',
                                    'dailyReviews': self.getDailyReviews(),
                                    'categoryReviews': self.getTopFiveCategoryReviews(), 
                                    'countProductsByCategory': self.getCountProductsByCategory(),
                                    'percentageVisitsCategory': self.getPercentageVisitsCategory(), 
                                    'mostViewedProductByCategory': self.mostViewedProductByCategory()
                                }
                            ), 
                            content_type="application/json")

                #else: 
                #    return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")


    def processData(self, result, l1=0, l2=5):
        """
            Procesa los datos de la consulta
            @param result: <list>
            @param l1: <int> Limite inferior 
            @param l2: <int> Limite superior  
            @return: <list>
        """
        labels = []
        data = []

        for row in result:
            labels.append(row[0])
            
            if re.search(r'\%', str(row[-1])): 
                data.append(float(row[-1].replace('%', '').strip()))
            else:
                data.append( row[-1] )

        return [labels[l1:l2], data[l1:l2]]


    def getCategoryReviews(self):
        
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
            
        result = self.engine.transaction(sql)
        return result


    def getTopFiveCategoryReviews(self):
        """
            Primeras cinco categorias con mayores visitas
        """
        return self.getCategoryReviews()[0:5]


    def getPercentageVisitsCategory(self):
        """

        """
        result = self.getCategoryReviews()
        return self.processData(result)


    def getDailyReviews(self):
        """
            Obtiene la cantidad de visitas de todos los 
            productos durante las últimas 4 semanas 
        """
        
        resultDailyReviews = self.engine.transaction(sql="SELECT * FROM vw_dailyReviews;")[0]
        labels = [self.getNameMonth(3), self.getNameMonth(2), self.getNameMonth(1), self.getNameMonth()]

        return [labels, resultDailyReviews]


    def getCountProductsByCategory(self):
        """
            Obtiene la cantidad de productos por categoría
        """

        sql = """
                    SELECT 
                        c.nombre AS Category, 
                        TotProduct.TotProduct AS TotalProducts
                    FROM
                        CATEGORIA AS c
                    INNER JOIN 
                        (
                            SELECT
                                a.fk_categoria AS id,
                                COUNT(a.id_articulo) AS TotProduct
                            FROM
                                ARTICULO AS a
                            GROUP BY
                                a.fk_categoria
                        ) AS TotProduct ON c.id_categoria = TotProduct.id;
            """

        result = self.engine.transaction(sql)

        return self.processData(result, 0, -1)



    def mostViewedProductByCategory(self):
        """
            Obtiene los productos más visitados por categoría
            @return: <list>
        """
        
        sql= """
            --
            -- group-identifier, max-value-in-group
            --

            SELECT 
                CATEGORIA.nombre AS CategoryName,
                TopProduct.MostViewedProduct AS MostViewedProduct, 
                ARTICULO.nombre AS ProductName
                
            FROM
                vw_viewsByProduct
            INNER JOIN 
                (
                    SELECT 
                        views.id_categoria AS id_categoria,
                        MAX(views.Views) AS MostViewedProduct
                    FROM
                        vw_viewsByProduct AS views
                    GROUP BY
                        views.id_categoria
                ) TopProduct ON 
                                TopProduct.id_categoria = vw_viewsByProduct.id_categoria
                            AND 
                                TopProduct.MostViewedProduct = vw_viewsByProduct.Views
            INNER JOIN 
                CATEGORIA ON TopProduct.id_categoria = CATEGORIA.id_categoria
            INNER JOIN
                ARTICULO ON vw_viewsByProduct.id_articulo = ARTICULO.id_articulo;
            """
        
        result = self.engine.transaction(sql)
        return result