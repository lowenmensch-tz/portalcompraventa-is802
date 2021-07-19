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
    nombre VARCHAR(30) NOT NULL,
    precio DECIMAL(13,4) NOT NULL,
    descripcion VARCHAR(250),
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
("Villanueva"),
("Ninguno"); /* En caso de que no se indique un municipio por defecto el id_municipio debe de asignarse con valor 41 */

INSERT INTO CATEGORIA (nombre) VALUES
("Inmuebles"),
("Vehículos"),
("Hogar"),
("Moda"),
("Futuros Padres"),
("Mascotas"),
("Electrónica"),
("Servicios"),
("Negocios"),
("Empleo");

/*
	Introduccion de datos de prueba.
	Por defecto se dejan como comentario, por si no es necesario su uso para hacer evaluaciones.
*/

/*
INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado, contrasenia) VALUES
("Josue Padilla","josuepadilla_13@outlook.com","+504 9687-7077","Colonia Víctor F. Ardon",1,"Josue"),
("Yefri Ramos","yefriyefriyefri@yefri.com","+504 2222-2222","CA-5 KM 86",1,"Yefri"),
("Juan Orlando","quebonitoesrobar@joh.com","+504 0666-6969","Casa presidencial",1,"Juan"),
("Daniel Caceres","daniel@daniel.com","+504 2222-4477","Col. Kennedy",1,"daniel"),
("Marta Nielsen","marta@marta.com","+504 2225-4474","Winden",1,"marta"),
("Anatoly Dyatlov","Anatoly@anatoly.com","+504 2569-4477","Col. 21 de Octubre",1,"anatoly"),
("Francisco Maradiaga","francisco@francisco.com","+504 2225-4474","Calle policarpo Paz",1,"francisco"),
("Mery Pinoth","mery@mery.com","+504 2225-4474","Col. Los Pinos",1,"mery"),
("Luis Moncada","luis@luis.com","+504 2225-4474","Col. Los Llanos",1,"luis"),
("Martin Mondragos","martin@martin.com","+504 2225-4474","Col. Los estados unidos",1,"martin"),
("Mario Martinez","mario@mario.com","+504 2225-4474","Codradia Cortez",1,"mario"),
("Enriquie Marquez","enrique@enrique.com","+504 2225-4474","Col. La Honduras",1,"Enrique"),
("Anibal Garcia","anibal@anibal.com","+504 2225-4474","Zona 4 las Uvas",1,"anibal");

INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,
fk_municipio, cantidad_disponible,fk_categoria,fk_usuario) VALUES
("Plancha",100.5,"Plancha para el pelo.",0,NOW(),1,1,4,1,1),
("Teclado",123.6,"Teclado de computadora.",0,NOW(),1,1,1,7,2),
("Juego de platos",500.0,"Juego de platos de porcelana.",0,NOW(),18,41,6,3,3),
("Smart TV",8000.00,"Smart TV de 32 pulg. marca Samsung",1,STR_TO_DATE('2021-09-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,1,4,7,1),
("Monitor gamer",7000.00,"Monitor 4K 60FPS marca ASUS",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,1,4,7,1),
("Casa",100000,"Casa de dos plantas y 4 cuartos",1,STR_TO_DATE('2021-07-22 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,1,2),
("Laptop toshiba",8500.00,"Laptop estado 9/10 con procesador i7 4th generacion",1,STR_TO_DATE('2021-05-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,7,7,6),
("Telefono C115",50000,"Telefono C115 de alta resistencia a golpes",1,STR_TO_DATE('2005-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,5),
("Mochila para laptop",650.00,"Mochila para laptop de 15 pulg",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,6),
("Moto Ninja",80000.00,"Moto ninja marca ninja",1,STR_TO_DATE('2007-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,2,5),
("Samsung note 20",18000.00,"Smartphone samsung año 2020",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,2,1,7,7);

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

INSERT INTO COMENTARIO (tipo, comentario, fk_usuarioComentador, fk_dirigidoA) VALUES
("Usuario", "Excelente, es un vendedor responsable", 1, 2);

INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES
("https://i.pinimg.com/736x/38/df/d6/38dfd62e9e00f715c574d2bb48e6c511.jpg",1),
("https://img-9gag-fun.9cache.com/photo/aMx66Bx_460s.jpg",2),
("http://images7.memedroid.com/images/UPLOADED616/5a57a2efcef03.jpeg",3),
("https://media.istockphoto.com/photos/samsung-smart-tv-and-social-media-picture-id483575898",4),
("https://media.istockphoto.com/photos/streaming-live-esport-event-on-computer-at-home-picture-id1190641416",5),
("https://media.istockphoto.com/photos/beautiful-modern-home-with-various-materials-used-on-the-facade-picture-id1263902259",6),
("https://media.istockphoto.com/photos/toshiba-laptop-picture-id458939833",7),
("https://http2.mlstatic.com/D_NQ_NP_783970-MCO43970880790_112020-O.webp",8),
("https://http2.mlstatic.com/D_NQ_NP_2X_850278-MCO43243494755_082020-F.webp",9),
("https://http2.mlstatic.com/D_NQ_NP_2X_640863-MCO43374253675_092020-F.webp",10);
*/