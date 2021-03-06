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
                SUBSTRING_INDEX(u.nombre_completo, ' ', 1) AS Firstname, 
                SUBSTRING_INDEX(u.nombre_completo, ' ', -1) AS Lastname, 
                u.correo AS Email,
                fn_getTimeElapsed(u.fecha_creacion) AS Since,
                u.telefono AS Phone,
                u.direccion AS Address,
                u.id_usuario AS id 
            FROM 
                USUARIO AS u
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
                    u.correo = '%s' 
                AND 
                    a.publicado = 1
                AND 
                    a.fk_usuario IN (
                        SELECT
                            user.id_usuario
                        FROM
                            USUARIO AS user
                        WHERE
                            user.estado = 1
                    );
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
                    u.correo = '%s'
                AND 
                    a.fk_usuario IN (
                        SELECT
                            user.id_usuario
                        FROM
                            USUARIO AS user
                        WHERE
                            user.estado = 1
                    );
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
                c.tipo = %s 
            AND 
                c.fk_dirigidoA = %s
            AND
                u.estado = 1;
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
                    a.id_articulo = %s 
                AND 
                    a.publicado = 1
                AND 
                    a.fk_usuario IN (
                        SELECT
                            user.id_usuario
                        FROM
                            USUARIO AS user
                        WHERE
                            user.estado = 1
                    );
            """%(id)

        result = self.transaction(sql)

        return result


    def getSellerProfileByIdProduct(self, idProduct): 
        
        sql = """
            SELECT
                u.id_usuario AS id,
                u.nombre_completo AS Name,
                u.correo AS Email,
                u.telefono AS Phone,
                u.direccion AS Address
            FROM 
                USUARIO AS u
            INNER JOIN
                ARTICULO AS a ON u.id_usuario = a.fk_usuario
            WHERE 
                    a.id_articulo = %s
                AND 
                    a.fk_usuario IN (
                        SELECT
                            user.id_usuario
                        FROM
                            USUARIO AS user
                        WHERE
                            user.estado = 1
                    );
            """ % (idProduct)

        result = self.transaction(sql)

        return result


    """
        Promedio de precios de productos por departamento
    """
    def averageProductPriceByDepartment(self):
        
        sql = """
            SELECT 
                FORMAT(AVG(a.precio), 2) AS Average,
                d.nombre AS Departament, 
                COUNT(a.fk_departamento) AS Cantidad
            FROM 
                ARTICULO AS a
            INNER JOIN 
                DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
            GROUP BY
                a.fk_departamento
            ORDER BY
                d.nombre
            ;
            """

        result = self.transaction(sql)
        return result
    
    """
    Muestra las categorias disponibles
    """
    def categories(self, id_usuario=0):
        allCategories="SELECT id_categoria, nombre FROM CATEGORIA WHERE estado = 1;" # Muestra todas las categorias

        result = self.transaction(allCategories)
        return result