import mysql.connector

#Función con los parametros de la conexión
        
def conectar():
    database = mysql.connector.connect(
        host="localhost",
        user="admin",
        passwd="admin",
        database="IS_802_PROJECT_DATABASE",
        port=3306
    )
    # el parametro buffered=True nos va a permitir hacer varias consultas con el mismo cursor
    cursor = database.cursor(buffered=True)
    #Retornamos un arreglo que contiene la conexión a la base de datos con los parametros definidos anteriormente y el cursor
    return [database, cursor]

