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

    @param products: Es un arreglo de tuplas de los productos publicados por un usuario.
"""
def processDataProduct(products):
  
    if len(products) == 0: #Ningún producto
        return products

    elif len(products) == 1: #Un producto
        return [processProduct(product=products[0])]

    else: #Más de un producto
        newListProducts = []

        for product in products:
            newListProducts.append( processProduct(product=product) )

        return newListProducts

    
"""
    Toma una tupla de datos y la procesa.

    @param product: Es una tupla de datos de un producto.
"""
def processProduct(product):

    newListProduct = list(product) 

    if newListProduct[-1]:
        urls = eval( newListProduct.pop() )  #Se espera que el último campo de la tupla sea una lista de diccionarios que contiene URL de las imágenes.
        newListProduct.append(parserJSON( urls=urls ))

        return tuple(newListProduct)

    else:
        newListProduct[-1] = parserJSON(urls={})   #Se sustituye el None por un diccionario vacío

        return tuple(newListProduct)


"""
    Toma una lista de diccionarios y devuelve un único diccionario convertido a formato JSON.

    @param urls: Es una lista de diccionarios.
"""
def parserJSON(urls):

    if urls: 

        newDictionary = {}
        i = 0

        for url in urls: 

            for key, value in url.items():
                newDictionary[i] = value

                i+=1

        return json.dumps(newDictionary)

    else: 
        return json.dumps({})