/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date 07/23/2021
*/


USE IS_802_PROJECT_DATABASE;

-- Se establece a 1 la variable para permitir que las funciones modifiquen las tablas
SET GLOBAL log_bin_trust_function_creators = 1;

-- Se eliminan las funciones
DROP FUNCTION IF EXISTS fn_getImage;


-- CONCAT('url', i.fk_articulo), 

-- Se cambia el delimitador
DELIMITER $$
    -- Obtiene el nombre de un usuario por medio de su identificador
    CREATE FUNCTION fn_getImage(id_articulo INT(11)) RETURNS JSON
    BEGIN 
        RETURN (
                    SELECT
                        JSON_ARRAYAGG(
                            JSON_OBJECT(
                                        'url', 
                                        enlace_imagen)
                                    ) 
                    FROM 
                        IMAGEN AS i 
                    WHERE
                        i.fk_articulo = id_articulo
                )
            ;
    END $$
    
-- Se cambia el delimitador
DELIMITER ;