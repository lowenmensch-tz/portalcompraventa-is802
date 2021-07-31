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
        Retorna el Email del usuario a partir del id.
        @param id: id del usuario
    """
    def getUserEmailByID(self, id): 
        
        sql="""
            SELECT
                correo AS Email
            FROM
                USUARIO
            WHERE
                id_usuario = %s;
            """%(id)

        result = self.transaction(sql)

        return result[0][0]


    
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
    def getUserInformationByEmail(self, email): 
        
        sql = """
            SELECT 
                SUBSTRING_INDEX(nombre_completo, ' ', 1) AS Firstname, 
                SUBSTRING_INDEX(nombre_completo, ' ', -1) AS Lastname, 
                correo AS Email,
                contrasenia AS Password,
                telefono AS Phone,
                direccion AS Address,
                id_usuario AS id 
            FROM 
                USUARIO 
            WHERE 
                correo = '%s'
                """%(email)

        result = self.transaction(sql)

        return result


    """"
        Retorna la información de todos los artículo publicados por un usuario, a partir de su correo.
        Incluyendo las imágenes.  

        @param email: correo del usuario
        @param limit: número de artículos a retornar
    """
    def getPublishedProductsByEmail(self, email, limit=False):
        
        sql = """
            SELECT 
                a.id_articulo AS id,
                a.nombre AS Title,
                c.nombre AS Category,
                d.nombre AS State,
                m.nombre AS Municipality,
                CAST(FORMAT(a.precio, 2) AS CHAR) AS Price,
                
                a.cantidad_disponible AS Quantity,
                CAST(a.fecha_publicacion AS CHAR) AS Date,
                a.descripcion AS Description,
                fn_getImage(a.id_articulo) AS Image
            FROM 
                ARTICULO AS a
            INNER JOIN 
                DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
            INNER JOIN 
                MUNICIPIO AS m ON a.fk_municipio = m.id_municipio
            INNER JOIN 
                CATEGORIA AS c ON a.fk_categoria = c.id_categoria
            INNER JOIN 
                USUARIO AS u ON a.fk_usuario = u.id_usuario
            WHERE 
                u.correo = '%s' AND 
                a.publicado = 1
            ORDER BY
                a.fecha_publicacion DESC;
            """%(email)

        if limit: 
            sql = sql.replace(';', '') + " LIMIT 2;"

        result = self.transaction(sql)

        return result


    """
        Retorna las imágenes asociadas a un artículo a partir del email del publicador.

        @param email: correo del publicador
    """
    def getProducImagetByEmail(self, email): 
        
        sql = """
            SELECT 
                i.enlace_imagen AS Image
            FROM 
                IMAGEN AS i
            INNER JOIN 
                ARTICULO AS a ON i.fk_articulo = a.id_articulo
            INNER JOIN 
                USUARIO AS u ON a.fk_usuario = u.id_usuario
            WHERE 
                u.correo = '%s';
            """%(email)

        result = self.transaction(sql)

        return result


    """
        Devuelve un diccionario con la información de los comentarios, nombre de los usuarios de los artículos publicados.

        @param fk_usuarioComentador: 
        @param tipo: 
                    1 'Usuario'
                    2 'Articulo'
                    3 'Denuncia' 
        @param fk_dirigidoA:
    """
    def comment(self, tipo, fk_dirigidoA):

        sql = """
        SELECT
            u.nombre_completo AS User,
            c.comentario AS Comment
        FROM
            COMENTARIO AS c
        INNER JOIN 
            USUARIO AS u ON c.fk_usuarioComentador = u.id_usuario
        WHERE
            tipo = %s AND fk_dirigidoA = %s;
        """ % (tipo, fk_dirigidoA) # REVISAR

        result = self.transaction(sql) 

        return result


    """
        Calificación (promedio) que tiene un vendedor
        @param idUsuario 
    """
    def raiting(self, idUser):

        sql = """
        SELECT
            CAST(AVG(calificacion) AS CHAR) AS AVG_Rating
        FROM
            CALIFICACION
        WHERE
            fk_usuarioCalificado  = %s
        """ % (idUser)

        result = self.transaction(sql)
        result = 0 if result[0][0] is None else float(result[0][0]) #En caso de aun no tener una calificación

        return result


    """
        Obtiene la descripción de un producto a partir de su id.
    """
    def getDetailProductByIDProduct(self, id):
        
        sql = """
            SELECT 
                a.id_articulo AS id,
                a.nombre AS Title,
                c.nombre AS Category,
                d.nombre AS State,
                m.nombre AS Municipality,
                CAST(FORMAT(a.precio, 2) AS CHAR) AS Price,
                
                a.cantidad_disponible AS Quantity,
                CAST(a.fecha_publicacion AS CHAR) AS Date,
                a.descripcion AS Description,
                fn_getImage(a.id_articulo) AS Image
            FROM 
                ARTICULO AS a
            INNER JOIN 
                DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
            INNER JOIN 
                MUNICIPIO AS m ON a.fk_municipio = m.id_municipio
            INNER JOIN 
                CATEGORIA AS c ON a.fk_categoria = c.id_categoria
            WHERE 
                a.id_articulo = %s AND 
                a.publicado = 1
            """%(id)

        result = self.transaction(sql)

        return result