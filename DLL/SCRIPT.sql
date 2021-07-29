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
    nombre VARCHAR(100) NOT NULL,
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
("Atlántida"),
("Choluteca"),
("Colón"),
("Comayagua"),
("Copán"),
("Cortes"),
("EL Paraíso"),
("Francisco Morazán"),
("Gracias a Dios"),
("Intibuca"),
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

INSERT INTO ARTICULO (nombre, precio, descripcion, publicado, fecha_publicacion, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria,fk_usuario) VALUES
    ("Laptop Dell Inspiron 15",19995,"Laptop Dell Inspiron 15 con rendimiento capaz de responder en un diseño elegante con bordes angostos de dos lados, SSD PCIe opcionales, ExpressCharge y un procesador móvil AMD Ryzen™ 7 3700U.",0, NOW(), 1,1,4,7,1),
    ("Laptop HP 15 Intel Core i7 Memoria RAM 12GB/256 SSD",26995,"Diseñada para tu productividad y entretenimiento desde cualquier lugar, la nueva HP Laptop 15 combina el poder de Intel y batería de larga duración en un diseño delgado y portable con pantalla de micro borde.",0,NOW(),1,1,1,7,2),
    ("Dell Inspiron 14 Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 256GB Gris 2- en- 1",25995,"Entreténgase en cualquier lugar con la nueva Inspiron 14 5000 2 en 1, que cuenta con cuatro modos de visualización flexibles y una pantalla expansiva en un tamaño elegante y compacto",0,NOW(),18,41,6,7,3),
    ("Laptop Apple MacBook Pro Touch Bar y Touch ID 13 Intel Core i5 Memoria RAM 16GB/ SSD 512 GB Gris",63995,"MacBook Pro presenta MWP72E/A con un procesador Intel de cuatro núcleos para un rendimiento hasta un 90 por ciento más rápido. Una pantalla Retina brillante y colorida con tecnología True Tone para una experiencia de visualización más cómoda.",1,STR_TO_DATE('2021-09-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,1,4,7,1),
    ("Laptop HP 14 Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 256GB Gris",18994.99,"Diseño delgado y ultra portable para mantenerte conectado y con todas las tareas bajo control. Con batería duradera y pantalla de borde delgado la HP Laptop 14-CF2074LA es tu compañera perfecta.",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,1,4,7,1),
    ("Laptop Dell Inspiron 14 Intel Core i7 Memoria RAM 8GB/ Disco Duro SSD 512GB Gis 2- en- 1",34995,"Mantenga su productividad mientras está en la oficina, mientras viaja o en casa con esta computadora portátil DELL-INSPIRON14-5406(I7). La computadora portátil se convierte fácilmente de una computadora a una tableta, para que pueda navegar por las funciones, navegar por la Web y escribir correos electrónicos en la pantalla táctil Full HD de 14",1,STR_TO_DATE('2021-07-22 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,2),
    ("Laptop Apple MacBook Air 13 Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 512GB Gris Espacial",49595,"La última MacBook Air cuenta con una impresionante pantalla Retina con tecnología True Tone, Touch ID, un Magic Keyboard retroiluminado y un trackpad Force Touch, todo alojado en un diseño icónico de cuña delgada y liviana hecha de aluminio 100% reciclado",1,STR_TO_DATE('2021-05-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,7,7,6),
    ("Laptop HP Pavilion 14 Intel Celeron Memoria RAM 4GB/ Disco Duro 1 TB Negra",10795.0,"Creada con un diseño delgado y moderno para mantenerte conectado y con todas las tareas bajo control, con rendimiento confiable y batería duradera.",1,STR_TO_DATE('2005-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,5),
    ("Laptop Dell Inspiron 15 Intel Core i7 Memoria RAM 8GB/ SSD 512 Gris",30995.0,"Laptop de 15 que es su centro de entretenimiento en el hogar personal para una visualización envolvente, con un borde angosto y procesador Intel Core i7 1065-G7 10a. Gen (4 núcleos 6MB, 3.90MHz)",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,6),
    ("Dell G3 15 Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 256GB Negra",28595.0,"Laptop para juegos de 15 pulgadas diseñada con tecnología dinámica Game Shift, gráficos discretos NVIDIA® GeForce® y procesador Intel Core i5.",1,STR_TO_DATE('2007-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),2,41,1,7,5),
    ("Laptop Dell Alienware A51 17 Intel Core i7 Memoria RAM 16GB/ Disco Duro SSD 512GB + 1TB HDD Negra",99995.0,"Este portátil DELL-ALIENWARE17(I7)-4  de 17,3 combina un rendimiento potente y gráficos increíbles en un nuevo diseño revolucionario, perfecto para juegos inmersivos.",1,STR_TO_DATE('2021-08-14 10:53:00', '%Y-%c-%d %H:%i:%s'),1,2,1,7,7)
;

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
("/media/adf04439d82d90994491476ad6976ade-500x500.jpg",1),
("/media/50e2c7493bd701a9c12ab9acf85f0308-500x500.jpg",1),
("/media/111eba6f030f4e51b9696acd88863caf-500x500.jpg",1),
("/media/173b0af594ed6677d58b16088e303ae3-500x500.jpg",1),
("/media/5867faf05499a139e59ce553c84bff8b-500x500.jpg",2),
("/media/2d21f77517e31cda670f7743d704b275-500x500.jpg",2),
("/media/6e7e62e61d33923c04e8b94a11f27d32-500x500.jpg",2),
("/media/f6a2a1410c4fd0433a41602721a23fb1-500x500.jpg",3),
("/media/e07ba8e755959be89ca9d740a7de2144-500x500.jpg",3),
("/media/2fd42aeb331e226c585df3b283c01b3b-500x500.jpg",3),
("/media/9f7e5e5bce40c64811ebd5325b67a7dc-500x500.jpg",3),
("/media/b93dea84333fb1ccb7c863578e99970d-500x500.jpg",3),
("/media/d7152e297657fb4dd324bc59bac140d0-500x500.jpg",3),
("/media/657655c7c6fbc06b20f6568eba85a056-500x500.jpg",4),
("/media/5348d45af1462b29410eee7e10c279a1-500x500.jpg",4),
("/media/119277dba44916d959daab691c24849c-500x500.jpg",4),
("/media/9bdea20f545aea9dee76cb1629807886-500x500.jpg",4),
("/media/27368f7cb000719ffe1173ffb6cd4daf-500x500.png",5),
("/media/a46870b7112d1d8f03ae8d5b20e46702-500x500.png",5),
("/media/05841f294912ee3bbc65975f007f981c-500x500.png",5),
("/media/e954083fabcf3ada2f86ba9b8bb7f8e5-500x500.png",5),
("/media/029f41ff76836bcdfc5f20d84503e729-500x500.png",5),
("/media/f46dea4440c7cfb65c285c1038d5fa98-500x500.png",5),
("/media/dbc337f2813ea8979f0ac0e0db386762-500x500.jpg",6),
("/media/978d3deb06639e7e07c8249c3c4a0961-500x500.jpg",6),
("/media/16055df6822163fb75e301fc32117311-500x500.jpg",6),
("/media/d0a5fa01cfade52c9495e890c07c9ad3-500x500.jpg",6),
("/media/b53f9095a8b761892f199f299fc0e313-500x500.jpg",6),
("/media/7889f47dd0f9358cf6fd8320a100a5e4-500x500.jpg",6),
("/media/680ec71b40649288031c15d16b893a4d-500x500.jpg",6),
("/media/d6afd3779bb32a3892584ec5412c94ad-500x500.jpg",7),
("/media/aea269f9236908236ba8cfd6464cdbe2-500x500.jpg",7),
("/media/e0a261dad72904d84406d25059855643-500x500.jpg",7),
("/media/4dd4dd3511f63f984d30b9e9c436e682-500x500.jpg",7),
("/media/04ecc9a8cd8a6247bf8160645c0ba781-500x500.jpg",7),
("/media/bb7bf28ecc9222a9e72abb828e196e13-500x500.jpg",7),
("/media/c2763c61e780c29be2e6d88b7264a093-500x500.jpg",8),
("/media/35cf5afacb78f524252d30aa3ef63bba-500x500.jpg",8),
("/media/b1996ebf9cbde69184a41df5e038d041-500x500.jpg",8),
("/media/f61fc93279aa1b914cd68f6113667443-500x500.jpg",8),
("/media/c5b30a431af1a5af5255d2ebfda7ba45-500x500.jpg",9),
("/media/ff69963300b720954797b1ae50da56ce-500x500.jpg",9),
("/media/d26afd2e86fcdca683f6778d84317de4-500x500.jpg",9),
("/media/6a70c3f072b9fd946afbe83619c0004b-500x500.jpg",9),
("/media/703111ed5cef87fb255faa91e99be9d1-500x500.jpg",9),
("/media/d750029d870b87fe9f6c5bf5551c0acc-500x500.jpg",9),
("/media/09bb9111302159151bb6015cc22bc905-500x500.jpg",9),
("/media/01ea8389fabcf673f9ab64c22e1c32e1-500x500.jpg",9),
("/media/dc2a1156d7bdf40561658f642328f30a-500x500.jpg",10),
("/media/5fff0f746017b4816439d5eff646430e-500x500.jpg",10),
("/media/e1ef5736d3e35f5aa5e0191a273a8862-500x500.jpg",10),
("/media/e67ea5c1258a1d85b971268d6958a0e2-500x500.jpg",10),
("/media/c0fa45b395b114ce486982c802cb0b17-500x500.jpg",10),
("/media/288e0303b42ab9e2375ca8576a7732c3-500x500.jpg",10),
("/media/00f60a0cf9fa6f25245dfc89eb517ff7-500x500.jpg",10),
("/media/e0fb3472d1b4a862811d98f04f2dd18c-500x500.jpg",10),
("/media/445d305fe4978baa536791b1498053f3-500x500.jpg",10),
("/media/052542da6dae2064a363fd0454ff4491-500x500.jpg",10),
("/media/c61d82bb5ef9c9aa45f91c5c6dd60df6-500x500.jpg",11),
("/media/bcd93e93fd88a1f22124cdb03ebd4adc-500x500.jpg",11),
("/media/80fad68eb9fd9c4731b2da407551a873-500x500.jpg",11),
("/media/daa1c42dc536b7c3d13c42b8eabb7190-500x500.jpg",11),
("/media/2bf26964e012cd577ad69208509da8ce-500x500.jpg",11),
("/media/c1b01841aa2c61e4db123961b0a9309c-500x500.jpg",11),
("/media/b416749ca6bf9c8e3096bda89d0c926a-500x500.jpg",11)
;