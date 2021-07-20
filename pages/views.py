from django.shortcuts import render, resolve_url
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

import json

import pages.conexion as conexion

# Create your views here.

"""
    Vista principal de la página.
    
    @param request
    @return render
"""
@csrf_exempt
def index(request):
    if request.session.get('email'):
        print(request.session['email'])
    return render(request,'index.html')

@csrf_exempt
def logout(request):
    del request.session['email']
    return render(request,'index.html')
    
@csrf_exempt
def user(request):
    return render(request,'user.html')

@csrf_exempt
def loggedInValidator(request,url):
    # print(request.session['email'])
    #del request.session['email']
    if request.session.get('email'):
        return  HttpResponse(json.dumps({'status':'Success','logged':'true'}),content_type="application/json")
    else:
        return  HttpResponse(json.dumps({'status':'Success','logged':'false'}),content_type="application/json")

"""
    Devuelve la vista de login.
    
    @param request
    @return render
"""
@csrf_exempt
def login(request):
    return render(request,'login.html',)

"""
    Valida que el usuario y contraseña existan y sean correctos. Si la variable remember es verdadera crea una sesión para el usuario.

    @param request: JSON con los valores de email, password y remember
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la petición:

        Success: La ejecución fue exitosa y el usuario y contraseña existen.
        Failed: La ejecución fue exitosa pero el usuario y contraseña no existen.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST. 
"""
@csrf_exempt
def loginValidation (request):
    if request.method == 'POST':
        email, password, remember = request.POST.get('email'), request.POST.get('password'), request.POST.get('remember')
        database, cursor = conexion.conectar()
        query = "SELECT COUNT(*) FROM USUARIO WHERE correo = '%s' AND contrasenia='%s';" % (email,password)
        #id = "SELECT id_usuario FROM USUARIO WHERE correo = '%s';" % (email)

        try:
            cursor.execute(query)
            result = cursor.fetchall()
            cursor.close()

            if result[0][0] == 1:

                # cursor.execute(id)
                # result = cursor.fetchone()

                request.session['email'] = email
                # request.session['userId'] = result[0]

                return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
            else:
                return HttpResponse(json.dumps({'status':'Failed'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Devuelve la vista de register.
    
    @param request
    @return render
"""
@csrf_exempt
def register(request):
    return render(request,'register.html',)

"""
    Petición para crear un nuevo usuario.

    @param request: JSON con los datos del usuario a crear email, contraseña, nombre completo, telefono, dirección, departamento.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la petición:

        Success: La ejecución fue exitosa y el usuario ha sido creado.
        Failed: La ejecución fue exitosa pero ha fallado la creación del nuevo usuario.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST. 
"""
@csrf_exempt
def registerUser (request):
    if request.method == 'POST':
        email, password, firstname, lastname = request.POST.get('email'), request.POST.get('password'), request.POST.get('firstname'), request.POST.get('lastname')
        address, phone, passwordr, terms = request.POST.get('address'), request.POST.get('phone'), request.POST.get('passwordr'), request.POST.get('terms')
        
        if password == passwordr:
            database, cursor = conexion.conectar()
            validateQuery = "SELECT COUNT(*) FROM USUARIO WHERE correo = '%s';" % (email)
            registerQuery = """ INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) 
                                VALUES ('%s','%s','%s','%s',1,'%s');""" % (firstname+' '+lastname,email,phone,address, password)
            try:
                cursor.execute(validateQuery)
                result = cursor.fetchall()
                if result[0][0] == 0:        
                    cursor.execute(registerQuery)
                    database.commit()
                    cursor.close()
                    return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
                else:
                    return HttpResponse(json.dumps({'status':'userFailed', 'message':'User already exists'}),content_type="application/json")   
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status':'passwordFailed', 'message':'Passwords doesnt match'}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Devuelve la vista de Busqueda General .
    
    @param request
    @return render
"""
@csrf_exempt
def productCategories(request):
    return render(request,'category.html',)
"""
    Retorna un JSON (muy sucio por cierto) con la información de los artículos que cumplen los filtros indicados en category.html

    @param request: JSON con los filtros por aplicarse a los productos.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion más otro JSON 
        con la información de los artículos en caso de encontrarlos:
        
        Success: La ejecución fue exitosa y se encontraron registros.
        Empty: La ejecución fue exitosa pero no se encontraron registros.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST. 
"""
@csrf_exempt
def findProducts(request):
    if request.method == 'POST':
        categoria, departamento, municipio = request.POST.get('categoria'), request.POST.get('departamento'), request.POST.get('municipio')
        preciomin, preciomax, fechaPublicacion = request.POST.get('preciomin'), request.POST.get('preciomax'), request.POST.get('fechaPublicacion')

        database, cursor = conexion.conectar()
        articulosQuery = """SELECT id_articulo, nombre, CAST(precio AS CHAR), descripcion, CAST(fecha_publicacion AS CHAR), fk_departamento, fk_municipio,
                            cantidad_disponible, fk_usuario, enlace_imagen FROM ARTICULO INNER JOIN IMAGEN
                            ON ARTICULO.id_articulo = IMAGEN.fk_articulo
                            WHERE (fk_categoria like '%s' AND precio BETWEEN '%s' AND '%s')
                            AND (fk_departamento  like '%s' AND fk_municipio like '%s') AND publicado = 1
                            AND id_imagen IN (SELECT min(id_imagen) FROM IMAGEN group by fk_articulo)
                            ORDER BY fecha_publicacion %s;""" % (categoria, preciomin, preciomax, departamento, municipio, fechaPublicacion)
        try:
            cursor.execute(articulosQuery)
            result = cursor.fetchall()
            cursor.close()
            if result != []:
                #articulos = json.dumps(result)
                return HttpResponse(json.dumps({'status':'Success', 'data':result}),content_type="application/json")
            else:
                return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


"""
    Devuelve la vista de Detalles del Producto.
    
    @param request
    @return render
"""
@csrf_exempt
def productDetails(request,url):
    return render(request,'detail.html',)

"""
    Petición para postear un nuevo artículo.

    @param request: JSON con la información del nuevo articulo a publicar.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion:
        
        Success: La ejecución fue exitosa y se encontraron registros.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST.
"""
@csrf_exempt
def almacenarArticulo(request):
    if request.method == 'POST':
        nombre, precio, descripcion = request.POST.get('nombre'), request.POST.get('precio'), request.POST.get('descripcion')
        fk_departamento, fk_municipio, = request.POST.get('fk_departamento'), request.POST.get('fk_municipio')
        cantidad_disponible, fk_categoria, fk_usuario = request.POST.get('cantidad_disponible'), request.POST.get('fk_categoria'), request.POST.get('fk_usuario')
        link_imagen1,link_imagen2,link_imagen3  = request.POST.get('link_imagen1'), request.POST.get('link_imagen2'), request.POST.get('link_imagen3')
        link_imagen4, link_imagen5 = request.POST.get('link_imagen4'), request.POST.get('link_imagen5')

        listaImagenes = [link_imagen1, link_imagen2, link_imagen3, link_imagen4, link_imagen5]
        listaImagenesContenido = []
        for i in range(5):
            if listaImagenes[i] != 0:
                listaImagenesContenido.append(listaImagenes[i])

        database, cursor = conexion.conectar()
        postQuery = """INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,
                        fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ('%s', CAST('%s' AS DECIMAL(13,4)), 
                        '%s', 1, NOW(), %s, %s, %s, %s, %s)""" % (nombre,precio,descripcion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario)

        fkArticuloQuery = "SELECT LAST_INSERT_ID();"
        
        try:
            cursor.execute(postQuery)
            database.comit()
            cursor.execute(fkArticuloQuery)
            result = cursor.fetchone()

            for i in range(len(listaImagenesContenido)):
                insertImageQuery = """INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES
                                    ('%s',%s);""" % (listaImagenesContenido[i],result[0])
                cursor.execute(insertImageQuery)
            database.comit()
            cursor.close()
            return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Retorna un JSON con la información del usuario.

    @param request: JSON con el correo del usuario a mostrar.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la petición dentro del mismo JSON se envia
                          una lista de tuplas que contiene la información del usuario ademas de la calificación y comentarios que este
                          ha recibido:
        
        Success: La ejecución fue exitosa y se encontraron registros.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST.
"""

@csrf_exempt
def userProfile(request):
    if request.method == 'POST':
        correo_usuario,calificacion, comentario = request.POST.get('correo_usuario'), request.POST.get('calificacion'), request.POST.get('comentario') #Puede ser el del id_usuario o el id_de cualquier otro usuario que ha publicado un artículo
        #id_usuario = request.POST.get('id_usuario')
        id_usuario = getIdUser(correo_usuario)

        if id_usuario != 0:
            database, cursor = conexion.conectar()

            userQuery = """SELECT nombre_completo,correo,telefono,direccion FROM USUARIO
                        WHERE id_usuario=%s;""" % (id_usuario)

            estrellitasQuery = """SELECT SUM(calificacion) / COUNT(fk_usuarioCalificado) as promedio_estrellas FROM CALIFICACION
                                WHERE fk_usuarioCalificado = %s;""" % (id_usuario)

            comentariosQuery = """SELECT comentario FROM COMENTARIO WHERE tipo = 'Usuario' AND fk_dirigidoA = %s;""" % (id_usuario)

            try:
                if calificacion != 0:
                    insertCalificacionQuery = """INSERT INTO CALIFICACION (fk_usuarioCalificador,fk_usuarioCalificado,calificacion) VALUES
                                                (%s,%s,%s);""" % (request.session['userId'], id_usuario, calificacion)
                    cursor.execute(insertCalificacionQuery)
                if comentario != 0:
                    insertComentarioQuery = """INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
                                            ("Usuario",'%s',%s,%s);""" % (comentario, request.session['userId'], id_usuario) # El valor de tipo por defecto va en Usuario
                    cursor.execute(insertComentarioQuery)
                database.commit()

                cursor.execute(userQuery)
                resultUser = [cursor.fetchone()]
                cursor.execute(estrellitasQuery)
                resultEstrellitas = [cursor.fetchone()]
                cursor.execute(comentariosQuery)
                resultComentarios = [cursor.fetchall()]
                datosUser = resultUser + resultEstrellitas + resultComentarios # Lista de tuplas con los datos del usuario, calificacion y comentarios

                return HttpResponse(json.dumps({'status':'Success', 'data':datosUser}),content_type="application/json")
            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")  
        return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Función utilizada por userProfile para obtener el id del usuario 

    @param correo: correo del usuario que publicó el artículo
    @return resultId[0]: Devuelve el id del usuario a partir de su correo en caso de no encontrarlo devuelve una variable booleana
                         donde 0 indica que no encontró el id usuario
"""
def getIdUser(correo):
    database, cursor = conexion.conectar()
    idUserQuery = """SELECT id_usuario FROM USUARIO WHERE correo = '%s'""" % (correo)
    errorConexion = 1
    try:
        cursor.execute(idUserQuery)
        resultId = cursor.fetchone()
        return resultId[0]
    except:
        errorConexion = 0
        return errorConexion

"""
    Devuelve un JSON con la información de los artículos publicados. 
    @param url: ejemplo de la url que se espera
                        12-dell-laptop-xps-15
                        idProducto-titulo-del-producto

    Por medio de la url se sustrae el id del producto y se busca en la base de datos.
"""
@csrf_exempt
def productDetailsDescription(request, url):
    
    #if request.method == 'POST':
        idProduct = int( url.split('-')[0] ) 

        sqlProduct = """
        SELECT 
            a.nombre AS Title, 
            a.descripcion AS Description,
            CAST(FORMAT(a.precio, 2) AS CHAR) AS Price, 
            a.fk_usuario AS User
        FROM 
            ARTICULO AS a
        INNER JOIN 
            CATEGORIA AS c ON a.fk_categoria = c.id_categoria
        INNER JOIN 
            DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
        WHERE 
            a.id_articulo = %s;
            """ % (idProduct)

        try:
            resultProduct = transaction(sqlProduct)

            if resultProduct != []:

                #return HttpResponse(json.dumps(
                #    { 
                #        'status':'Success', 
                #        **{
                #            'title':resultProduct[0][0], 
                #            'description':resultProduct[0][1], 
                #            'price':resultProduct[0][2], 
                #        }, 
                #        **productDetailsRating(resultProduct[0][-1]), # Calificación (promedio) del vendedor
                #        **productDetailsImage(idProduct=idProduct),    # Imagen del producto
                #        **productDetailsComments(idProduct=idProduct)  # Comentarios del producto
                #    
                #    }), content_type="application/json")

                return HttpResponse(
                    json.dumps(  
                            { 
                                'status':'Success', 
                                **{
                                    'title':resultProduct[0][0], 
                                    'description':resultProduct[0][1], 
                                    'price':resultProduct[0][2], 
                                }, 
                                **productDetailsRating(resultProduct[0][-1]),          # Calificación (promedio) del vendedor
                                'image': productDetailsImage(idProduct=idProduct),      # Imagen del producto
                                'comment': productDetailsComments(idProduct=idProduct),  # Comentarios del producto
                                **userInformation(resultProduct[0][-1])                   # Información del usuario     
                            }),content_type="application/json"
                    )
            else:
                return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    #else:
    #    return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")
    

""""
    Información del usuario
"""
def userInformation(idUser):
    sql = """
        SELECT
            u.nombre_completo AS Name,
            u.correo AS Email,
            u.telefono AS Phone,
            u.direccion AS Address
        FROM 
            USUARIO AS u
        WHERE id_usuario = %s;
        """ % (idUser)

    result = transaction(sql)

    if result: 

        return {
            'name': result[0][0],
            'email': result[0][1],  
            'phone': result[0][2],
            'address': result[0][3]
        }
    else:
        
        return {
            'name':  '',
            'email':  '',
            'phone':  '',
            'address': ''
        }


"""
    Devuelve un JSON con la información de los comentarios (actualizados) de un producto.
"""
def review(request):
    
    if request.method == 'POST':
        
        emailUserCommented = request.session.get('email') # Obtiene el correo del usuario que ha hecho el comentario
        emailUserPublication = request.POST.get('email') # Dueño del producto
        comment = request.POST.get('comment')           # Comentario de la reseña
        calification = request.POST.get('calification')# Calificación del comentario
        idProduct = request.POST.get('idProduct')     # ID del producto

        idUserPublication = getUserID(emailUserPublication)  # Obtiene el id del dueño del producto
        idUserCommented = getUserID(emailUserCommented)    # Obtiene el id del usuario que ha hecho el comentario

        sqlComment = """
        INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
            ('Articulo', '%s', %s, %s);
        """%(comment, idUserPublication, idUserCommented)

        sqlCalification = """
        INSERT INTO CALIFICACION (calificacion, fk_usuarioCalificador, fk_usuarioCalificado) VALUES
            (%s, %s, %s);
        """%(calification, idUserCommented, idUserPublication)
            
        dms(sqlComment)
        dms(sqlCalification)

        try: 
            updatedComments = productDetailsComments(idProduct=idProduct) 

            if updatedComments:

                return HttpResponse(json.dumps(
                                {
                                    'status':'Success',
                                    **productDetailsRating(idUser=idUserPublication), # Calificación (promedio) del dueño del producto
                                    'comment': updatedComments,                      # Comentarios del producto
                                }
                            ), 
                            content_type="application/json")

            else:
                return HttpResponse(json.dumps({'status':'Empty', 'message':'No se encontraron articulos'}),content_type="application/json")

        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")


"""
    Retorna el ID del usuario a partir del email.
    @param email: correo del usuario
"""
def getUserID(email): 
    
    sql="""
        SELECT
            id_usuario AS idUsuario
        FROM
            USUARIO
        WHERE
            correo = '%s';
        """%(email)

    result = transaction(sql)

    return result[0][0]


"""
    Devuelve un diccionario con la información de los comentarios, nombre de los usuarios de los artículos publicados.
    @param idProducto: Id del producto que se busca.
"""
def productDetailsComments(idProduct):

    sql = """
    SELECT
        u.nombre_completo AS User,
        c.comentario AS Comment
    FROM
        COMENTARIO AS c
    INNER JOIN 
        USUARIO AS u ON c.fk_usuarioComentador = u.id_usuario
    WHERE
        tipo = 1 AND fk_dirigidoA = %s 
    """ % (idProduct) # REVISAR

    result = transaction(sql)

    return convertToDictionary(data=result, key=['userCommenting', 'comment'])


"""
    Devuelve un diccionario con la información de las url de las imagénes asociadas al artículo publicado.
"""
def productDetailsImage(idProduct):

    sql = """
    SELECT
        enlace_imagen AS Image
    FROM
        IMAGEN
    WHERE
        fk_articulo = %s
    """ % (idProduct)

    result = transaction(sql)

    return convertToDictionary(data=result, key='photo')


"""
    Calificación (promedio) que tiene un vendedor
    @param idUsuario 
"""
def productDetailsRating(idUser):

    sql = """
    SELECT
        CAST(AVG(calificacion) AS CHAR) AS AVG_Rating
    FROM
        CALIFICACION
    WHERE
        fk_usuarioCalificado  = %s
    """ % (idUser)

    result = transaction(sql)

    return {   
            'rating': 0 if result[0][0] is None else float(result[0][0])
        }
    

"""
    Devuelve el resultado de la ejecución de una consulta a la base de datos.
"""
def transaction(sql): 
    
    database, cursor = conexion.conectar()
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()

    return result


"""
    Realizar un INSERT a la base de datos.
"""
def dms(sql): 
    
    database, cursor = conexion.conectar()
    cursor.execute(sql)
    database.commit()

    cursor.close()


"""
    Convierte una lista de tuplas en un diccionario.
    @param data: Lista con los datos de las filas.
    @param key: Lista con los nombres de las columnas. Puede ser un dato o una lista con los nombres de las columnas.

    # data = [('a', 'b'), ('c', 'd'), ('e', 'f'), ('g', 'h')]
"""
def convertToDictionary(data, key):
    
    jso = {}
    if data: 

        if len(data[0]) == 1:     

            for i in range(len(data)):
                jso[key + str(i)] = data[i][0]

        else: 

            for i in range(len(data)):
                for j in range(len(key)):
                    jso[key[j] + str(i)] = data[i][j]

    else:   
        if type(key) is  list and len(key) > 1:
            for i in range(len(key)):
                jso[key[i]] = ''
        else:
            jso[key + '0'] = ''
                
    return jso