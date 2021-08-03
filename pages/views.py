from django.views.decorators.csrf import csrf_exempt # Este decorador solo es de prueba y no una solución para la cookie csrf

from django.shortcuts import resolve_url
from django.shortcuts import render 

from django.http import HttpResponse

from pages.MySQLEngine import MySQLEngine

from pages.vwSellerProduct import SellerProduct
from pages.vwUserProfile import UserProfile
from pages.vwDetails import Details
from pages.vwSeller import Seller

import json

from django.core.files.storage import FileSystemStorage

import pages.conexion as conexion

# Create your views here.

engine = MySQLEngine()            #Ejecuta statements de la base de datos. SELECT (tranaction), INSERT (dms). 
sellerProduct = SellerProduct(engine)
profile = UserProfile(engine)  #Funciones de la Vista donde se muestra la información de los artículos
details = Details(engine)    #Funciones pertenecientes a la Vista Donde se muestra la información de los artículos
seller = Seller(engine)     #Funciones de la vista del vendedor desde el punto de vista del cliente.   


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

"""
    Devuelve la vista de perfil de usuario.
    
    @param request
    @return render
"""   
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
    Devuelve la vista de la lista de deseo.
    
    @param request
    @return render
"""  
@csrf_exempt
def wishlist(request):
    return render(request,'wishlist.html')

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
        priceOrder = request.POST.get('priceOrder')

        database, cursor = conexion.conectar()
        articulosQuery = """SELECT id_articulo, CONCAT(SUBSTRING(nombre,1,27),'...'), CAST(FORMAT(precio, 2) AS CHAR), CONCAT(SUBSTRING(descripcion,1,35),'...'), CAST(fecha_publicacion AS CHAR), fk_departamento, fk_municipio,
                            cantidad_disponible, fk_usuario, enlace_imagen FROM ARTICULO INNER JOIN IMAGEN
                            ON ARTICULO.id_articulo = IMAGEN.fk_articulo
                            WHERE (fk_categoria like '%s' AND precio BETWEEN '%s' AND '%s')
                            AND (fk_departamento  like '%s' AND fk_municipio like '%s') AND publicado = 1
                            AND id_imagen IN (SELECT min(id_imagen) FROM IMAGEN group by fk_articulo)
                            ORDER BY fecha_publicacion %s, precio %s;""" % (categoria, preciomin, preciomax, departamento, municipio, fechaPublicacion, priceOrder)
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
        cantidad_disponible, fk_categoria = request.POST.get('cantidad_disponible'), request.POST.get('fk_categoria')
        fk_usuario = getIdUser(request.session.get('email'))

        postQuery = """
                        INSERT INTO ARTICULO (
                                            nombre,
                                            precio,
                                            descripcion,
                                            publicado,
                                            fk_departamento,
                                            fk_municipio,
                                            cantidad_disponible,
                                            fk_categoria,
                                            fk_usuario
                                            ) VALUES 
                            ('%s', CAST('%s' AS DECIMAL(13,4)), '%s', 1, %s, %s, %s, %s, %s)
                        """ % (nombre, precio, descripcion, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario)

        try:

            engine.dms( postQuery )

            return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")


#Cargar los archivos de tipo imagen al servidor
@csrf_exempt
def loadImage(request): 

    if request.method == 'POST': # and request.FILES['loadFileImage']:
    

        try: 
            getLastID = "SELECT id_articulo FROM ARTICULO ORDER BY id_articulo DESC LIMIT 1;"
            result = engine.transaction(getLastID)
            

            imageFiles = request.FILES

            print("A VER: ",  imageFiles )
            fs = FileSystemStorage()

            for key in imageFiles:
                
                file = fs.save(imageFiles[key].name, imageFiles[key])
                uploaded_file_url = fs.url(file)

                print("URL: ", uploaded_file_url)

                sql = """
                                     INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
                                         ('%s', %s);
                                 """ % (uploaded_file_url, result[0][0])
                
                print(sql)

                engine.dms(sql)

            return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
        except Exception as e:
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
        cursor.close()
        return resultId[0]
    except:
        errorConexion = 0
        return errorConexion

"""
    Actualiza los datos del usuario logueado.

    @param request: JSON con los datos del usuario provenientes del formulario.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion.
        
        Success: La ejecución fue exitosa.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST.
"""
@csrf_exempt
def updateUser(request):
    if request.method == 'POST':
        primer_nombre, apellido = request.POST.get('primer_nombre'), request.POST.get('apellido')
        telefono, direccion, contrasenia = request.POST.get('telefono'), request.POST.get('direccion'), request.POST.get('contrasenia')
        id_usuario = engine.getUserIDByEmail(request.session.get('email'))

        updateUserQuery = """UPDATE USUARIO SET nombre_completo = CONCAT('%s',' ','%s'), telefono = '%s'
                        ,direccion ='%s', contrasenia = '%s' WHERE id_usuario = %s;""" % (primer_nombre, apellido, telefono, direccion, contrasenia, id_usuario)
        
        try:
            engine.dms(updateUserQuery)
            return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Almacena un artículo dentro de la lista de deseo del usuario logueado.

    @param request: JSON con el id del artículo a insertar.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion:
        
        Success: La ejecución fue exitosa y agrego a la lista de favoritos.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        favoritoRepetido: El usuario ya cuenta con ese artículo en la lista de favoritos
        requestError: No se recibió una petición POST.
"""
@csrf_exempt
def addWishList(request, url=''):
    #if request.method == 'POST':
        id_articulo = request.POST.get('id_articulo')
        #id_articulo = int( url.split('-')[0] )
        id_usuario = engine.getUserIDByEmail(request.session.get('email'))

        addWishQuery = """INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES
                        (%s,%s);""" % (id_usuario, id_articulo)

        verificarFavoritoQuery = """SELECT COUNT(*) FROM FAVORITO WHERE fk_usuario = %s AND fk_articulo = %s;""" %(id_usuario, id_articulo)

        try:
            result = engine.transaction(verificarFavoritoQuery)

            if result[0][0] == 0:
                engine.dms(addWishQuery)
                return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
            else:
                return HttpResponse(json.dumps({'status':'favoritoRepetido', 'message':'El usuario ya cuenta con ese artículo en la lista de favoritos'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    #else:
        #return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Elimina el artículo de la lista de deseo del usuario logueado.

    @param request: JSON con el id del artículo
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion:
        
        Success: La ejecución fue exitosa y se eliminó de la lista de artículos.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        requestError: No se recibió una petición POST.
"""
@csrf_exempt
def deleteFromWishList(request):
    if request.method == 'POST':
        id_articulo = request.POST.get('id_articulo')
        id_usuario = engine.getUserIDByEmail(request.session.get('email'))

        deleteQuery = "DELETE FROM FAVORITO WHERE fk_usuario = %s and fk_articulo = %s;" % (id_usuario,id_articulo)

        try:
            engine.dms(deleteQuery)
            return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")
        
"""
    Muestra la lista de deseo del usuario logueado.

    @param request: No se espera recibir nada, el id del usuario se obtiene de la sesión.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion y dentro del JSON
                          se retorna una lista de tuplas con la informacion de los artículos:
        
        Success: La ejecución fue exitosa y envia la lista de artículos.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        Empty: El usuario no tiene artículos en su lista de favoritos.
        requestError: No se recibió una petición POST.
"""
def showWishList(request):
    if request.method == 'POST':
        id_usuario = engine.getUserIDByEmail(request.session.get('email'))
        listRaitings = []
        listaReviews = []

        wishlistQuery = """SELECT FAVORITO.fk_articulo, ARTICULO.nombre, CONCAT(SUBSTRING(descripcion,1,35),'...'), CAST(FORMAT(precio, 2) AS CHAR), 
                        IMAGEN.enlace_imagen, CAST(ARTICULO.fecha_publicacion AS CHAR), ARTICULO.fk_usuario
                        FROM FAVORITO INNER JOIN ARTICULO ON
                        FAVORITO.fk_articulo = ARTICULO.id_articulo
                        INNER JOIN IMAGEN ON ARTICULO.id_articulo = IMAGEN.fk_articulo
                        WHERE FAVORITO.fk_usuario = %s AND ARTICULO.publicado = 1 AND IMAGEN.id_imagen IN 
                        (SELECT min(id_imagen) FROM IMAGEN group by fk_articulo)
                        ORDER BY FAVORITO.id_favorito ASC;""" % (id_usuario)
        
        try:
            result = engine.transaction(wishlistQuery)
            if result != []:
                for i in range(len(result)):
                    userReviews = """SELECT COUNT(*) FROM CALIFICACION WHERE fk_usuarioCalificado = %s;""" %(result[i][6])
                    raiting = engine.raiting(result[i][6])
                    listRaitings.append(raiting)
                    reviews = engine.transaction(userReviews)
                    listaReviews.append(reviews)
                    #raintingQuery = """SELECT CAST(AVG(calificacion) AS CHAR) FROM CALIFICACION WHERE fk_usuarioCalificado = %s;""" % (result[i][6])
                    #raiting = engine.transaction(raintingQuery)
                    #if raiting 
                    #result[i].append(engine.transaction(raintingQuery)[0][0])
                    #listRaitings.append(engine.transaction(raintingQuery)[0][0])
                result2 = result + listRaitings
                return HttpResponse(json.dumps({'status':'Success', 'data':result2, 'data2':listaReviews}),content_type="application/json")
            else:
                return HttpResponse(json.dumps({'status':'Empty', 'message':'El usuario no tiene artículos en su lista de favoritos'}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")

"""
    Devuelve todas las categorias de la tabla CATEGORIA.
    No recibe ningún parámetro
"""
@csrf_exempt
def getCategories(request):

        try:
            categories = engine.categories()
            return HttpResponse(json.dumps({'status':'Success', 'data':categories}),content_type="application/json")
        except Exception as e:
            return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")



"""
    Recibe la petición para realizar una denuncia.

    @param request: Se espera recibir el id del usuario que está siendo denunciado.
    @return HttpResponse: Devuelve una respuesta Http con un JSON que contiene el estado de la peticion:
        
        Success: La ejecución fue exitosa y envia la lista de artículos.
        dbError: Ha ocurrido un error al intentar conectarse a la base de datos.
        alreadyReported: El usuario ya ha denunciado al vendedor.
        requestError: No se recibió una petición POST.
"""
@csrf_exempt
def reportSeller(request, url=''):

    if request.method == 'POST':

        id_seller = int(request.POST.get('idSeller'))
        motivo = request.POST.get('reasons')
        comment = request.POST.get('comment')
        

        id_user = engine.getUserIDByEmail(request.session.get('email'))
        #print(id_seller)
        print(id_user!=id_seller)
        if id_user != id_seller:
            checkReportQuery = """
                                    SELECT 
                                        COUNT(*) 
                                    FROM 
                                        DENUNCIA 
                                    WHERE 
                                        fk_usuarioDenunciador = %s 
                                        AND 
                                        fk_usuarioDenunciado = %s;
                                """ %(id_user, id_seller)

            reportQuery = """
                                INSERT INTO DENUNCIA (fk_usuarioDenunciador, fk_usuarioDenunciado, motivo) VALUES 
                                    (%s, %s, %s)
                                ;
                            """ % (id_user, id_seller, motivo)

            commentQuery = """
                                INSERT INTO COMENTARIO (fk_usuarioComentador, fk_dirigidoA, comentario, tipo) VALUES
                                    (%s, %s, '%s', 3)
                                ;
                            """ % (id_user, id_seller, comment)

            nameSellerQuery = "SELECT nombre_completo FROM USUARIO WHERE id_usuario = %s"%(id_seller)

            try:
                result = engine.transaction(checkReportQuery)

                nameSeller = engine.transaction(nameSellerQuery)[0][0]

                if result[0][0] == 0:

                    engine.dms(reportQuery)
                    engine.dms(commentQuery)

                    return HttpResponse(json.dumps({'status':'Success'}),content_type="application/json")

                elif result[0][0] != 0:
                    return HttpResponse(json.dumps({'status':'alreadyReported', 'message':'Ya ha denunciado a <strong>{}.</strong>'.format(nameSeller) }),content_type="application/json")

            except Exception as e:
                return HttpResponse(json.dumps({'status':'dbError', 'errorType':type(e), 'errorMessage':type(e).__name__}),content_type="application/json")
        else: 
            return HttpResponse(json.dumps({'status':'errorReported', 'message':'No puede realizar una denucia a sí mismo.'}),content_type="application/json")
    else:
        return HttpResponse(json.dumps({'status':'requestError', 'errorMessage':("Expected method POST, %s method received" % request.method)}),content_type="application/json")
