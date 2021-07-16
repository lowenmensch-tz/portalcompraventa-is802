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

/*Creacion de la tabla de municipios.*/
CREATE TABLE DIRECCION(
	id_direccion INT NOT NULL AUTO_INCREMENT UNIQUE,
    fk_departamento INT NOT NULL,
    fk_municipio INT,
    PRIMARY KEY (id_direccion)
);

/*Creacion de la tabla de artículos.*/
CREATE TABLE ARTICULO(
	id_articulo INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    precio DECIMAL(13,4) NOT NULL,
    descripcion VARCHAR(250),
    publicado BOOL NOT NULL,
    fecha_publicacion DATETIME NOT NULL DEFAULT NOW(),
    fk_direccion INT NOT NULL,
    cantidad_disponible INT DEFAULT 1,
    fk_categoria INT NOT NULL,
    fk_usuario INT NOT NULL,
    PRIMARY KEY (id_articulo)
);

/*Creacion de la tabla de imágenes.*/
CREATE TABLE IMAGEN(
	id_imagen INT NOT NULL AUTO_INCREMENT UNIQUE,
    enlace_imagen VARCHAR(100) NOT NULL,
    fk_articulo INT NOT NULL,
    PRIMARY KEY (id_imagen)
);

/*Creacion de la tabla de categorias.*/
CREATE TABLE CATEGORIA(
	id_categoria INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(35) NOT NULL,
    PRIMARY KEY (id_categoria)
);

/*Creacion de la tabla de usuarios.*/
CREATE TABLE USUARIO(
	id_usuario INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre_completo VARCHAR(30) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100) NOT NULL,
    estado BOOL DEFAULT 0,
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
    comentario VARCHAR(300) NOT NULL,
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

/*Creacion, por aparte, de las llaves foráneas, relaciones entre las tablas e indices.*/
ALTER TABLE COMENTARIO ADD FOREIGN KEY (fk_dirigidoA) REFERENCES USUARIO (id_usuario);
ALTER TABLE COMENTARIO ADD FOREIGN KEY (fk_dirigidoA) REFERENCES ARTICULO (id_articulo);
ALTER TABLE COMENTARIO ADD FOREIGN KEY (fk_dirigidoA) REFERENCES DENUNCIA (id_denuncia);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_categoria) REFERENCES CATEGORIA (id_categoria);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_usuario) REFERENCES USUARIO (id_usuario);
ALTER TABLE ARTICULO ADD FOREIGN KEY (fk_direccion) REFERENCES DIRECCION (id_direccion);
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
ALTER TABLE DIRECCION ADD FOREIGN KEY (fk_departamento) REFERENCES DEPARTAMENTO (id_departamento);
ALTER TABLE DIRECCION ADD FOREIGN KEY (fk_municipio) REFERENCES MUNICIPIO (id_municipio);
ALTER TABLE USUARIO ADD INDEX in_contra (contrasenia);
CREATE UNIQUE INDEX in_correo ON USUARIO(correo);
/*
	Introducción de datos que no van a cambiar como ser los departamentos y municipios de 
    Francisco Morazán y Cortés, ademas de la tabla dirección. Cada articulo solo puede
    pertenecer a una dirección que este dentro de la tabla dirección.
*/

INSERT INTO DEPARTAMENTO (nombre) VALUES
("Francisco Morazán"),
("Atlántida"),
("Choluteca"),
("Colón"),
("Comayagua"),
("Copán"),
("Cortés"),
("EL Paraíso"),
("Gracias a Dios"),
("Intibúca"),
("Islas de la Bahía"),
("La Paz"),
("Lempira"),
("Ocotepeque"),
("Olancho"),
("Santa Bárbara"),
("Valle"),
("Yoro");

INSERT INTO MUNICIPIO (nombre) VALUES
("Distrito Central"),
("Alubarén"),
("Cantarranas"),
("Cedros"),
("Curarén"),
("El Porvenir"),
("Guaimaca"),
("La Libertad"),
("La Venta"),
("Lepaterique"),
("Maraita"),
("Marale"),
("Nueva Armenia"),
("Ojojona"),
("Orica"),
("Reitoca"),
("Sabanagrande"),
("San Antonio de Oriente"),
("San Buenaventura"),
("San Ignacio"),
("San Miguelito"),
("Santa Ana"),
("Santa Lucía"),
("Talanga"),
("Tatumbla"),
("Valle de Ángeles"),
("Vallecillo"),
("Villa de San Francisco"),
("San Pedro Sula"),
("Choloma"),
("La Lima"),
("Omoa"),
("Pimienta"),
("Potrerillos"),
("Puerto Cortés"),
("San Antonio de Cortés"),
("San Francisco de Yojoa"),
("San Manuel"),
("Santa Cruz de Yojoa"),
("Villanueva");

INSERT INTO DIRECCION (fk_departamento, fk_municipio) VALUES
(1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8), (1,9),
(1,10), (1,11), (1,12), (1,13), (1,14), (1,15), (1,16), (1,17),
(1,18), (1,19), (1,20), (1,21), (1,22), (1,23), (1,24), (1,25),
(1,26), (1,27), (1,28), (2,NULL), (3,NULL), (4,NULL), (5,NULL),
(6,NULL), (7,29), (7,30), (7,31), (7,32), (7,33), (7,34), (7,35), 
(7,36), (7,37), (7,38), (7,39), (7,40), (8,NULL), (9,NULL), (10,NULL),
(11,NULL), (12,NULL), (13,NULL), (14,NULL), (15,NULL), (16,NULL),
(17,NULL), (18,NULL);

/*
	Introduccion de datos de prueba.
	Por defecto se dejan como comentario, por si no es necesario su uso para hacer evaluaciones.
*/

/*
INSERT INTO CATEGORIA (nombre) VALUES
("Belleza"),
("Tecnología"),
("Hogar");

INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado, contrasenia) VALUES
("Josue Padilla","josuepadilla_13@outlook.com","+504 9687-7077","Colonia Víctor F. Ardon",1,"Josue"),
("Yefri Ramos","yefriyefriyefri@yefri.com","+504 2222-2222","CA-5 KM 86",1,"Yefri"),
("Juan Orlando","quebonitoesrobar@joh.com","+504 0666-6969","Casa presidencial",1,"Juan");

INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_direccion,cantidad_disponible,fk_categoria,fk_usuario) VALUES
("Plancha",100.5,"Plancha para el pelo.",0,NOW(),1,4,1,1),
("Teclado",123.6,"Teclado de computadora.",0,NOW(),1,1,2,2),
("Juego de platos",500.0,"Juego de platos de porcelana.",0,NOW(),18,6,3,3);

INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES
(1,2),
(2,2),
(3,1);

INSERT INTO CALIFICACION (fk_usuarioCalificador,fk_usuarioCalificado,calificacion) VALUES
(1,2,40),
(2,1,30),
(3,1,99);

INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES
(1,2),
(2,1),
(3,1);

INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES
(1,1),
(1,2),
(2,3);

INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES
("https://i.pinimg.com/736x/38/df/d6/38dfd62e9e00f715c574d2bb48e6c511.jpg",1),
("https://img-9gag-fun.9cache.com/photo/aMx66Bx_460s.jpg",2),
("http://images7.memedroid.com/images/UPLOADED616/5a57a2efcef03.jpeg",3);
*/