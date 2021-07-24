"""
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
"""

import json 


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


"""
    Limpia la data devuelta de la base de datos.

    @param data: Es el resultado directo de una consulta a la base de datos. Un arreglo de tuplas.
"""
def processDataTransaction(data):

    newData = list(data[0])    
    image = eval( newData.pop() )  #Se espera que el último campo de la tupla sea una lista de diccionarios que contiene URL de las imágenes.
    newData.append(newJSON( image ))

    return [ tuple(newData) ]


"""
    Toma una lista de diccionarios y devuelve un único diccionario.
"""
def newJSON(data):

  if data: 

    newDictionary = {}
    i = 0

    for jso in data: 
      
      for key, value in jso.items():
        newDictionary[i] = value

      i+=1

    return json.dumps(newDictionary)

  else: 
    return json.dumps({})