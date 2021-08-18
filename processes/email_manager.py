import sys
sys.path.append("..")

from datetime import datetime, timedelta
from pages.MySQLEngine import *
import smtplib

from email.message import EmailMessage
from email.utils import make_msgid
import mimetypes

class EmailManager:

    """
        Constructor del objeto EmailManager
        @param <int> weekday Es el día de la semana en el cual se desea enviar el correo en un rango de 0 - 6, siendo Lunes = 0
        @param <int> hour Es la hora a la que se envía el correo en un rango de 0 - 23
    """
    def __init__(self, weekday=6, hour=0):
        self.weekday = weekday
        self.hour = hour

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

        diff = (self.weekday - now.weekday()) % 7 
        diff = int(diff)*24*60*60 

        tomorrow = now + timedelta(1) 
        timeDifference = datetime(year=tomorrow.year, month=tomorrow.month, day=tomorrow.day, hour=self.hour, minute=0, second=0) 

        timeLeft =  int((timeDifference - datetime.now()).seconds) + diff

        return timeLeft

    """
        Obtiene el listado de correos de los usuarios suscritos a una o más categorias.
        @return <list> result Devuelve una lista con los correos de los usuarios suscritos.
    """
    def gatherEmails(self):
        query = """SELECT DISTINCT USUARIO.correo FROM SUSCRIPCION INNER JOIN USUARIO ON USUARIO.id_usuario = SUSCRIPCION.fk_usuario;"""
        sql = MySQLEngine()

        result = sql.transaction(query)
        result = [email[0] for email in result]
        
        return result

    """
        Obtiene el listado de categorias suscritas por usuario.
        @return <dict> Diccionario con todas las categorias por usuario.
    """
    def categoriesPerUser(self):
        result = {}
        emails = self.gatherEmails()
        sql = MySQLEngine()
        query = """
                    SELECT DISTINCT SUSCRIPCION.fk_categoria 
                    FROM SUSCRIPCION 
                    INNER JOIN USUARIO ON SUSCRIPCION.fk_usuario = USUARIO.id_usuario 
                    INNER JOIN CATEGORIA ON SUSCRIPCION.fk_categoria = CATEGORIA.id_categoria
                    WHERE USUARIO.correo = '%s' AND CATEGORIA.estado = 1;
                """
        for email in emails:
            subscription = [sub[0] for sub in (sql.transaction(query % (email)))]
            result[email] = subscription

        return result

    """
        Obtiene el rango de Fechas de los productos más actuales.
        @return <tuple> Tupla con el rango de fechas de los productos más recientes.
    """
    def calculateDateRange(self):
        minDate = str((self.getCurrentDatetime().today() - timedelta(days=7)).date())
        maxDate = str(self.getCurrentDatetime().date())
        
        return (minDate,maxDate)

    """
        Obtiene los datos de los 3 productos más recientes de cada categoria.
        @return <dict> Diccionario que contiene los 3 productos más recientes de cada categoría.
    """
    def gatherLatestsProducts(self):
        
        result = {}
        minDate, maxDate = self.calculateDateRange()

        categoryIds = """SELECT id_categoria FROM CATEGORIA;"""

        productsQuery = """    
                            SELECT ARTICULO.nombre, CAST(FORMAT(ARTICULO.precio, 2) AS CHAR), IMAGEN.enlace_imagen , IMAGEN.id_imagen
                            FROM ARTICULO 
                            INNER JOIN IMAGEN ON ARTICULO.id_articulo = IMAGEN.fk_articulo 
                            WHERE IMAGEN.id_imagen IN (SELECT min(IMAGEN.id_imagen) FROM IMAGEN GROUP BY IMAGEN.fk_articulo) 
                            AND ARTICULO.fk_categoria = %s AND ARTICULO.publicado = 1 AND (ARTICULO.fecha_publicacion BETWEEN '%s' AND '%s') LIMIT 3;
                        """
        sql = MySQLEngine()

        categoryIds = [category[0] for category in sql.transaction(categoryIds)]

        for category in categoryIds:
            #products = sql.transaction(productsQuery % (category,'2021-08-06','2021-08-08'))
            products = sql.transaction(productsQuery % (category,minDate,maxDate))
            result[category] = products

        return result

    def sendEmails(self):

        emails = self.gatherEmails()
        catPerUser = self.categoriesPerUser()
        products = self.gatherLatestsProducts()

        for email in emails:
            msg = EmailMessage()
            
            aux = 0
            control = 1
            # Información del Emisor y Receptor
            sender_address = 'test.development.hn@gmail.com'
            sender_pass = 'T4querit0_d3+Queso'
            receiver_address = email

            # Títulos de Email Genéricos
            msg.set_content('')
            msg['Subject'] = 'Portal Compra Venta - Últimas Novedades'
            msg['From'] = sender_address
            msg['To'] = receiver_address

            alternative = "<html><body><h2>Hola, estas son las últimas promociones de las categorías a las que estás suscrito<br></h2>"

            if len(catPerUser[email]) >= 3:
                
                image_cid = []
                image_cid.append(make_msgid(domain='portalcompraventas1.com'))
                image_cid.append(make_msgid(domain='portalcompraventas2.com'))
                image_cid.append(make_msgid(domain='portalcompraventas3.com'))

                for category in catPerUser[email]:
                    alternative += """
                                        <h4>%s<br></h4>
                                        <a href="">
                                            <img src="cid:%s">
                                        </a>
                                        """ % (products[category][aux][0],image_cid[control-1][1:-1])
                    control+=1
                    if control > 3: break

                alternative += "</body></html>"
                msg.add_alternative(alternative,subtype='html')
                control = 1

                for category in catPerUser[email]:

                    with open('..%s' % (products[category][aux][2]), 'rb') as img:
                        maintype, subtype = mimetypes.guess_type(img.name)[0].split('/')
                        msg.get_payload()[1].add_related(img.read(), 
                                                            maintype=maintype, 
                                                            subtype=subtype, 
                                                            cid=image_cid[control-1])
                    control += 1
                    if control > 3: break

                    
                # Crear una sesión SMPT para enviar el correo
                session = smtplib.SMTP('smtp.gmail.com', 587) # Servidor SMTP gratuito de gmail
                session.starttls() # Habilitar la seguridad
                session.login(sender_address, sender_pass) # Iniciar Sesión
                text = msg.as_string() # Convertir el objeto EmailMessage a una cadena
                session.sendmail(sender_address, receiver_address, text) # Enviar Correo
                session.quit() # Cerrar la conexión 
                print('Email Enviado con éxito')

            else:

                image_cid = []
                image_cid.append(make_msgid(domain='portalcompraventas1.com'))
                image_cid.append(make_msgid(domain='portalcompraventas2.com'))
                image_cid.append(make_msgid(domain='portalcompraventas3.com'))
                image_cid.append(make_msgid(domain='portalcompraventas4.com'))
                image_cid.append(make_msgid(domain='portalcompraventas5.com'))
                image_cid.append(make_msgid(domain='portalcompraventas6.com'))

                for category in catPerUser[email]:

                    for product in products[category]:
                        alternative += """
                                            <h4>%s<br></h4>
                                            <a href="">
                                                <img src="cid:%s">
                                            </a>
                                            """ % (product[0],image_cid[control-1][1:-1])
                        control+=1
                
                alternative += "</body></html>"
                msg.add_alternative(alternative,subtype='html')
                control = 1
                
                for category in catPerUser[email]:

                    for product in products[category]:
                        with open('..%s' % (product[2]), 'rb') as img:
                            maintype, subtype = mimetypes.guess_type(img.name)[0].split('/')
                            msg.get_payload()[1].add_related(img.read(), 
                                                                maintype=maintype, 
                                                                subtype=subtype, 
                                                                cid=image_cid[control-1])
                        control+=1

                # Crear una sesión SMPT para enviar el correo
                try:
                    session = smtplib.SMTP('smtp.gmail.com', 587) # Servidor SMTP gratuito de gmail
                    session.starttls() # Habilitar la seguridad
                    session.login(sender_address, sender_pass) # Iniciar Sesión
                    text = msg.as_string() # Convertir el objeto EmailMessage a una cadena
                    session.sendmail(sender_address, receiver_address, text) # Enviar Correo
                    session.quit() # Cerrar la conexión 
                    print('Email Enviado con éxito')
                except:
                    print('Algo salió mal al enviar los correos')

