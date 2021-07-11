""" 
Este es un módulo que importa de conexión.py para ejemplificar el uso del mismo mostrando 
los ejemplos de insertar un usuario y vefificar la existencia del usuario dento de la
base de datos IS_802_PROJECT_DATABASE
"""

import conexion

connect = conexion.conectar()
database = connect[0]
cursor = connect[1]

############# Para insertar un usuario #############
sql = "INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES (%s,%s,%s,%s,%s,%s)" #El uso de %s nos permite cambiar esos valores por los de una tupla
usuario = ('Pedro Martinez', 'martinez@gmail.com', '+504 2222-2222', 'CA-5 KM 86', 1, 'como1234')
try:
    cursor.execute(sql, usuario) 
    database.commit() #Confirmamos los cambios en la base de datos
except:
    print("No se pudo registrar correctamente, posiblemente esta utilizando un correo que ya existe")


############# Para validar la existencia de un usuario #############
sql = "SELECT correo FROM USUARIO WHERE correo =%s AND contrasenia =%s"
usuario = ('martinez@gmail.com', 'como123')

try:
    cursor.execute(sql, usuario)
    result = cursor.fetchone() #almacena tupla con resultado. Se utiliza fetchone cuando solo se obtiene un registro y fetchall cuando se obtiene más de un registro

    if result[0] == usuario[0]:
        print('Ha ingresado con éxito')

except Exception as e:
    print(type(e)) #Tipo de error
    print(type(e).__name__) #Mostrar el error en concreto
    print('Correo o contraseña incorrectos')

#Cerramos el cursor cuando ya no se utiliza
cursor.close()




