"""
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
"""



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