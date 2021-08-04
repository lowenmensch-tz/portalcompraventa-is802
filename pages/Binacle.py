"""
    @author kenneth.cruz@unah.hn
    @date   2021/08/03
    @version 0.1.0
"""


class Binacle:
    """
    Binacle class
    """

    def __init__(self, engine):
        """
        Constructor
        """

        self.engine = engine


    """
        Número de visitas que realiza un usuario a un producto
        - No cuenta sí el usuario logeado visita sus productos publicados
    """
    def addRecordVisitedProduct(self, data):
        
        sql = """
                INSERT INTO BITACORA(id_usuario, id_articulo, fecha_inicial, fecha_final) VALUES
                    ( %s, %s, CAST('%s' AS DATETIME), CAST('%s' AS DATETIME) )
                ;
                """%(data['idUser'], data['idProduct'], data['startDate'], data['endDate'])
        
        self.engine.dms(sql)