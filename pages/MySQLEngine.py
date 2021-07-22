"""
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
"""



import pages.conexion as conexion



class MySQLEngine: 

    """
        Clase que que realiza transacciones con la base de datos.
        INSERT y consultas. 
    """

    def __init__(self): 
        pass


    """
        Devuelve el resultado de la ejecución de una consulta a la base de datos.
    """
    def transaction(self, sql): 
        
        database, cursor = conexion.conectar()
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()

        return result


    """
        Realizar un INSERT a la base de datos.
    """
    def dms(self, sql): 
        
        database, cursor = conexion.conectar()
        cursor.execute(sql)
        database.commit()

        cursor.close()