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

    
    """
        Retorna el ID del usuario a partir del email.
        @param email: correo del usuario
    """
    def getUserIDByEmail(self, email): 
        
        sql="""
            SELECT
                id_usuario AS idUsuario
            FROM
                USUARIO
            WHERE
                correo = '%s';
            """%(email)

        result = self.transaction(sql)

        return result[0][0]


    """
        Retorna la información de un usuario a partir de su correo.
        @param email: correo del usuario
    """
    def getInformationUserByEmail(self, email): 
        
        sql = """
            SELECT 
                SUBSTRING_INDEX(nombre_completo, ' ', 1) AS Firstname, 
                SUBSTRING_INDEX(nombre_completo, ' ', -1) AS Lastname, 
                correo AS Email,
                contrasenia AS Password,
                telefono AS Phone,
                direccion AS Address 
            FROM 
                USUARIO 
            WHERE 
                correo = '%s'
                """%(email)

        result = self.transaction(sql)

        return result