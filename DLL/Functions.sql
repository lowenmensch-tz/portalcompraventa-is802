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
DROP FUNCTION IF EXISTS fn_convertDateTimeToMinutes;
DROP FUNCTION IF EXISTS fn_getTimeElapsed;
DROP FUNCTION IF EXISTS fn_getNameByID;

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

    CREATE FUNCTION fn_convertDateTimeToMinutes(fecha_creacion DATETIME) RETURNS INT
    BEGIN 
        RETURN ( 
                SELECT 
                    TIMESTAMPDIFF(
                                    MINUTE, 
                                    fecha_creacion, 
                                    NOW()
                                )
                ) 
            ;  

    END $$

DELIMITER ;


DELIMITER $$
    CREATE FUNCTION fn_getTimeElapsed(fecha_creacion DATETIME) RETURNS TEXT
    BEGIN
        RETURN (
                SELECT
                    CASE
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) < 60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)), ' min ago')
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) BETWEEN 60 AND 23*60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)/60), ' hrs ago')
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) BETWEEN 24*60 AND 167*60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)/(24*60)), ' days')
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) BETWEEN 168*60 AND 719*60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)/(168*60)), ' weeks')
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) BETWEEN 720*50 AND 8759*60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)/(720*60)), ' months')
                        WHEN fn_convertDateTimeToMinutes(fecha_creacion) > 8760*60 THEN CONCAT(FLOOR(fn_convertDateTimeToMinutes(fecha_creacion)/(8760*60)), ' years')
                    END
                )
            ;

    END $$

DELIMITER ;



DELIMITER $$ 

    CREATE FUNCTION fn_getNameByID(id_usuario INT) RETURNS VARCHAR(30)
    BEGIN 

        RETURN (
                    SELECT
                        u.nombre_completo
                    FROM
                        USUARIO AS u
                    WHERE
                        u.id_usuario = id_usuario
            )
        ;
    END $$

DELIMITER ; 

