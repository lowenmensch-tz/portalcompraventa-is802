

import pages.conexion as conexion


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