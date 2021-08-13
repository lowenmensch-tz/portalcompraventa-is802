/*
	--  SCRIPT DE BASE DE DATOS DEL PROYECTO DE INGENIERÍA DE SOFTWARE.  --
    @authors Josue Padilla y Virgilio Caballero.
    @date 30-06-2021.
    @version 1.1
    
*/

/*Si queremos ejecutar todo el script desde el inicio, eliminamos la base de datos siempre que esto sucede.*/
DROP DATABASE IF EXISTS IS_802_PROJECT_DATABASE;

/*Creamos la base de datos, verificando que esta no se repita.*/
CREATE DATABASE IF NOT EXISTS IS_802_PROJECT_DATABASE CHARACTER SET utf8;

/*Seleccionamos la base de datos.*/
USE IS_802_PROJECT_DATABASE;

/*Creacion de la tabla de departamentos.*/
CREATE TABLE DEPARTAMENTO(
	id_departamento INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(35) NOT NULL,
    PRIMARY KEY (id_departamento)
);

/*Creacion de la tabla de municipios.*/
CREATE TABLE MUNICIPIO(
	id_municipio INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(35) NOT NULL,
    PRIMARY KEY (id_municipio)
);


/*Creacion de la tabla de artículos.*/
CREATE TABLE ARTICULO(
	id_articulo INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(13,2) NOT NULL,
    descripcion VARCHAR(1000),
    publicado BOOL NOT NULL,
    fecha_publicacion DATETIME NOT NULL DEFAULT NOW(),
    fk_departamento INT NOT NULL,
    fk_municipio INT NOT NULL,
    cantidad_disponible INT DEFAULT 1,
    fk_categoria INT NOT NULL,
    fk_usuario INT NOT NULL,
    PRIMARY KEY (id_articulo)
);

/*Creacion de la tabla de imágenes.*/
CREATE TABLE IMAGEN(
	id_imagen INT NOT NULL AUTO_INCREMENT UNIQUE,
    enlace_imagen VARCHAR(400) NOT NULL,
    fk_articulo INT NOT NULL,
    PRIMARY KEY (id_imagen)
);

/*Creacion de la tabla de categorias.*/
CREATE TABLE CATEGORIA(
	id_categoria INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(35) NOT NULL,
    estado BIT(1) NOT NULL DEFAULT 1 COMMENT "0 eliminado | 1 disponible",
    PRIMARY KEY (id_categoria)
);

/*Creacion de la tabla de usuarios.*/
CREATE TABLE USUARIO(
	id_usuario INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre_completo VARCHAR(30) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100) NOT NULL,
    estado BOOL DEFAULT 0,
    fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
    tipo BIT(1) NOT NULL DEFAULT 0 COMMENT "0 vendedor/cliente | 1 administrador",
    contrasenia VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_usuario)
);

/*Creacion de la tabla de calificaciones.*/
CREATE TABLE CALIFICACION(
	id_calificacion INT NOT NULL AUTO_INCREMENT UNIQUE,
    calificacion DECIMAL(4,2) DEFAULT 0,
    fk_usuarioCalificador INT NOT NULL,
    fk_usuarioCalificado INT NOT NULL,
    PRIMARY KEY (id_calificacion)
);

/*Creacion de la tabla de denuncias.*/
CREATE TABLE DENUNCIA(
	id_denuncia INT NOT NULL AUTO_INCREMENT UNIQUE,
    fk_usuarioDenunciador INT NOT NULL,
    fk_usuarioDenunciado INT NOT NULL,
    motivo ENUM('Fraude', 'Venta de productos ilegales', 'Publicidad engañosa', 'Otros') NOT NULL,
    estado BIT(1) NOT NULL DEFAULT 0 COMMENT "0 Denuncia sin revisar | 1 Se toma una acción, ",
    
    UNIQUE(fk_usuarioDenunciador, fk_usuarioDenunciado),
    
    PRIMARY KEY (id_denuncia)
); 

/*Creacion de la tabla de suscripciones.*/
CREATE TABLE SUSCRIPCION(
	id_suscripcion INT NOT NULL AUTO_INCREMENT UNIQUE,
    fk_usuario INT NOT NULL,
    fk_categoria INT NOT NULL,
    PRIMARY KEY (id_suscripcion)
);

/*Creacion de la tabla de comentarios.*/
CREATE TABLE COMENTARIO(
	id_comentario INT NOT NULL AUTO_INCREMENT UNIQUE,
    tipo ENUM("Usuario","Articulo","Denuncia"),
    comentario VARCHAR(500) NOT NULL,
    fecha_publicacion DATETIME NOT NULL DEFAULT NOW(),
    fk_usuarioComentador INT NOT NULL,
    fk_dirigidoA INT NOT NULL,
    PRIMARY KEY (id_comentario)
);

/*Creacion de la tabla de favoritos.*/
CREATE TABLE FAVORITO(
	id_favorito INT NOT NULL AUTO_INCREMENT UNIQUE,
    fk_usuario INT NOT NULL,
    fk_articulo INT NOT NULL,
    PRIMARY KEY (id_favorito)
);



CREATE TABLE BITACORA(
    id_bitacora SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL COMMENT "ID del usuario que visualiza el producto",
    id_articulo INT NOT NULL COMMENT "ID del producto",
    fecha_inicial DATETIME NOT NULL COMMENT "Hora en la que el usuario visita la página",
    fecha_final DATETIME NOT NULL COMMENT "Hora en la que el usuario sale de la página"
) COMMENT "Bitácora relacionada al Tiempo de visita de usuario con un producto";

CREATE TABLE TIEMPO_PUBLICADO(
	tipo_publicación VARCHAR(10),
    tiempo_semanas INT
);


/*Creacion, por aparte, de las llaves foráneas, relaciones entre las tablas e indices.*/
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_categoria) REFERENCES CATEGORIA (id_categoria);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_usuario) REFERENCES USUARIO (id_usuario);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_departamento) REFERENCES DEPARTAMENTO (id_departamento);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_municipio) REFERENCES MUNICIPIO (id_municipio);
ALTER TABLE IMAGEN ADD FOREIGN KEY (fk_articulo) REFERENCES ARTICULO (id_articulo);
ALTER TABLE COMENTARIO ADD FOREIGN KEY (fk_usuarioComentador) REFERENCES USUARIO (id_usuario);
ALTER TABLE SUSCRIPCION ADD FOREIGN KEY (fk_usuario) REFERENCES USUARIO (id_usuario);
ALTER TABLE SUSCRIPCION ADD FOREIGN KEY (fk_categoria) REFERENCES CATEGORIA (id_categoria);
ALTER TABLE DENUNCIA ADD FOREIGN KEY (fk_usuarioDenunciador) REFERENCES USUARIO (id_usuario);
ALTER TABLE DENUNCIA ADD FOREIGN KEY (fk_usuarioDenunciado) REFERENCES USUARIO (id_usuario);
ALTER TABLE CALIFICACION ADD FOREIGN KEY (fk_usuarioCalificador) REFERENCES USUARIO (id_usuario);
ALTER TABLE CALIFICACION ADD FOREIGN KEY (fk_usuarioCalificado) REFERENCES USUARIO (id_usuario);
ALTER TABLE FAVORITO ADD FOREIGN KEY (fk_usuario) REFERENCES USUARIO (id_usuario);
ALTER TABLE FAVORITO ADD FOREIGN KEY (fk_articulo) REFERENCES ARTICULO (id_articulo);
ALTER TABLE USUARIO ADD INDEX in_contra (contrasenia);
CREATE INDEX in_correo ON USUARIO(correo);
CREATE INDEX find_log ON BITACORA(id_usuario, id_articulo);