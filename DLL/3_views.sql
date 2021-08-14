/*
    @author  kenneth.cruz@unah.hn
    @version 0.1.0
    @date 08/11/2021
*/


USE IS_802_PROJECT_DATABASE;

--
-- Duración de la visita por categorías 
--

CREATE VIEW vw_categoryReviews AS
    
    SELECT
        CATEGORIA.nombre AS Category,
        CategoryReviews.DurationTime AS DurationTime,
        CategoryReviews.TotalReviews AS TotalReviews
    FROM
        CATEGORIA, (
        SELECT
            ARTICULO.fk_categoria AS id,  
            AVG(
                TIMESTAMPDIFF(
                                SECOND, 
                                BITACORA.fecha_inicial,
                                BITACORA.fecha_final
                            ) 
                ) AS DurationTime, 
            COUNT(*) AS TotalReviews
        FROM 
            ARTICULO, BITACORA
        WHERE 
            ARTICULO.id_articulo = BITACORA.id_articulo
        GROUP BY
            ARTICULO.fk_categoria 
    ) AS CategoryReviews
    WHERE
        CategoryReviews.id = CATEGORIA.id_categoria
    ; 


--
-- Visitas diarias, del último mes
--

CREATE VIEW vw_dailyReviews AS
    SELECT
        fn_getCountReviewsWeek(3) AS monthAgo, 
        fn_getCountReviewsWeek(2) AS weekbeforeLast, 
        fn_getCountReviewsWeek(1) AS lastWeek,
        fn_getCountReviewsWeek(0) AS CurrentWeek
    ;


--
-- Lista de todos los productos con sus visualizaciones
--

CREATE VIEW vw_viewsByProduct AS
    SELECT
        a.fk_categoria AS id_categoria,
        COUNT(b.id_articulo) AS Views,
        b.id_articulo AS id_articulo
    FROM 
        BITACORA AS b, ARTICULO AS a
    WHERE
        b.id_articulo = a.id_articulo
    GROUP BY
        a.fk_categoria, b.id_articulo
;