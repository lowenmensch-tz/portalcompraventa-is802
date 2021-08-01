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
DROP FUNCTION IF EXISTS fn_convertMiliToHours;
DROP FUNCTION IF EXISTS fn_getTimeElapsed;

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


DELIMITER $$ 

    CREATE FUNCTION fn_convertMiliToHours(fecha_creacion DATETIME) RETURNS INT
    BEGIN 
        RETURN ( 
                SELECT (
                        FLOOR (
                                (NOW() - fecha_creacion)/(3.6*POW(10,6))
                            )
                    )
                ) 
            ;  

    END $$

DELIMITER ;


DELIMITER $$
    CREATE FUNCTION fn_getTimeElapsed(fecha_creacion DATETIME) RETURNS VARCHAR(10)  
    BEGIN
        RETURN (
                SELECT
                    CASE
                        WHEN fn_convertMiliToHours(fecha_creacion) < 24 THEN CONCAT(fn_convertMiliToHours(fecha_creacion), ' hrs ago')
                        WHEN fn_convertMiliToHours(fecha_creacion) BETWEEN 24 AND 168 THEN CONCAT(fn_convertMiliToHours(fecha_creacion)/24, ' days')
                        WHEN fn_convertMiliToHours(fecha_creacion) BETWEEN 168 AND 720 THEN CONCAT(fn_convertMiliToHours(fecha_creacion)/168, ' weeks')
                        WHEN fn_convertMiliToHours(fecha_creacion) BETWEEN 720 AND 8760 THEN CONCAT(fn_convertMiliToHours(fecha_creacion)/720, ' months')
                        WHEN fn_convertMiliToHours(fecha_creacion) > 8760 THEN CONCAT(fn_convertMiliToHours(fecha_creacion)/8760, ' years')
                    END
                )
            ;

    END $$

DELIMITER ;