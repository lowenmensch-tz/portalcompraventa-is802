

--
-- Name: Promedio de precios de productos por departamento
--
SELECT 
    FORMAT(AVG(a.precio), 2) AS Average,
    d.nombre AS Departament, 
    COUNT(a.fk_departamento) AS Cantidad
FROM 
    ARTICULO AS a
INNER JOIN 
    DEPARTAMENTO AS d ON a.fk_departamento = d.id_departamento
GROUP BY
    a.fk_departamento
ORDER BY
    d.nombre
;


--
-- Name: Promedio de precios de productos por categoría
--
SELECT 
    FORMAT(AVG(a.precio), 2) AS Average,
    c.nombre AS Category, 
    COUNT(a.fk_departamento) AS Cantidad
FROM 
    ARTICULO AS a
INNER JOIN 
    CATEGORIA AS c ON a.fk_categoria = c.id_categoria
GROUP BY
    a.fk_categoria
ORDER BY
    c.nombre
;


--
-- Name: Cinco productos más baratos y con mayor visualizaciones
--
SELECT 
    a.nombre AS Product,
    FORMAT(a.precio, 2) AS Price,
    views.views AS Views
FROM 
    ARTICULO AS a
INNER JOIN 
    (
        SELECT
            b.id_articulo AS id,
            COUNT(*) AS views
        FROM 
            BITACORA AS b
        GROUP BY
            b.id_articulo
    ) AS views
ON a.id_articulo = views.id
ORDER BY
    a.precio 
LIMIT 5
;


--
-- Name: Categoría con mayor número de visualizaciones
--
SELECT
    c.nombre AS Name,
    COUNT(b.id_articulo)  AS CountProduct 
FROM
    BITACORA AS b
INNER JOIN 
    ARTICULO AS a ON a.id_articulo = b.id_articulo
INNER JOIN 
    CATEGORIA AS c ON a.fk_categoria = c.id_categoria
GROUP BY
    c.id_categoria
ORDER BY 
    COUNT(b.id_articulo) DESC
LIMIT 1
;


--
-- Name: Top 10 de los mejores vendedores por mes
--

--
-- Name: Top 10 de los mejores vendedores por categoría
--


--
-- Name: Para visualizar la wea de las denuncias
--
SELECT 
    d.id_denuncia AS ID, 
    fn_getNameByID(d.fk_usuarioDenunciado) ReportedUser, 
    IF(d.estado=1, "Revisada", "Sin revisar") AS UserStateComplaint, 
    fn_getNameByID(d.fk_usuarioDenunciador) AS UserMakeReport, 
    CONCAT(SUBSTRING(c.comentario, 1, 20), "...") AS Comment, 
    CAST(c.fecha_publicacion AS CHAR) AS Date, 
    d.motivo AS Reason, 
    (
        SELECT 
            IF(user.estado=1, "Activo", "Inactivo") AS UserState
        FROM 
            USUARIO AS user
        WHERE
            user.id_usuario = d.fk_usuarioDenunciado
    ) AS UserState
FROM 
    COMENTARIO AS c, DENUNCIA AS d 
WHERE 
        c.tipo = 3 
    AND 
        d.fk_usuarioDenunciador = c.fk_usuarioComentador  
    AND 
        d.fk_usuarioDenunciado  = c.fk_dirigidoA  
ORDER BY 
    d.id_denuncia DESC LIMIT 3;

SELECT d.id_denuncia AS ID, fn_getNameByID(d.fk_usuarioDenunciado) ReportedUser, fn_getNameByID(d.fk_usuarioDenunciador) AS UserMakeReport, IF(d.estado=1, "Revisada", "Sin revisar") AS UserStateComplaint, CONCAT(SUBSTRING(c.comentario, 1, 20), "...") AS Comment, CAST(c.fecha_publicacion AS CHAR) AS Date, d.motivo AS Reason, (         SELECT              IF(user.estado=1, "Activo", "Inactivo") AS UserState         FROM              USUARIO AS user         WHERE             user.id_usuario = d.fk_usuarioDenunciado     ) AS UserState FROM      COMENTARIO AS c, DENUNCIA AS d  WHERE c.tipo = 3      AND          d.fk_usuarioDenunciador = c.fk_usuarioComentador       AND          d.fk_usuarioDenunciado  = c.fk_dirigidoA   ORDER BY      d.id_denuncia DESC LIMIT 3; 