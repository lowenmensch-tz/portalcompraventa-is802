import sys
sys.path.append("..")
from datetime import datetime, timedelta
from pages.MySQLEngine import *

class ProductManager:

    """
        Constructor para la clase ProductManager
    """
    def __init__(self):
        pass

    """
        Obtiene el tiempo actual
        @return <datetime> Objeto con la infomación del día, fecha y hora actual.
    """
    def getCurrentDatetime(self):
        return datetime.now()

    """
        Calcula el tiempo inicial que el proceso dormira en caso que aun falte tiempo para el día elegido
        @return <int> Tiempo en segundos para el siguiente día de envios
    """
    def calculateFisrtSleepTime(self):
        now = self.getCurrentDatetime()

        tomorrow = now + timedelta(1) 
        timeDifference = datetime(year=tomorrow.year, month=tomorrow.month, day=tomorrow.day, hour=0, minute=0, second=0) 

        timeLeft =  int((timeDifference - datetime.now()).seconds)

        return timeLeft


    """
        Calcula la fecha mínima en la que el producto o servicio está vigente.
        @return <tuple> Contiene la fecha mínima en la que el producto o servicio está vigente.
    """
    def calculateDropDates(self):

        query = """SELECT tiempo_semanas FROM TIEMPO_PUBLICADO;""" #Consulta para obtener los tiempos en semanas para los productos y servicios
        sql = MySQLEngine() 
        result = sql.transaction(query)
        productWeekTime,serviceWeekTime = result[0][0], result[1][0]

        minProductDate = str((self.getCurrentDatetime().today() - timedelta(days=(7*int(productWeekTime)))).date())
        minServiceDate = str((self.getCurrentDatetime().today() - timedelta(days=(7*int(serviceWeekTime)))).date())

        return ((minProductDate, minServiceDate))

    """
        Elimina o da de baja los productos o servicios que hayan expirado.
    """
    def dropProductsAndServices(self):
        minProductDate, minServiceDate = self.calculateDropDates()

        productsQuery = """UPDATE ARTICULO SET publicado = 0 WHERE fecha_publicacion <= '%s' AND fk_categoria <> 8;""" % (minProductDate)
        servicesQuery = """UPDATE ARTICULO SET publicado = 0 WHERE fecha_publicacion <= '%s' AND fk_categoria = 8;""" % (minServiceDate)
        
        sql = MySQLEngine()

        sql.dms(productsQuery)
        sql.dms(servicesQuery)

pm = ProductManager()
pm.dropProductsAndServices()  