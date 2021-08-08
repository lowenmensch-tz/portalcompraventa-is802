
USE IS_802_PROJECT_DATABASE;


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
-- 1-13
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
    ("Anibal Garcia","anibal@anibal.com","+504 2225-4474","Zona 4 las Uvas",1,"anibal")
;
-- 14-64
INSERT INTO USUARIO (nombre_completo, correo, telefono, direccion, contrasenia, estado) VALUES

    ('Dunn Fells', 'dfells0@com.com', '887-778-5877', '935 Veith Park', 'gUKFCcJ', 1),
    ('Sammy Gierhard', 'sgierhard1@printfriendly.com', '855-896-8937', '21 Sauthoff Court', 'eqE1G5', 1),
    ('Carrie Abley', 'cabley2@huffingtonpost.com', '390-498-1024', '283 Pearson Road', 'slUO4Up', 1),
    ('Vincenz Hamblyn', 'vhamblyn3@amazonaws.com', '740-431-3257', '33776 Aberg Lane', 'GcxUpWziwL', 1),
    ('Marigold Mateo', 'mmateo4@army.mil', '683-427-1519', '61797 Clove Hill', 'HyLyrVOH6', 1),
    ('Brittan Shoebottom', 'bshoebottom5@zdnet.com', '291-956-7749', '73275 Summer Ridge Pass', 'vDCUfCg439qc', 1),
    ('Traver Forsey', 'tforsey6@independent.co.uk', '956-656-8417', '7928 Milwaukee Park', 'amsYNIhYN2', 1),
    ('Sidonia Batrop', 'sbatrop7@spotify.com', '271-425-8154', '7 Darwin Street', 'zR1pJsqAB', 1),
    ('Ellie Bradnam', 'ebradnam8@shutterfly.com', '780-170-1926', '41 Bartillon Point', 'PQR9e9', 1),
    ('Flori Craig', 'fcraig9@census.gov', '241-495-8246', '73512 Rowland Plaza', 'qXAYohpMa', 1),
    ('Malachi Domenicone', 'mdomeniconea@flickr.com', '399-587-4242', '251 Buell Trail', 'yTxGQY', 1),
    ('Hendrick Bryceson', 'hbrycesonb@gmpg.org', '590-246-0517', '3551 Hallows Point', '7MC3bf', 1),
    ('Blake Mattinson', 'bmattinsonc@seesaa.net', '652-401-0886', '26 Maywood Place', 'BUjIPcml', 1),
    ('Vincent Andrault', 'vandraultd@indiegogo.com', '854-427-9933', '587 Sachtjen Center', 'oNg48JPSXa', 1),
    ('Evered Davies', 'edaviese@pen.io', '920-971-6896', '05629 Anthes Court', 'HAEBStVly7qv', 1),
    ('Davina Gors', 'dgorsf@samsung.com', '811-648-6150', '45753 Mallard Avenue', '7SNBGd', 1),
    ('Odelia Wilce', 'owilceg@hibu.com', '279-328-1679', '90 Hoard Road', 'FMhvA70e8Nt0', 1),
    ('Noellyn Frany', 'nfranyh@amazon.co.uk', '779-393-3974', '112 Moose Street', 'sFol3G3cAbI', 1),
    ('Davon Clulow', 'dclulowi@cmu.edu', '172-867-6643', '4069 Moland Hill', 'b6ceknHcTp', 1),
    ('Crosby Reek', 'creekj@admin.ch', '586-990-8535', '6424 Nevada Trail', 'Edh614N8vQ4C', 1),
    ('Valina Downton', 'vdowntonk@friendfeed.com', '630-769-1365', '79 Messerschmidt Hill', '1NYgRUlshY0', 1),
    ('Reta Gillie', 'rgilliel@springer.com', '601-446-4796', '5 Stephen Center', 'gmgr8Ef2k', 1),
    ('Frasquito Jerdein', 'fjerdeinm@mozilla.com', '894-789-4393', '15 Becker Parkway', '3QFCJ3d3YiAi', 1),
    ('Karleen Merrgan', 'kmerrgann@google.com.au', '372-183-4317', '185 Burrows Place', '5KjSkDQOXJ', 1),
    ('Brook Helleckas', 'bhelleckaso@ameblo.jp', '847-616-5675', '2141 Acker Center', '6oC1PZ', 1),
    ('Granthem Duval', 'gduvalp@nytimes.com', '843-311-6624', '3919 Susan Trail', 'NrD6Ep2', 1),
    ('Dominick Wenn', 'dwennq@loc.gov', '457-393-3675', '98 Mccormick Hill', 'wqHVFqbx', 1),
    ('Gordie Adamthwaite', 'gadamthwaiter@businessinsider.com', '444-153-1462', '0420 Glendale Trail', 'ykAjlbHxUh', 1),
    ('Wylie Withull', 'wwithulls@princeton.edu', '890-392-0219', '57273 Ridgeway Circle', 'Wy9dNjFMs', 1),
    ('Delano Bretland', 'dbretlandt@imageshack.us', '584-896-8192', '346 Jay Drive', 'GlWOntUB7', 1),
    ('Francyne Bergin', 'fberginu@mac.com', '289-600-0564', '6648 Eggendart Pass', 'roReHHhq4Vcd', 1),
    ('Cherry Bourgour', 'cbourgourv@yellowbook.com', '802-115-8807', '178 Morning Hill', 'PyQKyZiclKX', 1),
    ('Vivyanne Clarkson', 'vclarksonw@omniture.com', '492-170-3696', '543 Kropf Avenue', '6AXYhzgG', 1),
    ('Suzie Urch', 'surchx@hugedomains.com', '575-292-9043', '41515 Manley Center', 'QlBOKT2tLUgY', 1),
    ('Valma Patrie', 'vpatriey@nyu.edu', '729-613-8273', '04445 3rd Road', 'fpY0HDLXq', 1),
    ('Yule Jilliss', 'yjillissz@ed.gov', '719-898-1440', '443 Northport Place', '4goDb9B9', 1),
    ('Rhea Ren', 'rren10@bbc.co.uk', '588-504-3376', '24902 Huxley Parkway', 'N0txjaL', 1),
    ('Harmon MacRonald', 'hmacronald11@moonfruit.com', '112-663-4104', '92336 Reinke Center', 'zbxr5ldwX6QB', 1),
    ('Gay Offell', 'goffell12@house.gov', '216-268-2120', '1528 Basil Road', 'mTRXEa0Z', 1),
    ('Bridgette Tomankiewicz', 'btomankiewicz13@theguardian.com', '301-308-7997', '817 Scoville Plaza', 'yIsyXQ5mm0', 1),
    ('Sonja Choldcroft', 'scholdcroft14@smugmug.com', '196-386-0061', '177 West Junction', 'potJ8AaSH', 1),
    ('Zelda Cantillon', 'zcantillon15@ycombinator.com', '432-555-4979', '11 Northwestern Way', 'OYZbyvptDuz', 1),
    ('Jonathan Vell', 'jvell16@nydailynews.com', '991-837-8330', '6721 Lunder Drive', 'i6jOE3nd', 1),
    ('Siobhan Cleaton', 'scleaton17@accuweather.com', '680-399-2132', '71055 Cardinal Court', 'hoVYpzbkts', 1),
    ('Britni Owbrick', 'bowbrick18@shinystat.com', '496-988-9287', '24318 Hanover Pass', 'i5z5tLUSV', 1),
    ('Dal Snellman', 'dsnellman19@comcast.net', '516-475-9882', '3261 Elmside Center', 'tbbtUgaNDEn', 1),
    ('Turner Elnor', 'telnor1a@bloomberg.com', '149-561-7573', '07 Haas Terrace', 'Pp1x37', 1),
    ('Korney Brimfield', 'kbrimfield1b@chron.com', '315-474-9590', '69871 Corry Way', 'ENHBHh6K38l6', 1),
    ('Christos Blaxill', 'cblaxill1c@dailymail.co.uk', '740-227-0762', '77 4th Street', '3qj4NoqO', 1),
    ('Stuart Ruzicka', 'sruzicka1d@tmall.com', '569-253-5134', '66686 Kim Place', '07R2IvIDd', 1)
;

-- 1-11
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

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (12, 'Laptop HP Pavilion 14" Intel Celeron Memoria RAM 4GB/ Disco Duro 1 TB Negra', 10795.0, 'Creada con un diseño delgado y moderno para mantenerte conectado y con todas las tareas bajo control, con rendimiento confiable y batería duradera.', 1, 16, 21, 8629, 4, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (13, 'Laptop Dell Inspiron 15" Intel Core i7 Memoria RAM 8GB/ SSD 512 Gris', 30995.0, 'Laptop de 15" que es su centro de entretenimiento en el hogar personal para una visualización envolvente, con un borde angosto y procesador Intel Core i7 1065-G7 10a. Gen (4 núcleos 6MB, 3.90MHz)', 1, 14, 27, 3913, 3, 9);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (14, 'Dell G3 15" Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 256GB Negra', 28595.0, 'Laptop para juegos de 15 pulgadas diseñada con tecnología dinámica Game Shift, gráficos discretos NVIDIA® GeForce® y procesador Intel Core i5.', 1, 6, 10, 3099, 6, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (15, 'Laptop Dell Alienware A51 17" Intel Core i7 Memoria RAM 16GB/ Disco Duro SSD 512GB + 1TB HDD Negra', 99995.0, 'Este portátil DELL-ALIENWARE17(I7)-4  de 17,3 " combina un rendimiento potente y gráficos increíbles en un nuevo diseño revolucionario, perfecto para juegos inmersivos.', 1, 8, 15, 822, 10, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (16, 'Lenovo IdeaPad 15" Intel Core i7 Memoria RAM 8GB/ Disco Duro 512GB Gris', 29995.0, 'La IdeaPad 720 presenta un chasis rediseñado con superficies de metal pulido y bordes suavemente angulados. Tratada con la misma tecnología utilizada para dar forma y alisar los diamantes, el resultado es una portátil elegante y con estilo.', 1, 9, 40, 4713, 9, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (17, 'Laptop Apple MacBook Pro Touch Bar y Touch ID 13" Intel Core i5 Memoria RAM 16GB/ SSD 1 TB Gris Espacial', 71995.0, 'MacBook Pro MWP52E/A presenta un procesador Intel de cuatro núcleos para un rendimiento hasta un 90 por ciento más rápido. Una pantalla Retina brillante y colorida con tecnología True Tone para una experiencia de visualización más cómoda.', 1, 15, 14, 2393, 8, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (18, 'Laptop Dell G5 15" Memoria RAM 16GB/ SSD 512GB Negra', 51995.0, 'Cumple tareas exigentes con esta laptop de gaming Dell G5 15 5500 i7. La pantalla de borde estrecho antirreflejo Full HD de 15,6 pulgadas ofrece una imagen envolvente en condiciones brillantes, mientras que la unidad de estado sólido de 512 GB abre programas rápidamente. ', 1, 18, 19, 7745, 4, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (19, 'Laptop Dell Inspiron 13" Intel Core i7 Memoria RAM 8GB/ Disco Duro SSD 512GB Gris', 36995.0, 'Desde sensores inteligentes hasta diseño portátil, la nueva computadora portátil Inspiron 5000 de 13 pulgadas con procesadores Intel® Core ™ de 11.ª generación es su nuevo dispositivo de referencia.', 1, 5, 39, 8005, 7, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (20, 'Laptop HP Pavilion x360 14" Intel Core i3 Memoria RAM 4GB/ Disco Duro SSD 256 Gris 2- en- 1', 18995.0, 'Inspira al mundo con una laptop convertible que se adapta a ti. Siéntete libre de crear, conectarte y compartir en más formas con la nueva Pavilion x360 14-DH0011LA.<br/>', 1, 3, 26, 1907, 10, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (21, 'Laptop Dell Inspiron 15" Intel Core i3 Memoria RAM 4GB/ Disco Duro 1TB Negra', 16995.0, 'Laptop de 15 pulgadas que ofrece un rendimiento con capacidad de respuesta en un diseño elegante con bordes angostos de dos lados, ExpressCharge, y procesadores Intel Core.', 1, 10, 7, 1155, 5, 11);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (22, 'Laptop HP Pavilion x360 14" Intel Core i5 Memoria RAM 8GB/ SSD 256GB Dorada 2-en-1', 22995.0, 'Laptop HP Pavilion x360 Convertible 14-dh1010la para creadores e influenciadores. Escriban su futuro. Inspira al mundo con una laptop convertible que se adapta a ti. Siéntete libre de crear, conectarte y compartir en más formas con la nueva Pavilion x360.', 1, 7, 6, 9568, 10, 11);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (23, 'Laptop Dell Inspiron 15" Intel Core i5 Memoria RAM 8GB/ Disco Duro SSD 256GB Gris', 21995.0, 'Encienda esta computadora portátil Dell Inspiron 15 3501 para disfrutar de un rendimiento potente mientras recorre su lista de tareas pendientes. La computadora portátil está equipada con un procesador Intel Core i5 y 16 GB de memoria para brindar la velocidad y la potencia necesarias para manejar múltiples programas al mismo tiempo.', 1, 1, 34, 7015, 8, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (24, 'Laptop Dell G7 17" Intel Core i7 Memoria RAM 16GB/ SSD 512GB Negra', 58995.0, 'La nueva Dell G7 DELL-G7-7700-(I7) Laptop para juegos de 7 pulgadas con diseño delgado y elegante, procesadores Intel Core de décima generación, gráficos discretos, tecnología Game Shift y teclado RGB de 4 zonas.<span class="redactor-invisible-space"></span>', 1, 11, 11, 8000, 9, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria,
    fk_usuario) VALUES
    (25, 'Monitor Gaming Dell  23.6"', 4995.0, 'Experimente una transmisión de alta calidad y alta velocidad en este elegante monitor Full HD.', 1, 12, 25, 151, 7, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (26, 'Dell Monitor 27" VGA y HDMI', 6994.99, 'Un monitor de 27 "mejora el flujo de trabajo diario. Cuenta con una base de altura regulable, resolución Full HD y altavoces integrados en un diseño que ahorra espacio.', 1, 16, 20, 5428, 4, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (27, 'Monitor HP 21.5"  FHD 1920 x 1080', 4195.0, 'Obtén la calidad de imagen nítida que anhelas gracias a esta pantalla de microborde ultradelgada que cuenta con un atractivo diseño en aluminio e inmersivos ángulos de visualización muy amplios. Desde la navegación de contenido a la retransmisión de ocio, te permite ver el mundo de una forma totalmente nueva.', 1, 18, 18, 3567, 2, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (28, 'Monitor LG 32" UHD con FreeSync', 12995.0, '32UN500 impulsa la nueva era de la experiencia de juego de la consola 4K HDR, no solo brindando emociones sin precedentes con imagen y sonido decentes, sino que también lo ayuda a ganar más batallas con AMD FreeSync ™, Dynamic Action Sync y Black Stabilizer.<br/>', 1, 1, 2, 405, 1, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (29, 'Monitor HP 27" Ultraslim FHD', 6495.0, 'Obtenga la calidad de imagen nítida que desea con esta pantalla ultradelgada de microbordes, con un llamativo diseño de aluminio y ángulos de visión ultraanchos envolventes. Desde la exploración de contenido hasta la transmisión de entretenimiento, le permite ver su mundo de una manera completamente nueva.', 1, 13, 30, 8926, 7, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria,
    fk_usuario) VALUES
    (30, 'Monitor HP 23.8" FHD 1920 x 1080', 5195.0, 'Obtén la calidad de imagen nítida que anhelas gracias a esta pantalla de microborde ultradelgada que cuenta con un atractivo diseño en aluminio e inmersivos ángulos de visualización muy amplios. Desde la navegación de contenido a la retransmisión de ocio, te permite ver el mundo de una forma totalmente nueva.', 1, 6, 1, 9409, 8, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (31, 'Monitor Dell 21.5" FHD', 4195.0, 'Vea imágenes, videos y archivos claramente en este monitor Full HD de 21,5" con cubiertas delgadas encima de una base compacta y que le ahorra espacio', 1, 4, 10, 2136, 10, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (32, 'Disco Duro Externo Seagate 2 TB Negro', 3595.0, 'Almacene y acceda fácilmente a 2 TB de contenido sobre la marcha, con Seagate Expansion Portable. Diseñado para trabajar con computadoras Windows, este disco duro externo compacto hace que la copia de seguridad sea muy fácil. ¡Solo arrastra y suelta! Para configurarlo, conecte el disco duro portátil a una computadora para el reconocimiento automático (no se requiere software) y disfrute de la simplicidad plug-and-play con el cable USB 3.0 de 18 pulgadas incluido.', 1, 10, 6, 8325, 2, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (33, 'Mouse Inalambrico Targus B580 Negro', 575.0, 'Navegue, señale y haga clic con el mouse B580 Bluetooth®. Tendrá un cable menos en su escritorio y liberará un puerto USB para cargar su teléfono o agregar un periférico. El mouse se desliza fácilmente junto con sus movimientos gracias a su sensor óptico de 1,600 DPI, y sus tres botones permiten hacer clic con el botón izquierdo y derecho que necesita. Este mouse pone la productividad a su alcance sin romper el banco.', 1, 10, 5, 3446, 3, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (34, 'Protector de Corriente Forza 12 salidas/ Blanco', 1395.0, 'La serie de protectores contra sobretensiones Forza Home Theater SP ofrece protección confiable contra sobretensiones y picos para proteger sus electrodomésticos, equipos audiovisuales y dispositivos electrónicos sensibles. La serie SP combina capacidades de ahorro de energía con las mejores clasificaciones de protección contra sobretensiones de su clase. Su configuración de diseño de zócalo única es versátil y conveniente. ', 1, 17, 23, 6701, 6, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (35, 'Mouse Klip Xtreme Óptico Inalámbrico Negro', 395.0, 'Gracias al diseño ambidextro, es posible utilizar el mouse con ambas manos. El receptor ultracompacto del mouse se puede guardar en la práctica ranura en su interior o dejarlo conectado en el puerto USB de la computadora. Liviano y ergonómico, es el mouse ideal para portátil pensado en aquéllos que siempre están en constante movimiento. ', 1, 6, 24, 5224, 8, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (36, 'MOUSE KLIP INALAMBRICO 2.4GHZ ROJO', 395.0, 'El KMW-356 combina perfectamente la libertad de trabajar sin cables con la tecnología inalámbrica de 2.4 GHz. Equipado con un sensor óptico de alta definición, ofrece mayor sensibilidad, un seguimiento uniforme así como el control preciso del cursor. Cuenta con un receptor ultracompacto que se puede guardar convenientemente en la parte inferior del mouse o dejarlo conectado en la computador portátil cuando te encuentras en movimiento. ', 1, 6, 27, 3292, 6, 3);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (37, 'Mouse Klip Xtreme Inalámbrico con 6 Botones Azul', 395.0, 'El KMW-330 combina perfectamente la libertad de trabajar sin cables con la tecnología inalámbrica de 2.4 GHz. Equipado con un sensor óptico de alta definición. Receptor ultracompacto de 2.4 GHz para una conexión fiable hasta 10m de distancia. Compatible con Windows 98/ME/2000/XP/Vista/Win7/Win8/Mac.', 1, 7, 19, 4859, 10, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (38, 'Extensor de Alcance Linksys RE6250/AC750 Wi-Fi de Doble Banda', 2695.0, 'Elimine las zonas sin cobertura inalámbrica y aumente el alcance de su router Wi-Fi o router de cable-módem.<a href="https://www.linksys.com/hn/p/P-RE6250/#product-features"></a>', 1, 7, 21, 3853, 2, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (39, 'Microsoft Office 365', 1705.25, 'Microsoft 365 Personal es un servicio de suscripción creado para ayudarte a sacar el trabajo adelante en todos tus dispositivos mientras te mueves.', 1, 2, 3, 6816, 6, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (40, 'Maxell Mouse Inalámbrico Mowl C Negro', 495.0, 'Compatible con MAC y PC, nano antena de conexión automática de 2.4 GHz., diseño ergonómico, bajo consumo de energía. Cada click de un mouse puede producir hasta 48 decibeles lo cual contribuye con la contaminación sonora de oficina. Con el Silent Click Mouse bajas considerablemente el sonido en ambientes de trabajo o en el hogar.', 1, 1, 30, 2219, 2, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (41, 'Mouse Klip Xtreme Inalámbrico con 6 Botones Negro', 395.0, 'El KMW-330 combina perfectamente la libertad de trabajar sin cables con la tecnología inalámbrica de 2.4 GHz. Equipado con un sensor óptico de alta definición. Receptor ultracompacto de 2.4 GHz para una conexión fiable hasta 10m de distancia. Compatible con Windows 98/ME/2000/XP/Vista/Win7/Win8/Mac.', 1, 7, 9, 3707, 6, 3);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (42, 'Dell Combo de Teclado y Mouse Inalámbrico Negro', 795.0, 'Complementa tus actividades escolares o laborales, con este set de accesorios de la marca Dell. <br/><br/>Se trata de un teclado numérico y mouse de 1,000 GPI, diseñado con tres botones; ambos son compatibles con Windows y iOS, son de color negro y presentan una conexión inalámbrica con conectividad USB.', 1, 12, 21, 4291, 8, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (43, 'Dell Mochila Esencial 15" Negra', 795.0, 'Diseñada con impresiones reflectantes en el panel frontal, la mochila Dell Essential 15 (ES1520P) se destaca en condiciones de poca luz cuando recibe luz directa, lo que lo hace más visible.', 1, 17, 25, 3593, 3, 11);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (44, 'MOUSE KLIP INALAMBRICO 2.4GHZ NEGRO', 395.0, 'El KMW-356 combina perfectamente la libertad de trabajar sin cables con la tecnología inalámbrica de 2.4 GHz. Equipado con un sensor óptico de alta definición, ofrece mayor sensibilidad, un seguimiento uniforme así como el control preciso del cursor. Cuenta con un receptor ultracompacto que se puede guardar convenientemente en la parte inferior del mouse o dejarlo conectado en la computador portátil cuando te encuentras en movimiento. ', 1, 1, 27, 3841, 6, 9);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (45, 'Kaspersky Antivirus para 1 Usuario 1 Año', 795.0, 'Disfruta de un servicio personalizado de seguridad que se adapta a tus hábitos en línea. Sabe cuándo enviarte alertas y advertencias, y cuándo actuar para protegerte de amenazas directas.', 1, 13, 32, 3220, 7, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (46, 'Protector de Corriente Forza 8 Salidas/ Negro', 795.0, 'Ofrece protección superior al redireccionar el exceso de tensión de los equipos conectados durante sobrecargas o subidas de tensión. La tecnología MOV (varistor de óxido de metal) ofrece mayor protección para componentes electrónicos contra sobrecargas y subidas repentinas de tensión<span class="redactor-invisible-space"></span>', 1, 5, 23, 3196, 2, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (47, 'Mouse Inalambrico Targus', 595.0, 'El Targus traza azul ratón inalámbrico cuenta con la última tecnología de rastreo azul para el seguimiento preciso y exacto.', 1, 16, 30, 6018, 1, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (48, 'Dell Mouse Inalámbrico Negro', 695.0, 'El mouse óptico inalámbrico WM126 de Dell le ofrece un rendimiento inalámbrico diario con una excelente duración de la batería.', 1, 17, 34, 9797, 10, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (49, 'Mouse Optico Alambrico Targus Negro', 395.0, 'El Targus USB óptico Laptop Mouse es un ratón de tres botones con un diseño ergonómico para proporcionar comodidad durante su uso. Diseñado tanto para usuarios diestros y zurdos, el ratón cuenta con una rueda de desplazamiento integrada por lo que es fácil de navegar a través de páginas web o extensas hojas de cálculo a un ritmo rápido. ', 1, 17, 22, 3341, 4, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (50, 'Mouse Pad Klip Xtreme', 195.0, 'Mouse Pad de Gel Klip Xtreme', 1, 6, 30, 5170, 10, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (51, 'Disco Duro Externo Seagate 1 TB Negro', 2695.0, 'La unidad de disco duro portátil Expansion Portable de Seagate ofrece una sencilla solución cuando necesita agregar almacenamiento instantáneo a su computadora y llevar archivos con usted.', 1, 1, 21, 4757, 9, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (52, 'Motorola G8 Power Lite RAM 4GB/ 64GB Azul', 4395.0, 'Motorola G8 Power Lite te da entretenimiento para mucho tiempo. Tiene una batería de 5,000 mAh, lo que significa 100 horas de energía. Ademas, con sus 3 cámaras, nunca te pierdas de momentos inolvidables  ', 1, 8, 13, 1168, 10, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (53, 'LG K22 RAM 2GB/ 32GB Azul', 2995.0, 'Espléndidas fotos de cosas pequeñas con el LG K22. Toma fotos elaboradas de mascotas, gotas de lluvia o pétalos de flores sin tener que hacer zoom. La distancia focal mínima de 4cm de la cámara macro te mantiene totalmente enfocado incluso al estar extremadamente cerca.', 1, 3, 21, 3733, 1, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (54, 'Motorola Moto E7 Plus RAM 4GB/ 64GB Azul', 3995.0, 'El Motorola Moto E7 Plus pasa a integrar la serie Moto E de séptima generación con una pantalla HD+ de 6.5 pulgadas. Por dentro, encontramos un procesador Snapdragon 460 con 4GB de memoria RAM y 64GB de almacenamiento interno expandible.', 1, 1, 16, 5955, 4, 2);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (55, 'Xiaomi Redmi 9 RAM 4GB/ 64GB Gris', 4995.0, 'El Xiaomi Redmi 9 posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. Entre sus diversas funcionalidades encontrarás el tema oscuro y navegación por gestos.<span></span>', 1, 1, 27, 5448, 3, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (56, 'LG K71 RAM 4GB/ 128GB Gris', 9395.0, 'Exprésale al mundo quién eres con el nuevo LG K71, el dispositivo que mejora tu #VidaCreativa y todas tus formas de vivirla. Ya sea que experimentes, crees o compartas contenido, LG K71 te da un potencial ilimitado aunque tengas un presupuesto limitado. ', 1, 3, 16, 1435, 3, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (57, 'Motorola One Fusion RAM 4GB/ 128GB Verde', 5695.0, 'Motorola one fusion + Moto-Fusion-Emerald reúne un increíble sistema de cámara cuádruple de 64 MP junto con un rendimiento imparable y duración de la batería. Con una gama de colores un 25% más grande y HDR10, su entretenimiento cobrará vida en una pantalla Total Vision de 6.5"', 1, 6, 4, 3226, 4, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (58, 'Apple iPhone 12 64GB/ RAM 4GB Negro', 30995.0, 'iPhone 12. 5G para descargar películas sobre la marcha y transmitir videos de alta calidad.¹ Pantalla Super Retina XDR de 6.1 pulgadas maravillosamente brillante.² Ceramic Shield con un rendimiento de caída 4 veces mejor.³ Increíble fotografía con poca luz con el modo Noche en todas las cámaras.', 1, 10, 2, 954, 6, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (59, 'Xiaomi Redmi Note 9 RAM 4GB/ 128GB Gris', 6495.0, 'El Redmi Note 9 es un buen teléfono inteligente Android, ideal para fotos, que puede satisfacer incluso a los usuarios más exigentes. Tiene una enorme pantalla táctil de 6.53 pulgadas con una resolución de 2340 x 1080 píxeles. Sobre las características de este Redmi Note 9, en realidad no falta nada.', 1, 2, 2, 4549, 4, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (60, 'Samsung Galaxy A31  RAM 4GB/ 128GB Azul', 7995.0, 'Con cuatro cámaras traseras y una pantalla enorme, el teléfono inteligente Galaxy A31 A315G Dual-SIM GB de Samsung le brinda opciones de entretenimiento versátiles y de alta calidad. ', 1, 13, 17, 5897, 5, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (61, 'Huawei P40 Lite RAM 6GB/ 128GB Negro', 7994.99, 'El diseño de HUAWEI P40 lite enfatiza lo esencial, sin trucos innecesarios. El cuerpo tiene un diseño curvo de cuatro lados, por lo que se siente tan bien como se ve. La cámara frontal se encuentra dentro de la pantalla HUAWEI Punch FullView de 6,4 ", por lo que se aprovecha al máximo el espacio, solo pantalla para tu disfrute. ', 1, 18, 41, 8671, 3, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (62, 'Samsung Galaxy A12 RAM 4GB/ 64GB Negro', 4695.0, 'Expande tu vista a la pantalla Infinity-V de 6.5 pulgadas del Galaxy A12 y ve lo que se has estado perdiendo. Gracias a la tecnología HD +, tu contenido diario se ve nítido y claro. Galaxy A12 combina una estética de diseño aerodinámico con colores clásicos. Las curvas refinadas lo hacen cómodo de sostener y brindan una fácil navegación por la pantalla.', 1, 10, 21, 5890, 6, 3);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (63, 'BLU C6L RAM 1GB/ 16GB Negro', 2295.0, 'BLU C6L combina el elemento más fundamental del diseño con una estética de buen gusto para formar una de las imágenes de marca más icónicas. El patrón adorna la tapa de la batería para una excelente experiencia de mano junto con herramientas de líneas de decoración pulidas para una imagen atractiva. ', 1, 12, 34, 5248, 2, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (64, 'LG K22 RAM 2GB/ 32GB Gris', 2995.0, 'Espléndidas fotos de cosas pequeñascon el LG K22. Toma fotos elaboradas de mascotas, gotas de lluvia o pétalos de flores sin tener que hacer zoom. La distancia focal mínima de 4cm de la cámara macro te mantiene totalmente enfocado incluso al estar extremadamente cerca.', 1, 17, 20, 3326, 2, 1);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (65, 'Samsung Galaxy A12 RAM 4GB/ 64GB Azul', 4695.0, 'Expande tu vista a la pantalla Infinity-V de 6.5 pulgadas del Galaxy A12 y ve lo que se has estado perdiendo. Gracias a la tecnología HD +, tu contenido diario se ve nítido y claro. Galaxy A12 combina una estética de diseño aerodinámico con colores clásicos. Las curvas refinadas lo hacen cómodo de sostener y brindan una fácil navegación por la pantalla.', 1, 3, 41, 3481, 2, 2);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (66, 'Motorola Moto E7 Plus RAM 4GB/ 64GB Naranja', 3995.0, 'El Motorola Moto E7 Plus pasa a integrar la serie Moto E de séptima generación con una pantalla HD+ de 6.5 pulgadas. Por dentro, encontramos un procesador Snapdragon 460 con 4GB de memoria RAM y 64GB de almacenamiento interno expandible.', 1, 3, 12, 9615, 2, 9);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (67, 'Motorola E6s 32GB/ RAM 2GB Gris', 2995.0, 'El Moto E6S cuenta con una pantalla HD + de 15,49 cm con una relación de aspecto de 19,5: 9 que ayuda a dar vida a su contenido favorito al brindarle la máxima visualización. Puede hacer clic en imágenes espectaculares mientras viaja con la cámara de enfoque automático de 13 MP de este teléfono. Gracias al flash LED incorporado, no tendrá dificultades para hacer clic en las imágenes en condiciones de poca luz.<span "="" class="redactor-invisible-space"></span>', 1, 8, 27, 9760, 3, 11);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (68, 'Samsung Galaxy S20 FE RAM 6GB/ 128GB Verde', 19995.0, 'Este es el teléfono hecho para personas que lo quieren todo. Está repleto de funciones hechas a medida para fanáticos de todo tipo, ya sea que te guste la fotografía, los juegos o llenar tu feed con todo lo que te inspira. Este es el teléfono que deja atrás el compromiso y ofrece las innovaciones del Galaxy S20 para que todos tengan acceso a una tecnología increíble.', 1, 12, 3, 8278, 2, 3);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (69, 'BMobile AX1077 Plus Tigo RAM 1GB/ 32GB Negro', 1299.0, 'Para los que siempre están conectados con sus redes sociales, Conectividad en todo momento,Revive cada momento en una pantalla grande, Una gran pantalla para brindar una experiencia espectacular.<br/>', 1, 9, 22, 9816, 7, 9);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (70, 'Huawei Y7A RAM 4GB/ 64GB Negro', 5995.0, 'Con una artesanía refinada y un revestimiento exquisito, el aspecto elegante de HUAWEI Y7a combinado con bordes curvos ofrece un toque cómodo en sus manos. Los tres colores dinámicos brillan en la luz y dejan que te encante a primera vista.', 1, 10, 30, 3125, 4, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (71, 'BLU C6L RAM 1GB/ 16GB Azul', 2295.0, 'BLU C6L combina el elemento más fundamental del diseño con una estética de buen gusto para formar una de las imágenes de marca más icónicas. El patrón adorna la tapa de la batería para una excelente experiencia de mano junto con herramientas de líneas de decoración pulidas para una imagen atractiva. ', 1, 9, 34, 5596, 3, 13);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (72, 'Hyundai Tablet Koral 10.1" 16GB/ RAM 2GB Gris', 3995.0, 'Nuestra línea de tabletas koral está hecha para reflejar el borde de nuestra marca. Disponible con una clara pantalla capacitiva multitáctil que es tan duradera como elegante, la tableta koral de 10 pulgadas no decepcionará.', 1, 10, 21, 6099, 8, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (73, 'Samsung Tab A7 10" LTE 32GB Dorada', 8995.0, 'Conozca la tableta delgada y liviana con la experiencia de entretenimiento que anhela. Su pantalla ultra ancha de 10,4 pulgadas¹ y sus altavoces de sonido envolvente Dolby Atmos te atraen a películas y programas.', 1, 17, 2, 6526, 1, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (74, 'Samsung Tab S7 LTE 128GB Negra', 23995.0, 'Conoce la Galaxy Tab S7. Trabaje y juegue en la pantalla ultra suave de 120Hz, impulsada por nuestro chipset más poderoso. Obtenga una experiencia similar a la de una PC con solo presionar un teclado o use el S Pen de latencia ultrabaja para escribir como nunca antes.', 1, 17, 36, 3176, 6, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (75, 'Samsung Galaxy Tab A7 10" Wi-Fi 32GB Plateada', 6995.0, 'Conozca la tableta delgada y liviana con la experiencia de entretenimiento que anhela. Su pantalla ultra ancha de 10,4 pulgadas¹ y sus altavoces de sonido envolvente Dolby Atmos te atraen a películas y programas.', 1, 1, 38, 3852, 10, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (76, 'Samsung Galaxy Tab S6 LTE 64GB/ Gris', 10600.0, 'Su pantalla expansiva y su construcción liviana y elegante lo hacen perfecto para el entretenimiento en movimiento. El S Pen incluido le permite crear, editar y navegar sin esfuerzo por su trabajo.<span class="redactor-invisible-space"><span class="redactor-invisible-space"></span></span>', 1, 10, 35, 1353, 9, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (77, 'Apple iPad Air 10.5" 64GB WiFi + Celular Space Gray', 21595.0, 'El iPad Air pone en manos de muchas más personas nuestras tecnologías más potentes: el chip A12 Bionic con Neural Engine, una pantalla Retina de 10.5 pulgadas con True Tone y compatibilidad con el Apple Pencil y el Smart Keyboard. Y con tan sólo 6.1 mm de grosor y menos de 500 gramos de peso, llevar todo ese poder a todas partes es muy fácil.', 1, 6, 26, 8242, 8, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (78, 'Samsung Tab S7 WiFi 128GB Gris', 21495.0, 'Conoce la Galaxy Tab S7. Trabaje y juegue en la pantalla ultra suave de 120Hz, impulsada por nuestro chipset más poderoso. Obtenga una experiencia similar a la de una PC con solo presionar un teclado o use el S Pen de latencia ultrabaja para escribir como nunca antes.', 1, 10, 19, 559, 5, 9);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (79, 'Apple iPad 10.2" Wi-fi (8va generación) 128GB Dorada', 18995.0, 'El iPad de 10.2 "de Apple cuenta con la pantalla Retina con una resolución de 2160 x 1620 para detalles nítidos y colores vivos, lo que lo convierte en un compañero ideal para ver películas, crear contenido y mucho más. Además, su Smart Connector ofrece compatibilidad con Smart Keyboard para escribir cómodamente , mientras que su pantalla es compatible con el Apple Pencil de primera generación, por lo que los usuarios pueden escribir y dibujar.', 1, 15, 38, 3680, 9, 10);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (80, 'Lenovo Tablet Tab M7 Gris', 2995.0, '¿Busca una tableta que sea divertida, asequible y que pueda llevar a cualquier parte? Su búsqueda termina con la Lenovo Tab M7. Es súper portátil con solo 7 ", con una pantalla vívida y bordes estrechos para una experiencia de transmisión de video sublime.', 1, 14, 27, 3371, 1, 5);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (81, 'Tablet Huawei Media Pad T3 10" Wifi', 5495.0, 'Siéntase siempre como si estuviera con un amigo de confianza, con el sistema de operación HUAWEI MediaPad T3 10 EMUI 5.1, cuidadosamente diseñado para una interacción fácil e intuitiva. Desarrollado por Android 7.0, el sistema operativo personalizado de HUAWEI MediaPad T3 10 está aquí para hacerte la vida más fácil.', 1, 2, 21, 5767, 8, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (82, 'Apple iPad 10.2" Wi-Fi (8va generación) 32GB Gris', 14995.0, 'El iPad de 10.2 "de Apple cuenta con la pantalla Retina con una resolución de 2160 x 1620 para detalles nítidos y colores vivos, lo que lo convierte en un compañero ideal para ver películas, crear contenido y mucho más. Además, su Smart Connector ofrece compatibilidad con Smart Keyboard para escribir cómodamente , mientras que su pantalla es compatible con el Apple Pencil de primera generación, por lo que los usuarios pueden escribir y dibujar.', 1, 1, 3, 7943, 9, 3);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (83, 'Lenovo M10 10" 2GB 16GB WIFI LTE', 4995.0, 'La Tab M10 de Lenovo es una tablet familiar increíble. Su pantalla y sus altavoces frontales duales ofrecen un entretenimiento envolvente. Y todo ello incluido en un perfil extremadamente delgado y liviano. Incluye además el paquete opcional para niños para que tus hijos puedan usarla sin preocupaciones. Compártela sin problemas.', 1, 5, 2, 5762, 5, 7);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (84, 'Hyundai Tablet Koral 7M4 7" 1GB/ RAM 8GB Negro', 2795.0, 'Elegante y liviana, nuestra pantalla multitáctil de 7 pulgadas es lo suficientemente grande como para obtener imágenes claras, pero lo suficientemente compacta como para viajar fácilmente. Con 8 GB de almacenamiento Flash y una ranura para tarjeta Micro SD, no tendrá que preocuparse por las limitaciones de almacenamiento.', 1, 14, 15, 7897, 4, 12);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (85, 'Lenovo Yoga Smart Tab 10" Wi-Fi +4G Memoria RAM 4GB/ 64 GB Gris', 9995.0, 'Nuestra premiada Yoga Smart Tab con Google Assistant está inspirada en la revolucionaria Yoga Tab 3. Cuenta con increíbles funciones para la diversión - como una pantalla FHD IPS y altavoces JBL® en estéreo –, y además incluye el poder de un centro doméstico inteligente portátil. ', 1, 15, 11, 2893, 5, 11);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (86, 'Apple iPad Pro 12" Wi-Fi + Celular 256GB Gris', 45995.0, 'El iPad Pro de 12,9 pulgadas cuenta con una pantalla Liquid Retina inmersiva de borde a borde. Las nuevas cámaras profesionales, Wide y Ultra Wide, combinadas con el nuevo LiDAR Scanner permiten experiencias completamente nuevas en la próxima generación de aplicaciones de realidad aumentada (AR).', 1, 1, 31, 8310, 8, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (87, 'Samsung Galaxy Tab A7 10" 32GB Gris', 8995.0, 'Conozca la tableta delgada y liviana con la experiencia de entretenimiento que anhela. Su pantalla ultra ancha de 10,4 pulgadas¹ y sus altavoces de sonido envolvente Dolby Atmos te atraen a películas y programas.', 1, 9, 24, 1412, 10, 4);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (88, 'Apple iPad Pro 12" Wi-Fi + Celular 256GB Gris Espacial', 45995.0, 'El iPad Pro de 12,9 pulgadas cuenta con una pantalla Liquid Retina inmersiva de borde a borde. Las nuevas cámaras profesionales, Wide y Ultra Wide, combinadas con el nuevo LiDAR Scanner permiten experiencias completamente nuevas en la próxima generación de aplicaciones de realidad aumentada (AR).', 1, 18, 4, 4216, 1, 6);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (89, 'Samsung Galaxy Tab A 8" con S Pen', 9695.0, 'El nombre lo dice todo. La Galaxy Tab A viene con un S Pen en su interior, lo que la convierte en el dispositivo portátil definitivo para negocios y educación. Una amplia variedad de gráficos extendidos proporciona una sensación de paisaje incluso cuando se mantiene verticalmente, complementando el elegante diseño en negro.', 1, 8, 23, 7884, 9, 8);
    

    INSERT INTO ARTICULO (id_articulo, nombre, precio, descripcion, publicado, fk_departamento, fk_municipio, cantidad_disponible, fk_categoria, fk_usuario) VALUES
    (90, 'Apple iPad Pro 12" Wi-Fi 256 GB Space Gray', 43995.0, 'Tu próximo ordenador no es un ordenador. Un diseño deslumbrante a toda pantalla.Una velocidad que ya quisieran la mayoría de portátiles PC. Unas cámaras que transforman la realidad. Y puedes usarlo con el dedo, un lápiz, un teclado y ahora también un trackpad. Es el nuevo iPad Pro. ', 1, 14, 18, 4669, 7, 9);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES
(1,2),
(2,2),
(3,1);

INSERT INTO CALIFICACION (fk_usuarioCalificador,fk_usuarioCalificado,calificacion) VALUES
(1,2,40),
(2,1,30),
(3,1,99);

-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES
-- (1,2),
-- (2,1),
-- (3,1);

INSERT INTO `DENUNCIA` VALUES (1,1,2,'Fraude',_binary '\0'),(2,2,1,'Fraude',_binary '\0'),(3,3,1,'Fraude',_binary '\0'),(4,2,6,'Publicidad engañosa',_binary '\0'),(5,2,7,'Venta de productos ilegales',_binary '\0'),(6,2,12,'Fraude',_binary '\0'),(7,5,6,'Publicidad engañosa',_binary '\0'),(8,5,3,'Venta de productos ilegales',_binary '\0'),(12,5,10,'Publicidad engañosa',_binary '\0'),(13,63,1,'Otros',_binary '\0'),(14,63,6,'Fraude',_binary '\0'),(15,63,12,'Otros',_binary '\0'),(16,63,5,'Venta de productos ilegales',_binary '\0'),(17,63,9,'Otros',_binary '\0'),(18,62,12,'Otros',_binary '\0'),(19,62,5,'Fraude',_binary '\0'),(20,62,10,'Venta de productos ilegales',_binary '\0'),(21,49,6,'Publicidad engañosa',_binary '\0'),(22,49,1,'Publicidad engañosa',_binary '\0'),(23,33,5,'Publicidad engañosa',_binary '\0'),(24,33,10,'Fraude',_binary '\0');


INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES
(1,1),
(1,2),
(2,3);

INSERT INTO `COMENTARIO` VALUES (1,'Usuario','Excelente, es un vendedor responsable','2021-08-06 16:33:34',1,2),(2,'Denuncia','LA publicidad es engañosa.','2021-08-06 17:07:12',2,6),(3,'Denuncia','Este man vende marihuana en sus productos. ','2021-08-07 04:48:55',2,7),(4,'Denuncia','Hice un depósito a la cuenta pactada, jamás envío el producto.','2021-08-07 04:50:28',2,12),(5,'Denuncia','Drogo.','2021-08-07 04:53:28',5,6),(6,'Denuncia','Las ZEDES son una trampa oligarquica para hundir aún más al país.','2021-08-07 04:54:50',5,3),(7,'Denuncia','Es cosa de todos los días: cuando vamos a hacer un trámite a cualquier empresa de servicios o incluso de venta de productos (por ejemplo para cambiar un producto), nos solicitan una autorización con firma certificada, nos piden enviar una carta certificada o documento a algún lugar lejano, acercar fotocopias de una enorme cantidad de documentación y una enorme cantidad de requisitos burocráticos más. Esto se explica por la necesidad de acreditar quién hace el trámite y otros tantos motivos.','2021-08-07 05:10:56',5,10),(8,'Denuncia','PRODUCTOS MAL LOGRADOS.','2021-08-07 05:32:22',63,1),(9,'Denuncia','Vende productos de aparente calidad, pero en realidad no es lo que presenta en el portal.','2021-08-07 05:33:05',63,6),(10,'Denuncia','Tarda en responder, una vez realizado el pago de un producto.','2021-08-07 05:33:40',63,12),(11,'Denuncia','EN china es prohíbida la venta de carne de cerdo.','2021-08-07 05:34:18',63,5),(12,'Denuncia','Los productos son realmente caros, y son USADOS.','2021-08-07 05:34:51',63,9),(13,'Denuncia','No sirven sus productos.','2021-08-07 05:41:03',62,12),(14,'Denuncia','Le compre un Protector de Corriente Forza 8 Salidas/ Negro, y no era de color negro, sino azul oscuro. Le envíe mensaje y me bloqueo de FB y Whatsapp. uwu','2021-08-07 05:41:56',62,5),(15,'Denuncia','Hyundai Tablet Koral 7M4 7\" 1GB/ RAM 8GB Negro\nNO LO COMPREN, duró un mes y medio, dicho producto tenía una garantía falsa.','2021-08-07 05:42:58',62,10),(16,'Denuncia','Apple iPad Pro 12\" Wi-Fi + Celular 256GB Gris Espacial\nEste producto que ofrece el doctor Anatoly, es una copia china. ','2021-08-07 05:45:30',49,6),(17,'Denuncia','Productos caros. ','2021-08-07 05:45:58',49,1),(18,'Denuncia','Alienware de pésima calidad señora. \nPagué la totalidad del producto y no es lo que ofrece en la publicación correspondiente.','2021-08-07 15:58:49',33,5),(19,'Denuncia','Otro estafador en esta página, me ha sucedido lo mismo en la compra de los últimos siete productos. ','2021-08-07 16:21:49',33,10);

INSERT INTO `BITACORA` VALUES (1,2,54,'2021-08-04 17:03:57','2021-08-04 17:04:01'),(2,2,65,'2021-08-04 17:04:18','2021-08-04 17:05:33'),(3,5,5,'2021-08-04 17:12:29','2021-08-04 17:13:24'),(4,5,9,'2021-08-04 17:15:28','2021-08-04 17:15:55'),(5,5,9,'2021-08-04 17:15:59','2021-08-04 17:16:01'),(6,5,7,'2021-08-04 17:16:15','2021-08-04 17:19:21'),(7,5,9,'2021-08-04 17:19:39','2021-08-04 17:19:44'),(8,5,60,'2021-08-04 17:19:48','2021-08-04 17:19:51'),(9,5,60,'2021-08-04 17:19:51','2021-08-04 17:19:51'),(10,5,60,'2021-08-04 17:19:51','2021-08-04 17:19:52'),(11,5,60,'2021-08-04 17:19:52','2021-08-04 17:19:52'),(12,5,60,'2021-08-04 17:19:52','2021-08-04 17:19:52'),(13,5,60,'2021-08-04 17:19:53','2021-08-04 17:19:53'),(14,5,60,'2021-08-04 17:19:53','2021-08-04 17:19:53'),(15,5,60,'2021-08-04 17:19:53','2021-08-04 17:19:54'),(16,5,60,'2021-08-04 17:19:54','2021-08-04 17:19:54'),(17,5,60,'2021-08-04 17:19:54','2021-08-04 17:19:54'),(18,5,60,'2021-08-04 17:19:55','2021-08-04 17:20:50'),(19,5,5,'2021-08-04 18:01:32','2021-08-04 18:01:34'),(20,5,5,'2021-08-04 01:42:35','2021-08-04 01:42:37'),(21,2,5,'2021-08-04 08:02:38','2021-08-04 08:02:46'),(22,2,64,'2021-08-04 08:03:48','2021-08-04 08:05:47'),(23,2,11,'2021-08-04 08:07:04','2021-08-04 08:07:06'),(24,2,51,'2021-08-05 20:22:16','2021-08-05 20:22:23'),(25,2,8,'2021-08-06 16:56:37','2021-08-06 16:57:26'),(26,2,54,'2021-08-07 17:03:28','2021-08-07 17:03:32'),(27,2,54,'2021-08-07 17:06:28','2021-08-07 17:06:31'),(28,2,54,'2021-08-07 17:06:33','2021-08-07 17:06:36'),(29,2,7,'2021-08-07 17:06:54','2021-08-07 17:06:56'),(30,2,11,'2021-08-07 04:48:34','2021-08-07 04:48:36'),(31,2,11,'2021-08-07 04:49:00','2021-08-07 04:49:01'),(32,2,4,'2021-08-07 04:49:03','2021-08-07 04:49:06'),(33,2,4,'2021-08-07 04:49:52','2021-08-07 04:49:54'),(34,2,40,'2021-08-07 04:49:58','2021-08-07 04:49:59'),(35,5,52,'2021-08-07 04:53:19','2021-08-07 04:53:21'),(36,5,52,'2021-08-07 04:53:31','2021-08-07 04:53:33'),(37,5,39,'2021-08-07 04:53:37','2021-08-07 04:53:39'),(38,5,39,'2021-08-07 04:54:03','2021-08-07 04:54:05'),(39,5,62,'2021-08-07 04:54:14','2021-08-07 04:54:16'),(40,5,35,'2021-08-07 05:02:08','2021-08-07 05:02:09'),(41,5,35,'2021-08-07 05:02:30','2021-08-07 05:02:33'),(42,5,14,'2021-08-07 05:02:38','2021-08-07 05:02:40'),(43,5,14,'2021-08-07 05:02:47','2021-08-07 05:02:49'),(44,5,51,'2021-08-07 05:02:53','2021-08-07 05:02:55'),(45,5,51,'2021-08-07 05:03:55','2021-08-07 05:04:00'),(46,5,83,'2021-08-07 05:04:04','2021-08-07 05:04:06'),(47,5,88,'2021-08-07 05:04:11','2021-08-07 05:04:14'),(48,5,27,'2021-08-07 05:04:18','2021-08-07 05:04:20'),(49,63,5,'2021-08-07 05:32:06','2021-08-07 05:32:08'),(50,63,9,'2021-08-07 05:32:26','2021-08-07 05:32:27'),(51,63,9,'2021-08-07 05:33:08','2021-08-07 05:33:10'),(52,63,40,'2021-08-07 05:33:12','2021-08-07 05:33:14'),(53,63,39,'2021-08-07 05:33:48','2021-08-07 05:33:49'),(54,63,78,'2021-08-07 05:34:28','2021-08-07 05:34:30'),(55,62,51,'2021-08-07 05:40:52','2021-08-07 05:40:53'),(56,62,51,'2021-08-07 05:41:09','2021-08-07 05:41:09'),(57,62,46,'2021-08-07 05:41:12','2021-08-07 05:41:18'),(58,62,46,'2021-08-07 05:41:58','2021-08-07 05:41:58'),(59,62,84,'2021-08-07 05:42:03','2021-08-07 05:42:08'),(60,62,84,'2021-08-07 05:42:42','2021-08-07 05:42:43'),(61,62,78,'2021-08-07 05:42:47','2021-08-07 05:42:49'),(62,62,28,'2021-08-07 05:42:51','2021-08-07 05:42:54'),(63,49,88,'2021-08-07 05:44:48','2021-08-07 05:44:52'),(64,49,88,'2021-08-07 05:45:37','2021-08-07 05:45:38'),(65,49,31,'2021-08-07 05:45:44','2021-08-07 05:45:46'),(66,33,40,'2021-08-07 15:57:15','2021-08-07 15:57:20'),(67,33,45,'2021-08-07 15:57:36','2021-08-07 15:57:39'),(68,33,15,'2021-08-07 15:57:52','2021-08-07 15:57:55'),(69,33,15,'2021-08-07 16:21:04','2021-08-07 16:21:05'),(70,33,50,'2021-08-07 16:21:09','2021-08-07 16:21:11'),(71,2,11,'2021-08-08 17:03:04','2021-08-08 17:03:06'),(72,2,4,'2021-08-08 17:03:07','2021-08-08 17:03:09'),(73,2,5,'2021-08-08 17:03:10','2021-08-08 17:03:12'),(74,2,9,'2021-08-08 17:03:14','2021-08-08 17:03:15'),(75,2,50,'2021-08-08 17:03:17','2021-08-08 17:03:19'),(76,2,53,'2021-08-08 17:03:26','2021-08-08 17:03:29'),(77,2,80,'2021-08-08 17:03:30','2021-08-08 17:03:35'),(78,2,73,'2021-08-08 17:03:32','2021-08-08 17:03:36'),(79,2,73,'2021-08-08 17:04:14','2021-08-08 17:04:17'),(80,2,39,'2021-08-08 17:04:27','2021-08-08 17:04:28'),(81,2,39,'2021-08-08 17:48:10','2021-08-08 17:48:20');


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO `IMAGEN` VALUES (1,'/media/adf04439d82d90994491476ad6976ade-500x500.jpg',1),(2,'/media/50e2c7493bd701a9c12ab9acf85f0308-500x500.jpg',1),(3,'/media/111eba6f030f4e51b9696acd88863caf-500x500.jpg',1),(4,'/media/173b0af594ed6677d58b16088e303ae3-500x500.jpg',1),(5,'/media/5867faf05499a139e59ce553c84bff8b-500x500.jpg',2),(6,'/media/2d21f77517e31cda670f7743d704b275-500x500.jpg',2),(7,'/media/6e7e62e61d33923c04e8b94a11f27d32-500x500.jpg',2),(8,'/media/f6a2a1410c4fd0433a41602721a23fb1-500x500.jpg',3),(9,'/media/e07ba8e755959be89ca9d740a7de2144-500x500.jpg',3),(10,'/media/2fd42aeb331e226c585df3b283c01b3b-500x500.jpg',3),(11,'/media/9f7e5e5bce40c64811ebd5325b67a7dc-500x500.jpg',3),(12,'/media/b93dea84333fb1ccb7c863578e99970d-500x500.jpg',3),(13,'/media/d7152e297657fb4dd324bc59bac140d0-500x500.jpg',3),(14,'/media/657655c7c6fbc06b20f6568eba85a056-500x500.jpg',4),(15,'/media/5348d45af1462b29410eee7e10c279a1-500x500.jpg',4),(16,'/media/119277dba44916d959daab691c24849c-500x500.jpg',4),(17,'/media/9bdea20f545aea9dee76cb1629807886-500x500.jpg',4),(18,'/media/27368f7cb000719ffe1173ffb6cd4daf-500x500.png',5),(19,'/media/a46870b7112d1d8f03ae8d5b20e46702-500x500.png',5),(20,'/media/05841f294912ee3bbc65975f007f981c-500x500.png',5),(21,'/media/e954083fabcf3ada2f86ba9b8bb7f8e5-500x500.png',5),(22,'/media/029f41ff76836bcdfc5f20d84503e729-500x500.png',5),(23,'/media/f46dea4440c7cfb65c285c1038d5fa98-500x500.png',5),(24,'/media/dbc337f2813ea8979f0ac0e0db386762-500x500.jpg',6),(25,'/media/978d3deb06639e7e07c8249c3c4a0961-500x500.jpg',6),(26,'/media/16055df6822163fb75e301fc32117311-500x500.jpg',6),(27,'/media/d0a5fa01cfade52c9495e890c07c9ad3-500x500.jpg',6),(28,'/media/b53f9095a8b761892f199f299fc0e313-500x500.jpg',6),(29,'/media/7889f47dd0f9358cf6fd8320a100a5e4-500x500.jpg',6),(30,'/media/680ec71b40649288031c15d16b893a4d-500x500.jpg',6),(31,'/media/d6afd3779bb32a3892584ec5412c94ad-500x500.jpg',7),(32,'/media/aea269f9236908236ba8cfd6464cdbe2-500x500.jpg',7),(33,'/media/e0a261dad72904d84406d25059855643-500x500.jpg',7),(34,'/media/4dd4dd3511f63f984d30b9e9c436e682-500x500.jpg',7),(35,'/media/04ecc9a8cd8a6247bf8160645c0ba781-500x500.jpg',7),(36,'/media/bb7bf28ecc9222a9e72abb828e196e13-500x500.jpg',7),(37,'/media/c2763c61e780c29be2e6d88b7264a093-500x500.jpg',8),(38,'/media/35cf5afacb78f524252d30aa3ef63bba-500x500.jpg',8),(39,'/media/b1996ebf9cbde69184a41df5e038d041-500x500.jpg',8),(40,'/media/f61fc93279aa1b914cd68f6113667443-500x500.jpg',8),(41,'/media/c5b30a431af1a5af5255d2ebfda7ba45-500x500.jpg',9),(42,'/media/ff69963300b720954797b1ae50da56ce-500x500.jpg',9),(43,'/media/d26afd2e86fcdca683f6778d84317de4-500x500.jpg',9),(44,'/media/6a70c3f072b9fd946afbe83619c0004b-500x500.jpg',9),(45,'/media/703111ed5cef87fb255faa91e99be9d1-500x500.jpg',9),(46,'/media/d750029d870b87fe9f6c5bf5551c0acc-500x500.jpg',9),(47,'/media/09bb9111302159151bb6015cc22bc905-500x500.jpg',9),(48,'/media/01ea8389fabcf673f9ab64c22e1c32e1-500x500.jpg',9),(49,'/media/dc2a1156d7bdf40561658f642328f30a-500x500.jpg',10),(50,'/media/5fff0f746017b4816439d5eff646430e-500x500.jpg',10),(51,'/media/e1ef5736d3e35f5aa5e0191a273a8862-500x500.jpg',10),(52,'/media/e67ea5c1258a1d85b971268d6958a0e2-500x500.jpg',10),(53,'/media/c0fa45b395b114ce486982c802cb0b17-500x500.jpg',10),(54,'/media/288e0303b42ab9e2375ca8576a7732c3-500x500.jpg',10),(55,'/media/00f60a0cf9fa6f25245dfc89eb517ff7-500x500.jpg',10),(56,'/media/e0fb3472d1b4a862811d98f04f2dd18c-500x500.jpg',10),(57,'/media/445d305fe4978baa536791b1498053f3-500x500.jpg',10),(58,'/media/052542da6dae2064a363fd0454ff4491-500x500.jpg',10),(59,'/media/c61d82bb5ef9c9aa45f91c5c6dd60df6-500x500.jpg',11),(60,'/media/bcd93e93fd88a1f22124cdb03ebd4adc-500x500.jpg',11),(61,'/media/80fad68eb9fd9c4731b2da407551a873-500x500.jpg',11),(62,'/media/daa1c42dc536b7c3d13c42b8eabb7190-500x500.jpg',11),(63,'/media/2bf26964e012cd577ad69208509da8ce-500x500.jpg',11),(64,'/media/c1b01841aa2c61e4db123961b0a9309c-500x500.jpg',11),(65,'/media/b416749ca6bf9c8e3096bda89d0c926a-500x500.jpg',11),(66,'/media/c2763c61e780c29be2e6d88b7264a093-500x500.jpg',12),(67,'/media/35cf5afacb78f524252d30aa3ef63bba-500x500.jpg',12),(68,'/media/b1996ebf9cbde69184a41df5e038d041-500x500.jpg',12),(69,'/media/f61fc93279aa1b914cd68f6113667443-500x500.jpg',12),(70,'/media/cc5958b1c1626ec3607e10fa6cd9ddc6-500x500.jpg',12),(71,'/media/c5b30a431af1a5af5255d2ebfda7ba45-500x500.jpg',13),(72,'/media/ff69963300b720954797b1ae50da56ce-500x500.jpg',13),(73,'/media/d26afd2e86fcdca683f6778d84317de4-500x500.jpg',13),(74,'/media/6a70c3f072b9fd946afbe83619c0004b-500x500.jpg',13),(75,'/media/703111ed5cef87fb255faa91e99be9d1-500x500.jpg',13),(76,'/media/d750029d870b87fe9f6c5bf5551c0acc-500x500.jpg',13),(77,'/media/09bb9111302159151bb6015cc22bc905-500x500.jpg',13),(78,'/media/01ea8389fabcf673f9ab64c22e1c32e1-500x500.jpg',13),(79,'/media/dc2a1156d7bdf40561658f642328f30a-500x500.jpg',14),(80,'/media/5fff0f746017b4816439d5eff646430e-500x500.jpg',14),(81,'/media/e1ef5736d3e35f5aa5e0191a273a8862-500x500.jpg',14),(82,'/media/e67ea5c1258a1d85b971268d6958a0e2-500x500.jpg',14),(83,'/media/c0fa45b395b114ce486982c802cb0b17-500x500.jpg',14),(84,'/media/288e0303b42ab9e2375ca8576a7732c3-500x500.jpg',14),(85,'/media/00f60a0cf9fa6f25245dfc89eb517ff7-500x500.jpg',14),(86,'/media/e0fb3472d1b4a862811d98f04f2dd18c-500x500.jpg',14),(87,'/media/445d305fe4978baa536791b1498053f3-500x500.jpg',14),(88,'/media/052542da6dae2064a363fd0454ff4491-500x500.jpg',14),(89,'/media/c61d82bb5ef9c9aa45f91c5c6dd60df6-500x500.jpg',15),(90,'/media/bcd93e93fd88a1f22124cdb03ebd4adc-500x500.jpg',15),(91,'/media/80fad68eb9fd9c4731b2da407551a873-500x500.jpg',15),(92,'/media/daa1c42dc536b7c3d13c42b8eabb7190-500x500.jpg',15),(93,'/media/2bf26964e012cd577ad69208509da8ce-500x500.jpg',15),(94,'/media/c1b01841aa2c61e4db123961b0a9309c-500x500.jpg',15),(95,'/media/b416749ca6bf9c8e3096bda89d0c926a-500x500.jpg',15),(96,'/media/18b843cb7d3129d91fbac06977689ecc-500x500.jpg',16),(97,'/media/29947cfe2eebe3447794a584c34a82de-500x500.jpg',16),(98,'/media/9fdb0b1e264fa8b27499180db2c738c2-500x500.jpg',16),(99,'/media/e96b3d22ad8277d5bdfb0aecd7e63d74-500x500.jpg',16),(100,'/media/4b83251639474fc50f0fc6235ad63b6f-500x500.jpg',17),(101,'/media/bf5830d8ffe0b15336ce44016c69f88e-500x500.jpg',17),(102,'/media/d5c2aadd1a8cfd1824a29d6909ee7e9b-500x500.jpg',17),(103,'/media/b1adf008115288e8bbb254635678888f-500x500.jpg',17),(104,'/media/295bd498cd2db001512a299da47a86ad-500x500.jpg',17),(105,'/media/bcdff6c3aecf44f9f0177d8975391895-500x500.jpg',18),(106,'/media/060efaf72c651d6aab0333ac6d888a26-500x500.jpg',18),(107,'/media/3ade77f9f23aee95849daa9f2469a6cf-500x500.jpg',18),(108,'/media/e52a328bc2a26090a63822566f37b261-500x500.jpg',18),(109,'/media/43babcec18b7e9c9effd1f7581a89d42-500x500.jpg',18),(110,'/media/4c5fcbf3c8e57f335dd80fd1d91a90c8-500x500.jpg',18),(111,'/media/445060a95f0f787dba12ca185896b9a5-500x500.jpg',18),(112,'/media/0e1c8131232ff34d03c0123ec2b0d352-500x500.jpg',19),(113,'/media/26dddd24d90455a7a49abeb82bc5d0ef-500x500.jpg',19),(114,'/media/f52ad5679a574c3c52588effbf06eaae-500x500.jpg',19),(115,'/media/3619f6665a98db958a9eb0f79710bdad-500x500.jpg',19),(116,'/media/4a669f65e962ae57f6651a2e1c140f00-500x500.jpg',19),(117,'/media/b91f7f46ab0ae1cf822b90cf9d40e7f4-500x500.jpg',19),(118,'/media/e170dac1f774c4d7dca8428b4f1de131-500x500.jpg',19),(119,'/media/230bfa609a6707753de4154baca0a225-500x500.jpg',19),(120,'/media/3d7927804519d1a734d34e13230ecc2c-500x500.png',20),(121,'/media/2f47decef566bc885e5da64b41c17615-500x500.png',20),(122,'/media/c6c2e45f7470d4c88ab832e832906225-500x500.png',20),(123,'/media/2c484826758d2b3bf62e146ce517f80e-500x500.png',20),(124,'/media/997362be993ec442800dcf61ec217909-500x500.png',20),(125,'/media/10d6262442f64934a2afdef58452c66f-500x500.png',20),(126,'/media/d665e3fe68225ddb031a357aeedec487-500x500.png',20),(127,'/media/1b8ea728e4255d50deced9d43167b7d3-500x500.jpg',21),(128,'/media/aa12012eab9c81795147e4038d92dfdb-500x500.jpg',21),(129,'/media/d1b57b39517eec45d7e80e1e9bc4857b-500x500.jpg',21),(130,'/media/91f5d29ab76f1f75309f643a1d9c1dc5-500x500.jpg',21),(131,'/media/19b80e40d5c248fa703ed2bcda69f8d8-500x500.jpg',21),(132,'/media/dc29a507cc71083b026c11ad39d514de-500x500.jpg',21),(133,'/media/e182fd4b55d76989f618a5000665ede1-500x500.jpg',21),(134,'/media/14-DH0004LA_0-500x500.jpg',22),(135,'/media/14-DH0004LA_1-500x500.jpg',22),(136,'/media/14-DH0004LA_2-500x500.jpg',22),(137,'/media/14-DH0004LA_3-500x500.jpg',22),(138,'/media/14-DH0004LA_4-500x500.jpg',22),(139,'/media/14-DH0004LA_6-500x500.jpg',22),(140,'/media/79e662119cbc14405ec2a5aabfe91dcb-500x500.jpg',23),(141,'/media/bd70ce5dafd372318b20e869f582028a-500x500.jpg',23),(142,'/media/bf04050ca6082f19cb3f7de31ffd47b5-500x500.jpg',23),(143,'/media/938d17fb86c0ee5977540c73142eaccb-500x500.jpg',23),(144,'/media/e0f83c9873f20c05d8480b07ddc988a1-500x500.jpg',24),(145,'/media/5877ebd6ea0814a598a26c8afae0e356-500x500.jpg',24),(146,'/media/35441336a956e8ae0be4d21eec5f35dd-500x500.jpg',24),(147,'/media/25ccf1002cc9cff69ffe2a605ea1a49b-500x500.jpg',24),(148,'/media/090c52dcb1510e2bd72cb81da29150da-500x500.jpg',24),(149,'/media/72dc94071b2a8ef5579e3ddcb43306a2-500x500.jpg',24),(150,'/media/MONITOR_GAMING_2-500x500.jpg',25),(151,'/media/2160beb68ea0e9ff08f7ff679bae35d1-500x500.jpg',26),(152,'/media/7ea60d0026cb0119238dbc64848b4e7f-500x500.jpg',26),(153,'/media/e1c6d8cc5dd05922d6035b996459c92a-500x500.jpg',26),(154,'/media/download_(1)-500x500.jpg',27),(155,'/media/9f09645d378b981992585b361e929a8d-500x500.jpg',28),(156,'/media/179f521093ecc2ff20146a847388a254-500x500.jpg',28),(157,'/media/bd9336fd70aaa56e4e6dbbad4dcee8c4-500x500.jpg',28),(158,'/media/3935402648634d90ead3760f1b523dc3-500x500.jpg',28),(159,'/media/2247c8c6c0789085f2c27c352d76bf99-500x500.jpg',29),(160,'/media/ea49aab36283976a39fa950252df9aaa-500x500.jpg',29),(161,'/media/ef730cebd2318907640f4501fa1524c5-500x500.jpg',29),(162,'/media/43aa88174f181a4506a3da683a014c2b-500x500.jpg',29),(163,'/media/c05935981_209x189-500x500.jpg',30),(164,'/media/MONITOR_DELL_22-500x500.jpg',31),(165,'/media/81-KPRZ3SCL._SY355_-500x500.jpg',32),(166,'/media/MOUSE_TARGUS_BLUETOOTH_INALAMBRICO_B580-500x500.png',33),(167,'/media/MOUSE_TARGUS_BLUETOOTH_INALAMBRICO_B580_LATERAL-500x500.png',33),(168,'/media/MOUSE_TARGUS_BLUETOOTH_INALAMBRICO_B580_LATERAL_2-500x500.png',33),(169,'/media/pro_59033562_1-500x500.jpg',34),(170,'/media/klip-xtreme-kmo-310bk-beetle-r-500x500.jpg',35),(171,'/media/pro_59053345_2-500x500.jpg',35),(172,'/media/356KL_ROJO_MOUSE-500x500.jpg',36),(173,'/media/MOUSE_BL356KL-500x500.jpg',36),(174,'/media/MOUSE_INALAMBRICO_330BL_AZUL-500x500.png',37),(175,'/media/MOUSE_INALAMBRICO_330BK_NEGRO_Trasera-500x500.jpg',37),(176,'/media/LINKSYS_RE6250-500x500.jpeg',38),(177,'/media/LINKSYS_RE6250_lateral-500x500.jpeg',38),(178,'/media/MIC365-500x500.jpg',39),(179,'/media/348272-MOWL-C_1-500x500.jpg',40),(180,'/media/348272-MOWL-C_2-500x500.jpg',40),(181,'/media/348272-MOWL-C_3-500x500.jpg',40),(182,'/media/MOUSE_INALAMBRICO_330BK_NEGRO-500x500.jpg',41),(183,'/media/MOUSE_INALAMBRICO_330BK_NEGRO_Trasera-500x500.jpg',41),(184,'/media/07081bbce3ecb500ec01222480499cdc-500x500.jpg',42),(185,'/media/0e0106fbc9e45fe67f64b23c9889e702-500x500.jpg',42),(186,'/media/f650c7b6a8366deaf618ee527c39eec2-500x500.jpg',42),(187,'/media/20a656374f9b0691474fb5c397b96917-500x500.jpg',43),(188,'/media/69e15f653dfdec00997b94b6cc1341ba-500x500.jpg',43),(189,'/media/08da63fdec09df6e2aaace60643d4662-500x500.jpg',43),(190,'/media/616c83a17ca4eb8e137fe470059f35cc-500x500.jpg',43),(191,'/media/d4d06d4fde06710db1ab5d7366ddf65c-500x500.jpg',43),(192,'/media/b93cd8d215980fd1ae841d7201a68a3b-500x500.jpg',43),(193,'/media/0d456d58feead1e64edcb8b374d20f13-500x500.jpg',43),(194,'/media/6303267faa7d938d7f684065656a2da2-500x500.jpg',43),(195,'/media/MOUSE_KLIP356BK-500x500.jpg',44),(196,'/media/MOUSE_BL356KL-500x500.jpg',44),(197,'/media/kasp-500x500.jpg',45),(198,'/media/pro_59033561_1-500x500.jpg',46),(199,'/media/pro_59033561_2-500x500.jpg',46),(200,'/media/pro_59033561_3-500x500.jpg',46),(201,'/media/pro_59033561_4-500x500.jpg',46),(202,'/media/26e82aad299f6271f8b3ca0576b7b325-500x500.jpg',47),(203,'/media/794d11f4bc024323ec9dc59f6259b05e-500x500.jpg',47),(204,'/media/46c91600cd955a0cdc77a77ae90dcfdc-500x500.jpg',47),(205,'/media/e08c41b7c659e7c3b9088630393db6eb-500x500.jpg',48),(206,'/media/2044f8d7206ca100339e0c3d6832904f-500x500.jpg',48),(207,'/media/pro_59052691_1-500x500.jpg',49),(208,'/media/pro_59052691_2-500x500.jpg',49),(209,'/media/CP-KLIPXTREME-KMP-100B-2-500x500.jpg',50),(210,'/media/81-KPRZ3SCL._SY355_-500x500.jpg',51),(211,'/media/c2060b2cd139ffe900ac2813e36b6191-500x500.jpg',52),(212,'/media/9b08f2226e1ce02de638b44257ce8854-500x500.jpg',52),(213,'/media/d1e6237b708d474a7effab2be82f6c35-500x500.jpg',52),(214,'/media/737738909e4b6eb8e714b74c8a2a07af-500x500.jpg',52),(215,'/media/118ff862ed0259acf692a85e7b5867a3-500x500.jpg',53),(216,'/media/19014b1602528b653737c25a596b9c1c-500x500.jpg',53),(217,'/media/88222a958241260f774011f5125b5bdf-500x500.jpg',53),(218,'/media/afcebecbe0ffa8973a9dcd9072e0210f-500x500.jpg',53),(219,'/media/7c857da93d353fb34310a76156cc0b64-500x500.jpg',53),(220,'/media/3675ef1b741723109d6cda6f32c342f2-500x500.jpg',53),(221,'/media/58cd0e9ee82a7e0e4aff268eff4824cd-500x500.jpg',54),(222,'/media/dd988a9cbd82b97177298b3471564bb6-500x500.jpg',54),(223,'/media/a01f21b2f8cc4305fcab1e53cbedd31b-500x500.jpg',54),(224,'/media/bf4e1fed07684ee1eb934a4be9672ff8-500x500.jpg',54),(225,'/media/d08afaaaf81b5ce7fe133d8134df369d-500x500.jpg',54),(226,'/media/233d940a8275aaaaa211f32d09f6d1cb-500x500.jpg',55),(227,'/media/a64a63c2311267333a7f60fb98625b1e-500x500.jpg',55),(228,'/media/26e627e66adcbac8e9c7a351f780433d-500x500.jpg',56),(229,'/media/d8fdf704d82e955190954bdc9ca0efbd-500x500.jpg',56),(230,'/media/411ac134bc28dfaa59d5790a60edadac-500x500.jpg',56),(231,'/media/e8cf559aea6ae934bfea293f3485f13f-500x500.jpg',56),(232,'/media/3952ad8ccdc2669e01d1d6bd577608bf-500x500.jpg',56),(233,'/media/2f32f875f8330e24b6cfae70886bea9b-500x500.jpg',56),(234,'/media/5d678210afa6c30f872b8d1777808e50-500x500.jpg',56),(235,'/media/ccd09a7af9246f1328a0ceb78df7b584-500x500.jpg',56),(236,'/media/72562988638c58caa69ca337a2137135-500x500.jpg',57),(237,'/media/0ad9e57b0d207b5cc12f3150deea10a6-500x500.jpg',57),(238,'/media/714e59a58e5ccbe35a4fb893dd60e3cf-500x500.jpg',57),(239,'/media/ea921fa06880e23fb23be7900db26750-500x500.jpg',57),(240,'/media/14f6f3c4720fb02455a38695e57204fa-500x500.jpg',57),(241,'/media/72f28ae5d7cf23847428fb8c3b6bc88c-500x500.jpg',58),(242,'/media/cd051609d78570bca6a70ab89d74ec2a-500x500.jpg',58),(243,'/media/28db26aeac1b6eb19edb0d1ba3f3e2b7-500x500.jpg',58),(244,'/media/756c6060e5e8fb65356ee4210f394801-500x500.jpg',58),(245,'/media/8f56afd49530fa6d4921f1e4fb0cb5e5-500x500.jpg',59),(246,'/media/d5ec940b4dc2b317fd38ac6d466734ac-500x500.jpg',59),(247,'/media/18b4debcc52e585a89f65ea1e6bb38e3-500x500.jpg',59),(248,'/media/339299aed7598c40ae89a0da6e64c8fe-500x500.jpg',59),(249,'/media/c69145b1bc656fa8aa57e8d8838ad105-500x500.jpg',60),(250,'/media/411eddf657389bbc9bb77f6819cc2e17-500x500.jpg',60),(251,'/media/2e6eb40334ba122620462e56f5fffb87-500x500.jpg',60),(252,'/media/5e18b11d797928711e90266e78c7bbc0-500x500.jpg',60),(253,'/media/5ed1062845fba28668fcfaa62bd2f3a4-500x500.jpg',60),(254,'/media/01d90fdddcaabc05ba61940694808c09-500x500.jpg',60),(255,'/media/de3fc7204d55526f7db9c8a508e70b83-500x500.jpg',61),(256,'/media/846ea809e69bf19a66b848fd04eed294-500x500.jpg',61),(257,'/media/168f93b2e2e2c52212b04533f8c4c512-500x500.jpg',61),(258,'/media/22b5136fb5697288b70ef5ccf8e38411-500x500.jpg',61),(259,'/media/8c61d0f14f9a804cc1cb65d510c80956-500x500.jpg',61),(260,'/media/e13289adcf67fd50fc9ab0605b573f9f-500x500.jpg',61),(261,'/media/7204fb86435a63372ae8ce3ffc6b1f72-500x500.jpg',62),(262,'/media/a2e61d6f6efe51377e8dc57c7fe9379b-500x500.jpg',62),(263,'/media/b108f1e5c277fd10cb349b60d209f9e9-500x500.jpg',62),(264,'/media/a1b497d292c2911706a71c2fbb168f6d-500x500.jpg',62),(265,'/media/cf97272e85c65dfbc73ff2b6feb9316e-500x500.jpg',62),(266,'/media/6f7991e3a3b074eb0df9b14743b6e815-500x500.jpg',62),(267,'/media/703af03cfdb42fafd3d26d2cf78523cb-500x500.jpg',62),(268,'/media/12b749de123eaee4a0686c8b6936d375-500x500.jpg',62),(269,'/media/BLU_C6L_FROT-500x500.jpg',63),(270,'/media/BLU-C6L-500x500.jpg',63),(271,'/media/BLU-C6L-C0030UU-BLK-4-500x500.jpg',63),(272,'/media/6466ca4f6b6abd160f0821ac51a44d86-500x500.jpg',64),(273,'/media/f4b3e25ecb345ee64845ae6579b71796-500x500.jpg',64),(274,'/media/3351f40fdc04fd4935a68564ebe0afd1-500x500.jpg',64),(275,'/media/ad2cc4f7eccaa67e0465babd69959f6c-500x500.jpg',64),(276,'/media/2de0bc1bbb857b876a8f7a823901412a-500x500.jpg',64),(277,'/media/9ea25e04f243d7980ada1111d5d0ad78-500x500.jpg',64),(278,'/media/dfbff7c1689ce073d2e16602b8bec417-500x500.jpg',64),(279,'/media/bc932d028d6d1a8178fbe159b271817a-500x500.jpg',64),(280,'/media/e6855205795246089662781c0d00ec94-500x500.jpg',65),(281,'/media/069c51f75bd199f89775da5fb4319dee-500x500.jpg',65),(282,'/media/0c2e67566c4be4e3df91e9b996a8bbb2-500x500.jpg',65),(283,'/media/c0e35cc4dc2df7314a54245a17740928-500x500.jpg',65),(284,'/media/f96fa4c804d8910f2e2761420dc7b119-500x500.jpg',65),(285,'/media/582d1197ca91a47f21d83c5786c26662-500x500.jpg',65),(286,'/media/1a0b783f79ffda031e958c5ee600cc6e-500x500.jpg',65),(287,'/media/5ab533bc111be70c7d60ad4eb46f4f2a-500x500.jpg',65),(288,'/media/3c4a11c13265cb1c5ebf255b359ee51f-500x500.jpg',66),(289,'/media/13bd8df0faef049f29ca43c6eb8a6d1b-500x500.jpg',66),(290,'/media/ce99d6b3310698531e7c97bde0b1fe70-500x500.jpg',66),(291,'/media/8b4d9d62791e27518bd914cacbc29042-500x500.jpg',66),(292,'/media/666d0ebbf0575cf30091b75a1f9676f9-500x500.jpg',66),(293,'/media/ab9267f056b8bc1fd4d5c16e244765cd-500x500.jpg',67),(294,'/media/9564c28aec70d658bdedca9c6e33ffb3-500x500.jpg',67),(295,'/media/91c7ff121b2fc4ba797a4511c947c43a-500x500.jpg',67),(296,'/media/3c9bdc7d71d6b1e2bc5b2c79f14523c0-500x500.jpg',67),(297,'/media/c46d4019cfcfc19eb4adee2ceabfae1f-500x500.jpg',68),(298,'/media/05f69411dc67e97e41aef76bf5f3c822-500x500.jpg',68),(299,'/media/97099de59e6f16f8ac6a5a574e9ffcf4-500x500.jpg',68),(300,'/media/6585de50e32532a74abf20908a5c1a3e-500x500.jpg',68),(301,'/media/0ea2a30bd73c50f444cf919c2a467aaa-500x500.jpg',68),(302,'/media/16163c8177474f8b77fc2e7631587f57-500x500.jpg',68),(303,'/media/AX1077_Black_(2)-500x500.jpg',69),(304,'/media/AX1077_Black_(3)-500x500.jpg',69),(305,'/media/AX1077_Black_(4)-500x500.jpg',69),(306,'/media/AX1077_Black_(5)-500x500.jpg',69),(307,'/media/AX1077_Black_(6)-500x500.jpg',69),(308,'/media/AX1077_Black_(1)-500x500.jpg',69),(309,'/media/5bb6fde0ace07364eda404e09b8dfc0d-500x500.jpg',70),(310,'/media/5d64b16f62697999c6ac233798bc159e-500x500.jpg',70),(311,'/media/cd523c7a3dfa99ee880a2d5ee3750dca-500x500.jpg',70),(312,'/media/7362b8001b9c36e7defce789b241be18-500x500.jpg',70),(313,'/media/88b212902895bd6f1f790ed76a2ff1d8-500x500.jpg',70),(314,'/media/blu-c6_AZUL-500x500.jpg',71),(315,'/media/BLU-C6L-AZUL-500x500.jpg',71),(316,'/media/BLU-C6L-BLUE-500x500.jpg',71),(317,'/media/TAB-HYUNDAI-KORAL10_1-500x500.jpg',72),(318,'/media/TAB-HYUNDAI-KORAL10_2-500x500.jpg',72),(319,'/media/TAB-HYUNDAI-KORAL10_3-500x500.jpg',72),(320,'/media/TAB-HYUNDAI-KORAL10_4-500x500.jpg',72),(321,'/media/636eed3d690b997691119f5c8ea914ba-500x500.jpg',73),(322,'/media/5d2ff0b3c5c3d06999f8fb16f021a6e2-500x500.jpg',73),(323,'/media/a722b60e829dbe0ab962aeab2ecaab08-500x500.jpg',73),(324,'/media/d9496c0500d0d7d9afbc60f4c6f77505-500x500.jpg',73),(325,'/media/7a9aa197ad56bc87b5233eda797e869b-500x500.jpg',73),(326,'/media/1e1f099ad345108dde3d1457d97cbf00-500x500.jpg',73),(327,'/media/c301cb2f6e9821271134037a7f899d67-500x500.jpg',73),(328,'/media/e1342b5a582101b9816df1d9b5766597-500x500.jpg',74),(329,'/media/08c506ba550c0ff5261fde115b86e631-500x500.jpg',74),(330,'/media/40daa06557c903d8f5503cbec9748c6c-500x500.jpg',74),(331,'/media/f9e0910e64b0f0fea7f6342a91f7d54a-500x500.jpg',74),(332,'/media/72c7acc9e603fe64f5845aca364465e2-500x500.jpg',74),(333,'/media/454437a4fe020e8b77627be9bc38f3dc-500x500.jpg',74),(334,'/media/a9f4e69df00c27dd058c64b4c55ec47a-500x500.jpg',75),(335,'/media/1de58660c52087ebcb3cc990dccda348-500x500.jpg',75),(336,'/media/e9293a9b043bc64a0c5eada9d6ea5971-500x500.jpg',75),(337,'/media/5760aefcdf3bd77bf9b51e8b52e1cbb3-500x500.jpg',75),(338,'/media/a7c57e3dc736e579247ee0532cc35501-500x500.jpg',75),(339,'/media/582908f757093421843c923e99542e2b-500x500.jpg',75),(340,'/media/0b012394efdb2c02a9b5ac0e32808803-500x500.jpg',75),(341,'/media/3b02cdcafdaac9c889510ded7c72326b-500x500.jpg',75),(342,'/media/44f042b84fed2a595bb1df937d436103-500x500.jpg',76),(343,'/media/c3dc90df6d50a8c341f4d7b9c5d3a228-500x500.jpg',76),(344,'/media/f0410b48f86da07071c2eb4a8b5b783b-500x500.jpg',76),(345,'/media/6266d0416d3e43014f3087a62ff6cbf6-500x500.jpg',76),(346,'/media/e4332403fb5114c7011dd2a26b68e48f-500x500.jpg',77),(347,'/media/3b9f391d60f7ac6722d7469d51e21648-500x500.jpg',77),(348,'/media/b6fc89939fe9f66b421ead18cd38bb73-500x500.jpg',77),(349,'/media/7f4a14afa4c63f015c76e7dbdeb96c4d-500x500.jpg',78),(350,'/media/97c0ffb5499aa6997b18837cf7f3ea39-500x500.jpg',78),(351,'/media/65d7c26aac661a6b066ac8563929d857-500x500.jpg',78),(352,'/media/5f9878de2c31552531d374f7d36cc07a-500x500.jpg',78),(353,'/media/c8563a5ed4289f8fba6f0a7615b1a921-500x500.jpg',78),(354,'/media/012dee6c3cca81ac29f5851ca49fd50f-500x500.jpg',78),(355,'/media/e0c8aeb1bbbfc91d77d23c12dcd830d8-500x500.jpg',79),(356,'/media/3822e18395ec028cd80e57d4c6b4fc7a-500x500.jpg',79),(357,'/media/02a7714dd7909dcf52ddc53dc81965e3-500x500.jpg',79),(358,'/media/a346f33601a7877a38eb6080f434050a-500x500.jpg',79),(359,'/media/b2152ab37131cfa9b74d5b2ceb083a36-500x500.jpg',80),(360,'/media/c8f60a2dc4cf01c2b15665c654a6f581-500x500.jpg',80),(361,'/media/e5ff464d2f7ad774d3a36578cc4da277-500x500.jpg',80),(362,'/media/fc3cd5c098dd1663fa8db59c742085f2-500x500.jpg',80),(363,'/media/1f7039ff9c863599129551b5bfc762be-500x500.jpg',80),(364,'/media/0000002222-tablet-500x500.jpg',81),(365,'/media/2797b22aee04e80468c3339d1f94f58d-500x500.jpg',82),(366,'/media/1b3ae1ca8d2e2e3fc077d6ff0845fbc1-500x500.jpg',82),(367,'/media/16b5fe7ca48ae5c0b7c350aca111c9dd-500x500.jpg',82),(368,'/media/34b3b8d119fc0f7d3484b9059d76af27-500x500.jpg',82),(369,'/media/a1fd7d35da0a1d7aff3e16f4e6641f23-500x500.jpg',83),(370,'/media/92f748d65c214944bc9fc998d1ff192e-500x500.jpg',83),(371,'/media/644902784115300c0ecbc25262bb700a-500x500.jpg',83),(372,'/media/TAB-HYUNDAI-KORAL_1-500x500.jpg',84),(373,'/media/TAB-HYUNDAI-KORAL_2-500x500.jpg',84),(374,'/media/TAB-HYUNDAI-KORAL_3-500x500.jpg',84),(375,'/media/1665aacaa8ed207395c3cb6e4a1f8b8e-500x500.jpg',85),(376,'/media/cf32ede0d478f387829423ceaa3a4187-500x500.jpg',85),(377,'/media/a8c991455aa2592265577a75dea2d852-500x500.jpg',85),(378,'/media/1c668e0f6e6cd98ec7be5eb33c021665-500x500.jpg',85),(379,'/media/09b2ccffae757ef06e45b4496f3395c8-500x500.jpg',86),(380,'/media/c3d9ceed76f1e6d7db4262af8fcd82b7-500x500.jpg',86),(381,'/media/a64f61760f9760144910011dfa093a5d-500x500.jpg',86),(382,'/media/1894084f7c4684f32f203ccba3cdec51-500x500.jpg',86),(383,'/media/abe3476a1d777ea4098bba64e8b22ae7-500x500.jpg',87),(384,'/media/33e662b072f992bf718d67f2a7f0a171-500x500.jpg',87),(385,'/media/4c80799b77cd27a82d0f64a915d36bea-500x500.jpg',87),(386,'/media/ce350b26a6fd50f8fd44e68f68e94e1a-500x500.jpg',87),(387,'/media/d39c28850a6b95218cfa3a28bf0ea1af-500x500.jpg',87),(388,'/media/3296362f15340a68d35b33b0571a3445-500x500.jpg',87),(389,'/media/1ea6e0833150d325c9043e01cf6d2e9b-500x500.jpg',88),(390,'/media/d660e379ccc142e6c4cbe4e58ac14930-500x500.jpg',88),(391,'/media/b0694b50fe50e6b1ad2f1bb9eaa893d9-500x500.jpg',88),(392,'/media/68c2cee18669be6bf5ed7db218afb744-500x500.jpg',88),(393,'/media/ea11b5a1ec8c856b17b89315275df8dc-500x500.jpg',88),(394,'/media/galaxy_tab-500x500.jpg',89),(395,'/media/f3768571b6da0ef3671dd3d442028ea5-500x500.jpg',90),(396,'/media/c837ee1c53fe8f0d7e5932dab54daae8-500x500.jpg',90),(397,'/media/9badc85e1f201295f875d0271de09f2f-500x500.jpg',90);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES
-- ("/media/adf04439d82d90994491476ad6976ade-500x500.jpg",1),
-- ("/media/50e2c7493bd701a9c12ab9acf85f0308-500x500.jpg",1),
-- ("/media/111eba6f030f4e51b9696acd88863caf-500x500.jpg",1),
-- ("/media/173b0af594ed6677d58b16088e303ae3-500x500.jpg",1),
-- ("/media/5867faf05499a139e59ce553c84bff8b-500x500.jpg",2),
-- ("/media/2d21f77517e31cda670f7743d704b275-500x500.jpg",2),
-- ("/media/6e7e62e61d33923c04e8b94a11f27d32-500x500.jpg",2),
-- ("/media/f6a2a1410c4fd0433a41602721a23fb1-500x500.jpg",3),
-- ("/media/e07ba8e755959be89ca9d740a7de2144-500x500.jpg",3),
-- ("/media/2fd42aeb331e226c585df3b283c01b3b-500x500.jpg",3),
-- ("/media/9f7e5e5bce40c64811ebd5325b67a7dc-500x500.jpg",3),
-- ("/media/b93dea84333fb1ccb7c863578e99970d-500x500.jpg",3),
-- ("/media/d7152e297657fb4dd324bc59bac140d0-500x500.jpg",3),
-- ("/media/657655c7c6fbc06b20f6568eba85a056-500x500.jpg",4),
-- ("/media/5348d45af1462b29410eee7e10c279a1-500x500.jpg",4),
-- ("/media/119277dba44916d959daab691c24849c-500x500.jpg",4),
-- ("/media/9bdea20f545aea9dee76cb1629807886-500x500.jpg",4),
-- ("/media/27368f7cb000719ffe1173ffb6cd4daf-500x500.png",5),
-- ("/media/a46870b7112d1d8f03ae8d5b20e46702-500x500.png",5),
-- ("/media/05841f294912ee3bbc65975f007f981c-500x500.png",5),
-- ("/media/e954083fabcf3ada2f86ba9b8bb7f8e5-500x500.png",5),
-- ("/media/029f41ff76836bcdfc5f20d84503e729-500x500.png",5),
-- ("/media/f46dea4440c7cfb65c285c1038d5fa98-500x500.png",5),
-- ("/media/dbc337f2813ea8979f0ac0e0db386762-500x500.jpg",6),
-- ("/media/978d3deb06639e7e07c8249c3c4a0961-500x500.jpg",6),
-- ("/media/16055df6822163fb75e301fc32117311-500x500.jpg",6),
-- ("/media/d0a5fa01cfade52c9495e890c07c9ad3-500x500.jpg",6),
-- ("/media/b53f9095a8b761892f199f299fc0e313-500x500.jpg",6),
-- ("/media/7889f47dd0f9358cf6fd8320a100a5e4-500x500.jpg",6),
-- ("/media/680ec71b40649288031c15d16b893a4d-500x500.jpg",6),
-- ("/media/d6afd3779bb32a3892584ec5412c94ad-500x500.jpg",7),
-- ("/media/aea269f9236908236ba8cfd6464cdbe2-500x500.jpg",7),
-- ("/media/e0a261dad72904d84406d25059855643-500x500.jpg",7),
-- ("/media/4dd4dd3511f63f984d30b9e9c436e682-500x500.jpg",7),
-- ("/media/04ecc9a8cd8a6247bf8160645c0ba781-500x500.jpg",7),
-- ("/media/bb7bf28ecc9222a9e72abb828e196e13-500x500.jpg",7),
-- ("/media/c2763c61e780c29be2e6d88b7264a093-500x500.jpg",8),
-- ("/media/35cf5afacb78f524252d30aa3ef63bba-500x500.jpg",8),
-- ("/media/b1996ebf9cbde69184a41df5e038d041-500x500.jpg",8),
-- ("/media/f61fc93279aa1b914cd68f6113667443-500x500.jpg",8),
-- ("/media/c5b30a431af1a5af5255d2ebfda7ba45-500x500.jpg",9),
-- ("/media/ff69963300b720954797b1ae50da56ce-500x500.jpg",9),
-- ("/media/d26afd2e86fcdca683f6778d84317de4-500x500.jpg",9),
-- ("/media/6a70c3f072b9fd946afbe83619c0004b-500x500.jpg",9),
-- ("/media/703111ed5cef87fb255faa91e99be9d1-500x500.jpg",9),
-- ("/media/d750029d870b87fe9f6c5bf5551c0acc-500x500.jpg",9),
-- ("/media/09bb9111302159151bb6015cc22bc905-500x500.jpg",9),
-- ("/media/01ea8389fabcf673f9ab64c22e1c32e1-500x500.jpg",9),
-- ("/media/dc2a1156d7bdf40561658f642328f30a-500x500.jpg",10),
-- ("/media/5fff0f746017b4816439d5eff646430e-500x500.jpg",10),
-- ("/media/e1ef5736d3e35f5aa5e0191a273a8862-500x500.jpg",10),
-- ("/media/e67ea5c1258a1d85b971268d6958a0e2-500x500.jpg",10),
-- ("/media/c0fa45b395b114ce486982c802cb0b17-500x500.jpg",10),
-- ("/media/288e0303b42ab9e2375ca8576a7732c3-500x500.jpg",10),
-- ("/media/00f60a0cf9fa6f25245dfc89eb517ff7-500x500.jpg",10),
-- ("/media/e0fb3472d1b4a862811d98f04f2dd18c-500x500.jpg",10),
-- ("/media/445d305fe4978baa536791b1498053f3-500x500.jpg",10),
-- ("/media/052542da6dae2064a363fd0454ff4491-500x500.jpg",10),
-- ("/media/c61d82bb5ef9c9aa45f91c5c6dd60df6-500x500.jpg",11),
-- ("/media/bcd93e93fd88a1f22124cdb03ebd4adc-500x500.jpg",11),
-- ("/media/80fad68eb9fd9c4731b2da407551a873-500x500.jpg",11),
-- ("/media/daa1c42dc536b7c3d13c42b8eabb7190-500x500.jpg",11),
-- ("/media/2bf26964e012cd577ad69208509da8ce-500x500.jpg",11),
-- ("/media/c1b01841aa2c61e4db123961b0a9309c-500x500.jpg",11),
-- ("/media/b416749ca6bf9c8e3096bda89d0c926a-500x500.jpg",11)
-- ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c2763c61e780c29be2e6d88b7264a093-500x500.jpg', 12);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/35cf5afacb78f524252d30aa3ef63bba-500x500.jpg', 12);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b1996ebf9cbde69184a41df5e038d041-500x500.jpg', 12);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f61fc93279aa1b914cd68f6113667443-500x500.jpg', 12);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/cc5958b1c1626ec3607e10fa6cd9ddc6-500x500.jpg', 12);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c5b30a431af1a5af5255d2ebfda7ba45-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ff69963300b720954797b1ae50da56ce-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d26afd2e86fcdca683f6778d84317de4-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6a70c3f072b9fd946afbe83619c0004b-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/703111ed5cef87fb255faa91e99be9d1-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d750029d870b87fe9f6c5bf5551c0acc-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/09bb9111302159151bb6015cc22bc905-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/01ea8389fabcf673f9ab64c22e1c32e1-500x500.jpg', 13);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/dc2a1156d7bdf40561658f642328f30a-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5fff0f746017b4816439d5eff646430e-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e1ef5736d3e35f5aa5e0191a273a8862-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e67ea5c1258a1d85b971268d6958a0e2-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c0fa45b395b114ce486982c802cb0b17-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/288e0303b42ab9e2375ca8576a7732c3-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/00f60a0cf9fa6f25245dfc89eb517ff7-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e0fb3472d1b4a862811d98f04f2dd18c-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/445d305fe4978baa536791b1498053f3-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/052542da6dae2064a363fd0454ff4491-500x500.jpg', 14);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c61d82bb5ef9c9aa45f91c5c6dd60df6-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bcd93e93fd88a1f22124cdb03ebd4adc-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/80fad68eb9fd9c4731b2da407551a873-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/daa1c42dc536b7c3d13c42b8eabb7190-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2bf26964e012cd577ad69208509da8ce-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c1b01841aa2c61e4db123961b0a9309c-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b416749ca6bf9c8e3096bda89d0c926a-500x500.jpg', 15);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/18b843cb7d3129d91fbac06977689ecc-500x500.jpg', 16);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/29947cfe2eebe3447794a584c34a82de-500x500.jpg', 16);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9fdb0b1e264fa8b27499180db2c738c2-500x500.jpg', 16);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e96b3d22ad8277d5bdfb0aecd7e63d74-500x500.jpg', 16);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/4b83251639474fc50f0fc6235ad63b6f-500x500.jpg', 17);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bf5830d8ffe0b15336ce44016c69f88e-500x500.jpg', 17);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d5c2aadd1a8cfd1824a29d6909ee7e9b-500x500.jpg', 17);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b1adf008115288e8bbb254635678888f-500x500.jpg', 17);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/295bd498cd2db001512a299da47a86ad-500x500.jpg', 17);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bcdff6c3aecf44f9f0177d8975391895-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/060efaf72c651d6aab0333ac6d888a26-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3ade77f9f23aee95849daa9f2469a6cf-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e52a328bc2a26090a63822566f37b261-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/43babcec18b7e9c9effd1f7581a89d42-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/4c5fcbf3c8e57f335dd80fd1d91a90c8-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/445060a95f0f787dba12ca185896b9a5-500x500.jpg', 18);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0e1c8131232ff34d03c0123ec2b0d352-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/26dddd24d90455a7a49abeb82bc5d0ef-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f52ad5679a574c3c52588effbf06eaae-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3619f6665a98db958a9eb0f79710bdad-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/4a669f65e962ae57f6651a2e1c140f00-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b91f7f46ab0ae1cf822b90cf9d40e7f4-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e170dac1f774c4d7dca8428b4f1de131-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/230bfa609a6707753de4154baca0a225-500x500.jpg', 19);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3d7927804519d1a734d34e13230ecc2c-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2f47decef566bc885e5da64b41c17615-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c6c2e45f7470d4c88ab832e832906225-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2c484826758d2b3bf62e146ce517f80e-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/997362be993ec442800dcf61ec217909-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/10d6262442f64934a2afdef58452c66f-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d665e3fe68225ddb031a357aeedec487-500x500.png', 20);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1b8ea728e4255d50deced9d43167b7d3-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/aa12012eab9c81795147e4038d92dfdb-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d1b57b39517eec45d7e80e1e9bc4857b-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/91f5d29ab76f1f75309f643a1d9c1dc5-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/19b80e40d5c248fa703ed2bcda69f8d8-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/dc29a507cc71083b026c11ad39d514de-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e182fd4b55d76989f618a5000665ede1-500x500.jpg', 21);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%0-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%1-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%2-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%3-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%4-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14-DH0004LA%6-500x500.jpg', 22);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/79e662119cbc14405ec2a5aabfe91dcb-500x500.jpg', 23);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bd70ce5dafd372318b20e869f582028a-500x500.jpg', 23);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bf04050ca6082f19cb3f7de31ffd47b5-500x500.jpg', 23);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/938d17fb86c0ee5977540c73142eaccb-500x500.jpg', 23);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e0f83c9873f20c05d8480b07ddc988a1-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5877ebd6ea0814a598a26c8afae0e356-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/35441336a956e8ae0be4d21eec5f35dd-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/25ccf1002cc9cff69ffe2a605ea1a49b-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/090c52dcb1510e2bd72cb81da29150da-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/72dc94071b2a8ef5579e3ddcb43306a2-500x500.jpg', 24);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MONITOR%GAMING%2-500x500.jpg', 25);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2160beb68ea0e9ff08f7ff679bae35d1-500x500.jpg', 26);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7ea60d0026cb0119238dbc64848b4e7f-500x500.jpg', 26);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e1c6d8cc5dd05922d6035b996459c92a-500x500.jpg', 26);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/download%(1)-500x500.jpg', 27);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9f09645d378b981992585b361e929a8d-500x500.jpg', 28);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/179f521093ecc2ff20146a847388a254-500x500.jpg', 28);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bd9336fd70aaa56e4e6dbbad4dcee8c4-500x500.jpg', 28);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3935402648634d90ead3760f1b523dc3-500x500.jpg', 28);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2247c8c6c0789085f2c27c352d76bf99-500x500.jpg', 29);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ea49aab36283976a39fa950252df9aaa-500x500.jpg', 29);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ef730cebd2318907640f4501fa1524c5-500x500.jpg', 29);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/43aa88174f181a4506a3da683a014c2b-500x500.jpg', 29);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c05935981_209x189-500x500.jpg', 30);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MONITOR%DELL%22-500x500.jpg', 31);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/81-KPRZ3SCL._SY355_-500x500.jpg', 32);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%TARGUS%BLUETOOTH%INALAMBRICO%B580-500x500.png', 33);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%TARGUS%BLUETOOTH%INALAMBRICO%B580%LATERAL-500x500.png', 33);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%TARGUS%BLUETOOTH%INALAMBRICO%B580%LATERAL%2-500x500.png', 33);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59033562_1-500x500.jpg', 34);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/klip-xtreme-kmo-310bk-beetle-r-500x500.jpg', 35);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59053345_2-500x500.jpg', 35);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/356KL%ROJO%MOUSE-500x500.jpg', 36);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%BL356KL-500x500.jpg', 36);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%INALAMBRICO%330BL%AZUL-500x500.png', 37);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%INALAMBRICO%330BK%NEGRO%Trasera-500x500.jpg', 37);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/LINKSYS%RE6250-500x500.jpeg', 38);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/LINKSYS%RE6250%lateral-500x500.jpeg', 38);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MIC365-500x500.jpg', 39);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/348272-MOWL-C%1-500x500.jpg', 40);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/348272-MOWL-C%2-500x500.jpg', 40);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/348272-MOWL-C%3-500x500.jpg', 40);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%INALAMBRICO%330BK%NEGRO-500x500.jpg', 41);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%INALAMBRICO%330BK%NEGRO%Trasera-500x500.jpg', 41);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/07081bbce3ecb500ec01222480499cdc-500x500.jpg', 42);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0e0106fbc9e45fe67f64b23c9889e702-500x500.jpg', 42);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f650c7b6a8366deaf618ee527c39eec2-500x500.jpg', 42);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/20a656374f9b0691474fb5c397b96917-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/69e15f653dfdec00997b94b6cc1341ba-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/08da63fdec09df6e2aaace60643d4662-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/616c83a17ca4eb8e137fe470059f35cc-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d4d06d4fde06710db1ab5d7366ddf65c-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b93cd8d215980fd1ae841d7201a68a3b-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0d456d58feead1e64edcb8b374d20f13-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6303267faa7d938d7f684065656a2da2-500x500.jpg', 43);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%KLIP356BK-500x500.jpg', 44);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/MOUSE%BL356KL-500x500.jpg', 44);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/kasp-500x500.jpg', 45);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59033561_1-500x500.jpg', 46);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59033561_2-500x500.jpg', 46);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59033561_3-500x500.jpg', 46);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59033561_4-500x500.jpg', 46);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/26e82aad299f6271f8b3ca0576b7b325-500x500.jpg', 47);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/794d11f4bc024323ec9dc59f6259b05e-500x500.jpg', 47);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/46c91600cd955a0cdc77a77ae90dcfdc-500x500.jpg', 47);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e08c41b7c659e7c3b9088630393db6eb-500x500.jpg', 48);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2044f8d7206ca100339e0c3d6832904f-500x500.jpg', 48);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59052691_1-500x500.jpg', 49);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/pro_59052691_2-500x500.jpg', 49);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/CP-KLIPXTREME-KMP-100B-2-500x500.jpg', 50);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/81-KPRZ3SCL._SY355_-500x500.jpg', 51);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c2060b2cd139ffe900ac2813e36b6191-500x500.jpg', 52);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9b08f2226e1ce02de638b44257ce8854-500x500.jpg', 52);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d1e6237b708d474a7effab2be82f6c35-500x500.jpg', 52);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/737738909e4b6eb8e714b74c8a2a07af-500x500.jpg', 52);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/118ff862ed0259acf692a85e7b5867a3-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/19014b1602528b653737c25a596b9c1c-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/88222a958241260f774011f5125b5bdf-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/afcebecbe0ffa8973a9dcd9072e0210f-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7c857da93d353fb34310a76156cc0b64-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3675ef1b741723109d6cda6f32c342f2-500x500.jpg', 53);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/58cd0e9ee82a7e0e4aff268eff4824cd-500x500.jpg', 54);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/dd988a9cbd82b97177298b3471564bb6-500x500.jpg', 54);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a01f21b2f8cc4305fcab1e53cbedd31b-500x500.jpg', 54);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bf4e1fed07684ee1eb934a4be9672ff8-500x500.jpg', 54);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d08afaaaf81b5ce7fe133d8134df369d-500x500.jpg', 54);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/233d940a8275aaaaa211f32d09f6d1cb-500x500.jpg', 55);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a64a63c2311267333a7f60fb98625b1e-500x500.jpg', 55);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/26e627e66adcbac8e9c7a351f780433d-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d8fdf704d82e955190954bdc9ca0efbd-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/411ac134bc28dfaa59d5790a60edadac-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e8cf559aea6ae934bfea293f3485f13f-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3952ad8ccdc2669e01d1d6bd577608bf-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2f32f875f8330e24b6cfae70886bea9b-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5d678210afa6c30f872b8d1777808e50-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ccd09a7af9246f1328a0ceb78df7b584-500x500.jpg', 56);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/72562988638c58caa69ca337a2137135-500x500.jpg', 57);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0ad9e57b0d207b5cc12f3150deea10a6-500x500.jpg', 57);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/714e59a58e5ccbe35a4fb893dd60e3cf-500x500.jpg', 57);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ea921fa06880e23fb23be7900db26750-500x500.jpg', 57);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/14f6f3c4720fb02455a38695e57204fa-500x500.jpg', 57);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/72f28ae5d7cf23847428fb8c3b6bc88c-500x500.jpg', 58);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/cd051609d78570bca6a70ab89d74ec2a-500x500.jpg', 58);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/28db26aeac1b6eb19edb0d1ba3f3e2b7-500x500.jpg', 58);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/756c6060e5e8fb65356ee4210f394801-500x500.jpg', 58);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/8f56afd49530fa6d4921f1e4fb0cb5e5-500x500.jpg', 59);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d5ec940b4dc2b317fd38ac6d466734ac-500x500.jpg', 59);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/18b4debcc52e585a89f65ea1e6bb38e3-500x500.jpg', 59);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/339299aed7598c40ae89a0da6e64c8fe-500x500.jpg', 59);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c69145b1bc656fa8aa57e8d8838ad105-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/411eddf657389bbc9bb77f6819cc2e17-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2e6eb40334ba122620462e56f5fffb87-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5e18b11d797928711e90266e78c7bbc0-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5ed1062845fba28668fcfaa62bd2f3a4-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/01d90fdddcaabc05ba61940694808c09-500x500.jpg', 60);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/de3fc7204d55526f7db9c8a508e70b83-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/846ea809e69bf19a66b848fd04eed294-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/168f93b2e2e2c52212b04533f8c4c512-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/22b5136fb5697288b70ef5ccf8e38411-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/8c61d0f14f9a804cc1cb65d510c80956-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e13289adcf67fd50fc9ab0605b573f9f-500x500.jpg', 61);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7204fb86435a63372ae8ce3ffc6b1f72-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a2e61d6f6efe51377e8dc57c7fe9379b-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b108f1e5c277fd10cb349b60d209f9e9-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a1b497d292c2911706a71c2fbb168f6d-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/cf97272e85c65dfbc73ff2b6feb9316e-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6f7991e3a3b074eb0df9b14743b6e815-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/703af03cfdb42fafd3d26d2cf78523cb-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/12b749de123eaee4a0686c8b6936d375-500x500.jpg', 62);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/BLU%C6L%FROT-500x500.jpg', 63);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/BLU-C6L-500x500.jpg', 63);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/BLU-C6L-C0030UU-BLK-4-500x500.jpg', 63);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6466ca4f6b6abd160f0821ac51a44d86-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f4b3e25ecb345ee64845ae6579b71796-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3351f40fdc04fd4935a68564ebe0afd1-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ad2cc4f7eccaa67e0465babd69959f6c-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2de0bc1bbb857b876a8f7a823901412a-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9ea25e04f243d7980ada1111d5d0ad78-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/dfbff7c1689ce073d2e16602b8bec417-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/bc932d028d6d1a8178fbe159b271817a-500x500.jpg', 64);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e6855205795246089662781c0d00ec94-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/069c51f75bd199f89775da5fb4319dee-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0c2e67566c4be4e3df91e9b996a8bbb2-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c0e35cc4dc2df7314a54245a17740928-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f96fa4c804d8910f2e2761420dc7b119-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/582d1197ca91a47f21d83c5786c26662-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1a0b783f79ffda031e958c5ee600cc6e-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5ab533bc111be70c7d60ad4eb46f4f2a-500x500.jpg', 65);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3c4a11c13265cb1c5ebf255b359ee51f-500x500.jpg', 66);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/13bd8df0faef049f29ca43c6eb8a6d1b-500x500.jpg', 66);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ce99d6b3310698531e7c97bde0b1fe70-500x500.jpg', 66);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/8b4d9d62791e27518bd914cacbc29042-500x500.jpg', 66);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/666d0ebbf0575cf30091b75a1f9676f9-500x500.jpg', 66);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ab9267f056b8bc1fd4d5c16e244765cd-500x500.jpg', 67);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9564c28aec70d658bdedca9c6e33ffb3-500x500.jpg', 67);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/91c7ff121b2fc4ba797a4511c947c43a-500x500.jpg', 67);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3c9bdc7d71d6b1e2bc5b2c79f14523c0-500x500.jpg', 67);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c46d4019cfcfc19eb4adee2ceabfae1f-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/05f69411dc67e97e41aef76bf5f3c822-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/97099de59e6f16f8ac6a5a574e9ffcf4-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6585de50e32532a74abf20908a5c1a3e-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0ea2a30bd73c50f444cf919c2a467aaa-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/16163c8177474f8b77fc2e7631587f57-500x500.jpg', 68);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(2)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(3)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(4)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(5)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(6)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/AX1077%Black%(1)-500x500.jpg', 69);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5bb6fde0ace07364eda404e09b8dfc0d-500x500.jpg', 70);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5d64b16f62697999c6ac233798bc159e-500x500.jpg', 70);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/cd523c7a3dfa99ee880a2d5ee3750dca-500x500.jpg', 70);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7362b8001b9c36e7defce789b241be18-500x500.jpg', 70);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/88b212902895bd6f1f790ed76a2ff1d8-500x500.jpg', 70);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/blu-c6%AZUL-500x500.jpg', 71);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/BLU-C6L-AZUL-500x500.jpg', 71);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/BLU-C6L-BLUE-500x500.jpg', 71);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL10%1-500x500.jpg', 72);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL10%2-500x500.jpg', 72);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL10%3-500x500.jpg', 72);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL10%4-500x500.jpg', 72);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/636eed3d690b997691119f5c8ea914ba-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5d2ff0b3c5c3d06999f8fb16f021a6e2-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a722b60e829dbe0ab962aeab2ecaab08-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d9496c0500d0d7d9afbc60f4c6f77505-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7a9aa197ad56bc87b5233eda797e869b-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1e1f099ad345108dde3d1457d97cbf00-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c301cb2f6e9821271134037a7f899d67-500x500.jpg', 73);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e1342b5a582101b9816df1d9b5766597-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/08c506ba550c0ff5261fde115b86e631-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/40daa06557c903d8f5503cbec9748c6c-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f9e0910e64b0f0fea7f6342a91f7d54a-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/72c7acc9e603fe64f5845aca364465e2-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/454437a4fe020e8b77627be9bc38f3dc-500x500.jpg', 74);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a9f4e69df00c27dd058c64b4c55ec47a-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1de58660c52087ebcb3cc990dccda348-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e9293a9b043bc64a0c5eada9d6ea5971-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5760aefcdf3bd77bf9b51e8b52e1cbb3-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a7c57e3dc736e579247ee0532cc35501-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/582908f757093421843c923e99542e2b-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0b012394efdb2c02a9b5ac0e32808803-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3b02cdcafdaac9c889510ded7c72326b-500x500.jpg', 75);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/44f042b84fed2a595bb1df937d436103-500x500.jpg', 76);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c3dc90df6d50a8c341f4d7b9c5d3a228-500x500.jpg', 76);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f0410b48f86da07071c2eb4a8b5b783b-500x500.jpg', 76);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/6266d0416d3e43014f3087a62ff6cbf6-500x500.jpg', 76);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e4332403fb5114c7011dd2a26b68e48f-500x500.jpg', 77);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3b9f391d60f7ac6722d7469d51e21648-500x500.jpg', 77);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b6fc89939fe9f66b421ead18cd38bb73-500x500.jpg', 77);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/7f4a14afa4c63f015c76e7dbdeb96c4d-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/97c0ffb5499aa6997b18837cf7f3ea39-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/65d7c26aac661a6b066ac8563929d857-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/5f9878de2c31552531d374f7d36cc07a-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c8563a5ed4289f8fba6f0a7615b1a921-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/012dee6c3cca81ac29f5851ca49fd50f-500x500.jpg', 78);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e0c8aeb1bbbfc91d77d23c12dcd830d8-500x500.jpg', 79);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3822e18395ec028cd80e57d4c6b4fc7a-500x500.jpg', 79);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/02a7714dd7909dcf52ddc53dc81965e3-500x500.jpg', 79);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a346f33601a7877a38eb6080f434050a-500x500.jpg', 79);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b2152ab37131cfa9b74d5b2ceb083a36-500x500.jpg', 80);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c8f60a2dc4cf01c2b15665c654a6f581-500x500.jpg', 80);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/e5ff464d2f7ad774d3a36578cc4da277-500x500.jpg', 80);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/fc3cd5c098dd1663fa8db59c742085f2-500x500.jpg', 80);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1f7039ff9c863599129551b5bfc762be-500x500.jpg', 80);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/0000002222-tablet-500x500.jpg', 81);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/2797b22aee04e80468c3339d1f94f58d-500x500.jpg', 82);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1b3ae1ca8d2e2e3fc077d6ff0845fbc1-500x500.jpg', 82);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/16b5fe7ca48ae5c0b7c350aca111c9dd-500x500.jpg', 82);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/34b3b8d119fc0f7d3484b9059d76af27-500x500.jpg', 82);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a1fd7d35da0a1d7aff3e16f4e6641f23-500x500.jpg', 83);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/92f748d65c214944bc9fc998d1ff192e-500x500.jpg', 83);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/644902784115300c0ecbc25262bb700a-500x500.jpg', 83);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL%1-500x500.jpg', 84);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL%2-500x500.jpg', 84);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/TAB-HYUNDAI-KORAL%3-500x500.jpg', 84);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1665aacaa8ed207395c3cb6e4a1f8b8e-500x500.jpg', 85);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/cf32ede0d478f387829423ceaa3a4187-500x500.jpg', 85);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a8c991455aa2592265577a75dea2d852-500x500.jpg', 85);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1c668e0f6e6cd98ec7be5eb33c021665-500x500.jpg', 85);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/09b2ccffae757ef06e45b4496f3395c8-500x500.jpg', 86);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c3d9ceed76f1e6d7db4262af8fcd82b7-500x500.jpg', 86);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/a64f61760f9760144910011dfa093a5d-500x500.jpg', 86);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1894084f7c4684f32f203ccba3cdec51-500x500.jpg', 86);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/abe3476a1d777ea4098bba64e8b22ae7-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/33e662b072f992bf718d67f2a7f0a171-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/4c80799b77cd27a82d0f64a915d36bea-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ce350b26a6fd50f8fd44e68f68e94e1a-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d39c28850a6b95218cfa3a28bf0ea1af-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/3296362f15340a68d35b33b0571a3445-500x500.jpg', 87);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/1ea6e0833150d325c9043e01cf6d2e9b-500x500.jpg', 88);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/d660e379ccc142e6c4cbe4e58ac14930-500x500.jpg', 88);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/b0694b50fe50e6b1ad2f1bb9eaa893d9-500x500.jpg', 88);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/68c2cee18669be6bf5ed7db218afb744-500x500.jpg', 88);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/ea11b5a1ec8c856b17b89315275df8dc-500x500.jpg', 88);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/galaxy%tab-500x500.jpg', 89);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/f3768571b6da0ef3671dd3d442028ea5-500x500.jpg', 90);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/c837ee1c53fe8f0d7e5932dab54daae8-500x500.jpg', 90);
          

--           INSERT INTO IMAGEN (enlace_imagen, fk_articulo) VALUES
--           ('/media/9badc85e1f201295f875d0271de09f2f-500x500.jpg', 90);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 
-- /*Inserts en la tabla USUARIO*/
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Dolan Hammond","semper@velitegetlaoreet.org","09 73 02 72 42","Apdo.:255-7786 Leo. Avda.",1,"YFA98UYF2HW"),("Quynn Chambers","molestie.sodales@pretiumnequeMorbi.ca","08 99 89 63 42","7244 Sagittis C/",1,"HRB41NVQ9GO"),("Octavius Rhodes","Quisque.tincidunt.pede@aliquetnec.edu","05 36 67 82 40","Apdo.:463-9336 Arcu Avda.",1,"CBF23WQI0TL"),("Hilel Frye","Aenean.eget.metus@Sed.co.uk","01 42 33 66 34","506-2640 Mi Ctra.",1,"HNL07CIL8FZ"),("Tasha Goff","metus.eu.erat@magnamalesuada.edu","04 98 96 36 71","Apartado núm.: 798, 7133 Ultrices. C.",1,"NCP51CEK2GW"),("Rebekah Brennan","morbi.tristique@penatibusetmagnis.co.uk","05 85 55 06 08","Apdo.:856-7450 Dolor ",1,"UUT66VIE2SD"),("MacKenzie Patrick","justo.faucibus@placerat.org","09 11 41 35 64","Apartado núm.: 312, 2224 Nec, Avda.",1,"UFL91SOD6AK"),("Abdul Gilbert","enim.nisl@justofaucibuslectus.co.uk","09 11 63 65 05","722-9203 Vulputate, C.",1,"WVI22KFX3CK"),("Rudyard Carver","lectus.Cum.sociis@tincidunt.com","02 04 54 15 42","Apdo.:715-9264 Et C/",1,"YSY08RWZ6FF"),("Carolyn Wells","rutrum@duiSuspendisse.com","02 58 42 18 00","1307 Interdum. Av.",1,"BIB70KVE9AN");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Shoshana Cooper","Aenean.massa.Integer@malesuada.org","01 94 81 27 99","Apartado núm.: 143, 9449 Ante Ctra.",1,"TWI17CFG2YS"),("Otto Snider","posuere.cubilia@id.com","04 49 29 63 53","362-3355 Aliquet Ctra.",1,"ZFR53WWO1ON"),("Chase Maynard","molestie.sodales@enimgravidasit.ca","01 93 45 79 79","Apartado núm.: 395, 7597 In Avenida",1,"XKG72QOD0ZO"),("Cora Fernandez","vitae.diam@sagittis.org","02 69 15 62 36","Apartado núm.: 601, 318 Eu Avda.",1,"VII90RLK4PF"),("Jayme Bowen","lectus@arcuVestibulumut.com","03 65 12 40 53","9267 Facilisis C/",1,"QZC75PKG2TU"),("Kiara Roy","erat.neque.non@Naminterdum.net","09 08 44 86 27","Apartado núm.: 529, 149 Ultrices. C.",1,"YEU49XOS7XW"),("Galena Hart","imperdiet.dictum@sapienAeneanmassa.co.uk","02 94 79 48 19","244-1795 Phasellus Av.",1,"GJH77JUM2OD"),("Vanna Fitzpatrick","ut.quam.vel@magnisdisparturient.ca","02 06 94 24 08","7367 Fringilla Av.",1,"JKL18RUR1JD"),("Gregory Quinn","Mauris@diamvelarcu.ca","07 08 62 42 77","5043 Tortor. Ctra.",1,"HCY42HMP1XL"),("Brenden Oneal","Lorem.ipsum@in.edu","03 09 73 28 92","1483 Amet, Av.",1,"GXJ02IJQ9YZ");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Rigel Farley","ac.turpis.egestas@in.net","04 36 58 70 57","Apartado núm.: 304, 3906 Adipiscing ",1,"ZTN57NDB7YY"),("Adam Meyer","magna.et.ipsum@malesuadamalesuadaInteger.net","04 55 23 60 79","3257 Ultricies ",1,"ANM21QGN5NK"),("Abraham Maddox","cubilia.Curae.Donec@tempor.edu","05 27 18 73 19","249-6494 Nibh. Carretera",1,"UZJ68QVC2XQ"),("Eugenia Lewis","iaculis.quis@semper.co.uk","09 66 44 78 95","402-2927 Lacinia C/",1,"PYO16CSS5VJ"),("Nell Terry","metus.facilisis@etpedeNunc.edu","03 57 99 60 70","Apartado núm.: 927, 6445 Scelerisque Carretera",1,"PIA54JPO1NC"),("Chancellor Lowery","diam.Sed.diam@tincidunt.org","05 52 37 07 55","572-1509 Diam ",1,"SMX17CLY7VY"),("Alice Oneill","egestas.hendrerit@risusquis.co.uk","08 70 04 09 41","Apartado núm.: 997, 4550 Lectus Ctra.",1,"WVN28QHU3TF"),("Cameron Wagner","enim.Etiam@gravida.ca","09 70 40 80 09","845-5943 Velit. C.",1,"ABF62ICT4XB"),("Sasha Obrien","dolor@turpisAliquamadipiscing.ca","02 04 59 36 94","545-1268 Dapibus ",1,"QPI98RJI6QM"),("Hakeem Fuentes","ligula@duiFusce.net","02 86 42 72 93","5964 Ipsum. Calle",1,"EOB78LKV4XO");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Anne Ortiz","hendrerit.neque.In@Suspendisse.com","09 37 82 46 07","Apartado núm.: 191, 9347 Non, Ctra.",1,"GIW71IPR1VP"),("Neve Good","et@euaugue.org","01 40 12 41 21","Apartado núm.: 591, 927 Interdum Ctra.",1,"JMW49MGC7RH"),("Murphy Baxter","nisi.Mauris@amagna.edu","01 62 66 35 17","Apdo.:115-6863 Faucibus C.",1,"AAW22SMY7SI"),("Emi Poole","mus@eleifendnecmalesuada.ca","01 13 34 94 35","Apartado núm.: 614, 7052 Ut Carretera",1,"UMF53FNS0VG"),("Chaim Cline","velit@anteiaculis.org","03 17 81 29 56","890-1589 Ultricies Avda.",1,"LFJ77VNU2RX"),("Kadeem Powers","Proin@tinciduntvehicularisus.net","06 54 97 05 90","910 Nec Av.",1,"EXW33MFX0EF"),("Jessamine Stanley","Nullam.feugiat@semmolestiesodales.com","07 81 38 14 84","Apdo.:449-2516 Ipsum Calle",1,"VRE40VWQ2TV"),("Kalia Griffith","luctus.Curabitur.egestas@eleifend.org","07 12 17 99 94","892-6893 Auctor Avda.",1,"GMC30AWI6HI"),("James Callahan","et@neque.com","04 65 64 85 87","Apdo.:611-2927 Phasellus Carretera",1,"KJK85DHW1JM"),("Bo Miranda","vehicula.et@sapien.co.uk","01 06 86 64 56","Apdo.:874-4459 In Calle",1,"JWK88RJT0DA");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Kyra Schwartz","Ut.tincidunt.orci@Proinnonmassa.org","02 63 46 77 60","Apartado núm.: 111, 552 Dui, C.",1,"DKM81VLB6OB"),("Harrison Caldwell","augue.id.ante@ligula.com","02 77 64 38 11","1052 Cum C/",1,"OTJ00LTN9AR"),("Leigh Estrada","hendrerit.a.arcu@quis.net","02 99 40 69 69","Apartado núm.: 922, 7881 Nostra, Avenida",1,"FDM97SOR1TW"),("Emerald Massey","dolor.egestas@perconubianostra.edu","02 61 78 40 10","3547 Orci Carretera",1,"VOH13VUC5BC"),("Wyoming Buckner","adipiscing@tortorat.co.uk","09 01 81 61 46","817-7707 Cras Carretera",1,"GID29SJY9FU"),("Kasper Williams","id@aliquet.net","02 23 47 99 59","Apdo.:509-9462 Hendrerit Ctra.",1,"DLK66MIA9TG"),("Marah Dalton","Nam.interdum.enim@semperduilectus.org","02 47 35 47 08","Apartado núm.: 908, 6788 Iaculis C.",1,"PGZ73TYG5LB"),("Cedric Moody","faucibus@facilisis.ca","01 52 66 09 27","9992 Et Avenida",1,"GSS52DNA5FP"),("Rylee Morton","nec@egestashendrerit.co.uk","07 74 25 67 64","Apartado núm.: 474, 990 Vitae Avda.",1,"HZH32TQF3MN"),("Ima Powell","semper.dui@nibh.com","08 33 43 65 39","841-6323 Pellentesque Avda.",1,"XTL95HAJ8JX");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Mannix Lang","Duis.sit.amet@Vivamus.com","04 82 71 03 84","Apdo.:324-9196 Sed Calle",1,"KDV73HHC1EI"),("Neve Kaufman","Donec@primisin.co.uk","04 55 23 37 14","Apartado núm.: 578, 4011 Suspendisse Av.",1,"HPT90YSA2GW"),("Len Morgan","pellentesque@per.edu","06 89 70 39 22","Apartado núm.: 877, 6840 Pulvinar Calle",1,"ZTT50NEL0AZ"),("Adam Stevenson","ligula.eu.enim@Vivamus.ca","01 37 92 13 33","Apdo.:139-5724 Donec Av.",1,"MTV30RIY2LQ"),("Kimberley Crosby","blandit.at@nulla.com","08 89 05 90 27","914-8788 Libero. C.",1,"DME93LCX6PU"),("Hayes Knox","sodales.at@disparturientmontes.edu","02 90 90 46 72","449-9307 Mauris Carretera",1,"YCB03TLJ6ZW"),("Nelle Blevins","Fusce.mi@temporarcuVestibulum.net","01 82 31 46 43","Apdo.:728-8483 Nec, Carretera",1,"KQU61CYS4PH"),("Adrienne Carr","ornare.egestas@sapien.com","05 33 38 48 49","Apdo.:248-231 Non, Calle",1,"QGI81LGK0OT"),("Erich Head","Aliquam.fringilla@nibhsit.ca","08 03 62 62 97","5381 Amet ",1,"VCK42VGN0VQ"),("Colby Benson","in.consequat@eratinconsectetuer.com","05 63 68 27 42","296-2489 Lorem C/",1,"TIP88INO9WC");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Fiona Holland","dignissim@iaculis.edu","05 21 36 61 11","450-7645 Sed Calle",1,"MOF20IBA4OF"),("Rowan Rosa","sit.amet@vitaeodio.com","06 86 89 46 54","Apartado núm.: 196, 1881 Mauris C/",1,"AGY51NPT9CO"),("Lois Moon","condimentum@rutrumeuultrices.com","06 52 34 61 10","941-1259 Odio ",1,"DFR76IPA6BG"),("Madaline Yates","scelerisque.lorem.ipsum@maurisid.edu","05 77 23 32 71","Apdo.:770-618 Ipsum Ctra.",1,"YDC19BSA5GL"),("Xavier Nieves","sapien@loremipsumsodales.com","09 39 28 26 48","7325 Magnis Av.",1,"MZW83FHV7TJ"),("Chava Townsend","velit.dui.semper@arcu.org","05 14 79 42 71","Apdo.:941-9989 Justo Avda.",1,"NPV54ZNW3CK"),("Erin Sparks","tempor.est@egestasnuncsed.edu","06 81 31 35 67","Apartado núm.: 349, 5465 Elementum, Av.",1,"ACZ15NXJ1WA"),("Deanna Mercado","vestibulum.nec.euismod@lectusrutrumurna.net","09 09 24 21 04","Apdo.:634-3845 Enim Carretera",1,"XXN53TUI0AL"),("Linda Stone","Nam.ac.nulla@nonfeugiatnec.ca","07 62 09 35 51","5885 Quis, C/",1,"YQJ55DNN8PH"),("Josephine Barber","morbi.tristique@Maecenasornareegestas.net","01 98 86 29 27","Apdo.:602-9822 Tincidunt Carretera",1,"QYJ37PPA4BQ");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Tasha Pate","vitae.nibh.Donec@pharetrased.com","04 96 01 28 80","Apdo.:570-9102 Et Carretera",1,"HJB95SNE9DP"),("Trevor Richardson","mauris@ipsumdolor.ca","03 27 90 73 98","198-4439 Pede, Ctra.",1,"ZGH26FPA6SR"),("Norman Warner","fermentum.fermentum@orci.edu","01 98 25 04 87","536-5357 Lacus. Avda.",1,"UKO90MYP4TU"),("Odysseus Lane","ante.Vivamus@purusaccumsaninterdum.org","03 62 09 59 77","6162 Auctor ",1,"URQ36UAU8LJ"),("Renee Medina","lectus@velarcu.ca","03 51 91 54 56","Apdo.:972-4729 Imperdiet C.",1,"YLG42ZAT4UK"),("Caldwell Castaneda","Fusce.mi@vellectusCum.com","07 01 89 64 75","742-3637 Viverra. C/",1,"OXD36AOM6KO"),("Norman Bright","mollis.Integer@tristiquealiquet.com","09 54 94 45 77","Apartado núm.: 626, 4629 Leo. Ctra.",1,"KQY33PFI0QY"),("Connor Figueroa","inceptos.hymenaeos.Mauris@atfringillapurus.net","09 29 93 43 17","Apdo.:372-8419 Erat Ctra.",1,"VQM02BQP2FP"),("Xerxes Patterson","enim.Etiam.gravida@semper.com","09 47 30 34 29","7101 At Carretera",1,"LPK24SXU5CA"),("Avye Shields","Nullam.lobortis.quam@Nullam.edu","04 00 16 24 73","Apartado núm.: 960, 6591 Pede. Calle",1,"VGE25FJG7GK");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Paul Cleveland","lectus.justo@dictummagnaUt.ca","01 92 51 80 79","Apdo.:491-2855 Quam. C.",1,"KXD91NLL3AE"),("Sierra Luna","ante.lectus.convallis@esttempor.ca","02 55 62 79 20","4415 Sed C.",1,"CIR61YCS5YD"),("Jordan Dickson","turpis.Aliquam@tellusNunclectus.net","02 55 33 55 88","5740 Vivamus Av.",1,"MCQ01RIZ3US"),("Chase Mccullough","a@at.edu","05 87 84 45 47","Apartado núm.: 500, 1063 Leo C/",1,"YCE26SEI8WB"),("Kameko Dyer","ac@suscipitestac.ca","04 54 28 89 67","9727 Mauris Carretera",1,"KVA11TPK7AK"),("Laura Henson","facilisis@dictum.net","02 23 36 42 55","Apdo.:748-1499 Nibh. ",1,"DTE62LVJ7LY"),("Quintessa Middleton","non@at.net","03 70 58 79 73","Apartado núm.: 636, 1700 Senectus Avda.",1,"VAN14MRO6WH"),("Keith Bird","Mauris@nonhendrerit.org","06 94 20 68 63","348-7321 Lacus. Avenida",1,"BGI54SYY7IR"),("Marny Alvarez","euismod.urna.Nullam@eleifend.org","08 99 48 45 74","703-3426 Nec, Avda.",1,"RPM80ZLG9LV"),("Yuri Wilder","quis.lectus.Nullam@dolor.net","06 37 15 03 24","Apartado núm.: 679, 2602 Ante. Calle",1,"NEI46TCZ4LM");
-- INSERT INTO USUARIO (nombre_completo,correo,telefono,direccion,estado,contrasenia) VALUES ("Bo Travis","adipiscing.ligula.Aenean@velmaurisInteger.ca","09 74 29 59 55","377 Ullamcorper Avda.",1,"OGH96BCZ8UQ"),("Stone Bryan","pede@Nullaeget.net","01 20 43 66 51","272-6664 Phasellus Avda.",1,"PEH68PEI1ZN"),("Karly Sullivan","at@scelerisque.edu","02 21 15 40 97","9322 Felis. Carretera",1,"TWC45ULO3TT"),("Orla Cummings","malesuada.fames.ac@euneque.com","03 46 46 66 66","Apartado núm.: 237, 5456 Tincidunt Avenida",1,"HLY23VES8MU"),("Aurelia Fox","Aliquam.nisl.Nulla@consectetuer.net","02 17 61 28 38","1256 Curabitur ",1,"TIN43JPO4UE"),("Brynn Stein","euismod.in.dolor@odioAliquam.net","02 95 91 27 08","Apartado núm.: 704, 2213 Ultrices ",1,"RCY70RSI2NB"),("Kibo Chambers","et.rutrum@ipsum.org","07 31 28 00 15","5954 Tortor C/",1,"WLM06OOD9XF"),("Jolie Oneil","amet.ultricies.sem@turpis.edu","01 22 67 22 14","Apartado núm.: 881, 2467 At Ctra.",1,"FQT84TQD5RY"),("Yolanda Mueller","lacinia.at.iaculis@nuncullamcorpereu.org","06 81 37 68 18","1488 Tempus Avenida",1,"VWC98HTW8KC"),("Raven Mathews","sollicitudin.commodo@ligula.edu","02 27 00 49 24","Apdo.:855-2759 Tempus Av.",1,"EKX02MIS4IP");

-- /*Inserts en la tabla ARTICULO*/
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Castor Charles",68569,"Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris",1,NOW(),17,12,92,4,70),("Forrest Ewing",81781,"rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus",1,NOW(),14,16,79,4,51),("Forrest Moody",78384,"gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et",1,NOW(),6,18,15,8,98),("Chancellor Newton",40231,"sit amet ornare lectus justo eu arcu. Morbi sit amet massa.",1,NOW(),4,8,55,4,99),("Travis Conley",99502,"ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce",1,NOW(),18,2,6,10,4),("Gregory Harris",35505,"in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae",1,NOW(),16,38,32,10,64),("Davis Guy",81857,"Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.",1,NOW(),15,26,82,10,35),("Caldwell Mcfadden",17732,"bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.",1,NOW(),10,19,12,2,22),("Barry Gordon",74130,"ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis",1,NOW(),14,2,12,4,84),("Keaton Abbott",98953,"fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.",1,NOW(),6,30,45,1,45);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Kareem Mcpherson",21203,"hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris",1,NOW(),6,15,85,4,70),("Upton Santos",18540,"Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris",1,NOW(),9,25,21,5,51),("Colt Craig",32380,"lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque",1,NOW(),16,29,51,6,20),("Bernard Martinez",22937,"Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu",1,NOW(),15,4,51,1,91),("Shad Osborn",56747,"dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae",1,NOW(),1,5,54,6,16),("John Ashley",5308,"aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis",1,NOW(),15,9,87,1,40),("Jakeem Lewis",59427,"vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean",1,NOW(),15,31,76,7,35),("Dane Glover",39990,"posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum",1,NOW(),1,15,39,3,104),("Xavier Osborne",2890,"Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor",1,NOW(),16,41,87,7,58),("Elijah Martin",74842,"at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia",1,NOW(),8,36,23,6,3);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Melvin Small",46603,"Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu.",1,NOW(),13,20,89,10,91),("Wylie Patterson",43946,"Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus.",1,NOW(),14,4,88,1,99),("Lance Manning",11919,"Sed neque. Sed eget lacus. Mauris non dui nec urna",1,NOW(),14,24,33,9,45),("Callum Becker",69058,"nulla magna, malesuada vel, convallis in, cursus et, eros. Proin",1,NOW(),12,5,29,1,64),("Caleb Tran",37970,"sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis",1,NOW(),7,22,85,6,20),("Fritz Faulkner",41829,"cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt",1,NOW(),15,1,35,6,55),("Branden Matthews",27523,"dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis",1,NOW(),16,9,44,7,48),("Marvin Michael",31865,"scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis",1,NOW(),5,18,43,4,66),("Cody Nieves",33812,"libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus",1,NOW(),14,29,60,1,31),("Hop Kirkland",30074,"elit elit fermentum risus, at fringilla purus mauris a nunc.",1,NOW(),14,13,48,2,58);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Zachery Whitfield",16949,"turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a",1,NOW(),15,3,32,7,58),("Elvis Mccall",29237,"arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa.",1,NOW(),11,5,2,4,92),("Carlos Ryan",42243,"pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat",1,NOW(),17,37,80,9,19),("Anthony Klein",99350,"lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum.",1,NOW(),9,16,80,7,1),("Clayton Snow",83507,"lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc",1,NOW(),14,35,62,6,11),("Flynn Maldonado",31764,"aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.",1,NOW(),8,7,9,3,41),("Nicholas Strong",36693,"Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem",1,NOW(),10,18,1,7,1),("Elvis Farmer",37941,"turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer",1,NOW(),15,26,36,9,12),("Dexter Washington",80402,"lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit",1,NOW(),15,17,31,2,26),("Kareem Stuart",47357,"Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu,",1,NOW(),3,24,16,1,57);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Reece Bentley",77069,"egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget",1,NOW(),3,29,28,6,6),("Clinton Cardenas",62980,"Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet",1,NOW(),3,34,20,4,9),("August Stuart",53852,"quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient",1,NOW(),9,22,89,1,40),("Abdul Puckett",80842,"habitant morbi tristique senectus et netus et malesuada fames ac",1,NOW(),2,15,99,8,28),("Ciaran Stevenson",2116,"massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,",1,NOW(),10,16,16,5,59),("Yoshio Knox",86043,"turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,",1,NOW(),3,27,20,8,104),("Lev Nicholson",53124,"sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,",1,NOW(),14,10,87,4,74),("Marsden Odonnell",82643,"semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices",1,NOW(),13,14,3,5,17),("Dale Oneal",97006,"odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit",1,NOW(),11,5,85,6,105),("Alfonso Schroeder",24628,"mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet",1,NOW(),4,28,9,7,104);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Harrison Jensen",96211,"lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque",1,NOW(),15,30,17,7,9),("Vincent Stokes",89831,"Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est",1,NOW(),2,26,69,9,63),("Leo Stokes",77086,"lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan",1,NOW(),4,32,90,6,70),("Evan Ingram",10,"nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet",1,NOW(),10,20,3,2,19),("Vance Douglas",95254,"Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad",1,NOW(),8,39,62,8,19),("William Blair",37971,"rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer",1,NOW(),12,31,59,6,58),("Isaac Glass",34366,"justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,",1,NOW(),11,33,9,2,14),("Dominic James",90926,"ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer",1,NOW(),6,22,97,7,40),("Thomas Duffy",66339,"Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.",1,NOW(),12,36,39,5,75),("Eric Mclaughlin",41608,"quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.",1,NOW(),17,12,97,2,104);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Macaulay Gibbs",29795,"ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.",1,NOW(),8,23,71,6,36),("Seth Emerson",42626,"ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.",1,NOW(),8,37,77,6,106),("Kato Cooke",40089,"elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum",1,NOW(),10,26,57,2,39),("Wallace Berry",41200,"mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula.",1,NOW(),4,28,15,8,68),("Fuller Barton",81993,"mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec",1,NOW(),7,31,61,10,36),("Grady Watson",48888,"risus quis diam luctus lobortis. Class aptent taciti sociosqu ad",1,NOW(),15,9,76,1,79),("Buckminster Olson",22979,"a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,",1,NOW(),18,33,71,2,66),("Quinlan Black",36052,"Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo,",1,NOW(),3,38,84,6,96),("Addison Strickland",35526,"vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh",1,NOW(),6,20,90,8,58),("Fuller Swanson",49696,"ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec",1,NOW(),18,39,42,5,88);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Dillon Howard",97240,"sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum",1,NOW(),7,12,54,10,55),("Finn Randall",32047,"Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.",1,NOW(),17,14,72,6,35),("Steel Olsen",30346,"ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat",1,NOW(),6,40,61,6,60),("Lev Chandler",15359,"mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris",1,NOW(),3,4,81,10,8),("Abbot Zimmerman",91207,"venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",1,NOW(),1,4,20,4,28),("Cullen Calhoun",14171,"neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada",1,NOW(),9,4,16,10,37),("Ryder Vincent",37299,"fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices",1,NOW(),8,5,96,9,85),("Xander Pickett",90649,"Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique",1,NOW(),15,35,25,10,36),("Reed Lawson",37105,"porta elit, a feugiat tellus lorem eu metus. In lorem.",1,NOW(),15,29,94,9,94),("Dolan Cruz",47557,"Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac",1,NOW(),10,2,1,2,83);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Dexter Alford",84612,"ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet",1,NOW(),4,25,52,9,92),("Forrest Harris",57736,"risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis",1,NOW(),9,37,4,10,51),("Garrett Garza",44690,"cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam",1,NOW(),6,14,59,9,52),("Addison Delaney",10764,"enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor",1,NOW(),2,13,68,1,38),("Vaughan Edwards",6835,"congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id",1,NOW(),9,31,79,8,62),("Drake Jones",70040,"mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum",1,NOW(),10,28,3,9,40),("Aristotle Albert",96111,"lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,",1,NOW(),2,9,59,5,62),("Vincent Pierce",40690,"sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices",1,NOW(),2,8,60,8,56),("Kennan Shepard",83241,"adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis",1,NOW(),7,9,29,6,95),("George Snider",29180,"magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis",1,NOW(),8,15,32,10,57);
-- INSERT INTO ARTICULO (nombre,precio,descripcion,publicado,fecha_publicacion,fk_departamento,fk_municipio,cantidad_disponible,fk_categoria,fk_usuario) VALUES ("Avram Griffith",71846,"at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare",1,NOW(),8,25,97,4,78),("Tobias Valdez",84001,"Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque",1,NOW(),8,39,19,1,14),("Curran Puckett",46626,"natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec",1,NOW(),17,36,88,7,75),("Carson Mcdonald",31568,"Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,",1,NOW(),6,14,96,6,39),("Bruno Ramos",62652,"euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed",1,NOW(),7,24,7,4,37),("Jameson Aguirre",37840,"diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,",1,NOW(),8,16,61,3,94),("Dean Mcleod",74492,"rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id,",1,NOW(),3,21,34,7,32),("Jacob Branch",60486,"vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem",1,NOW(),5,40,41,4,9),("Hector Landry",68899,"a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut",1,NOW(),16,3,30,2,18),("Jack Benton",95346,"ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet",1,NOW(),2,2,2,1,82);

-- /*Inserts en la tabla SUSCRIPCION*/
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (67,9),(78,7),(90,8),(73,8),(34,7),(30,10),(66,7),(38,2),(36,9),(68,2);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (69,3),(22,1),(101,8),(22,6),(78,8),(106,10),(94,7),(104,5),(29,9),(43,4);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (95,10),(73,10),(82,4),(22,5),(73,3),(101,10),(93,3),(8,1),(51,7),(100,3);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (86,9),(9,3),(70,6),(37,8),(84,9),(70,1),(69,3),(102,8),(57,1),(11,7);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (96,1),(16,7),(4,6),(11,6),(20,6),(54,2),(14,8),(57,3),(104,7),(26,6);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (42,5),(66,3),(2,6),(11,7),(19,8),(39,5),(4,2),(6,5),(67,9),(84,2);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (91,8),(105,10),(4,9),(39,9),(2,9),(64,3),(59,9),(10,6),(23,8),(80,2);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (24,6),(17,2),(4,2),(8,9),(85,8),(3,4),(85,8),(106,4),(69,8),(83,1);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (82,3),(98,3),(50,1),(36,8),(99,8),(102,7),(19,1),(22,8),(36,6),(91,10);
-- INSERT INTO SUSCRIPCION (fk_usuario,fk_categoria) VALUES (44,6),(95,10),(74,1),(35,2),(39,4),(85,6),(84,1),(65,7),(6,6),(34,1);

-- /*INSERTS en la tabla CALIFICACION*/
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (2,29,84),(3,28,96),(1,45,14),(2,27,90),(5,106,46),(3,22,30),(4,91,82),(1,6,50),(1,35,14),(2,60,5);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (5,42,13),(2,76,104),(5,99,22),(3,47,27),(4,73,20),(1,45,19),(1,27,6),(5,8,76),(2,8,93),(4,67,77);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (2,57,84),(2,2,29),(2,11,60),(1,17,5),(5,90,90),(3,35,67),(2,41,86),(2,96,75),(4,28,106),(2,18,57);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (3,60,69),(5,34,87),(3,16,93),(4,38,65),(4,32,80),(4,54,11),(3,94,35),(3,87,61),(5,11,60),(5,8,66);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (5,91,34),(3,44,63),(1,71,81),(5,93,46),(3,33,47),(2,94,36),(5,31,21),(4,46,11),(4,6,60),(5,31,29);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (2,47,39),(3,60,82),(1,76,29),(5,61,100),(5,25,24),(4,66,94),(3,95,23),(5,19,105),(4,31,1),(5,11,1);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (4,63,20),(4,88,49),(5,40,85),(3,2,63),(3,24,72),(5,71,9),(3,3,8),(5,82,104),(2,42,20),(3,88,61);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (4,33,15),(1,22,36),(5,106,45),(4,8,57),(5,104,12),(3,28,89),(4,45,97),(1,98,104),(3,27,22),(1,93,93);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (4,73,15),(5,64,93),(5,38,67),(5,11,55),(5,72,59),(5,37,42),(1,7,61),(5,96,55),(3,17,70),(2,9,14);
-- INSERT INTO CALIFICACION (calificacion,fk_usuarioCalificador,fk_usuarioCalificado) VALUES (3,106,32),(1,64,40),(1,52,31),(5,35,65),(4,37,71),(2,51,35),(1,48,31),(4,52,50),(2,16,26),(3,22,25);

-- /*Inserts en la tabla DENUNCIA*/
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (48,85),(97,39),(14,36),(82,16),(55,32),(39,31),(36,25),(22,93),(38,105),(26,6);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (22,10),(13,2),(80,70),(41,6),(85,76),(54,58),(106,96),(82,32),(27,102),(98,104);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (51,13),(96,37),(67,37),(34,35),(33,98),(58,105),(90,25),(59,58),(42,14),(51,101);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (82,105),(37,7),(75,59),(19,58),(73,17),(21,7),(36,104),(61,103),(78,25),(11,17);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (74,69),(77,37),(100,1),(3,74),(73,24),(78,24),(23,82),(102,17),(96,10),(68,21);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (17,102),(104,74),(102,81),(53,64),(52,77),(103,76),(28,22),(14,95),(79,74),(106,88);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (28,11),(45,31),(11,106),(87,33),(26,57),(104,96),(103,98),(101,42),(10,13),(86,90);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (22,50),(74,103),(12,54),(62,104),(101,33),(99,76),(16,15),(77,30),(99,95),(36,60);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (98,90),(7,55),(105,82),(50,46),(88,23),(56,18),(24,55),(106,28),(23,6),(71,69);
-- INSERT INTO DENUNCIA (fk_usuarioDenunciador,fk_usuarioDenunciado) VALUES (65,49),(99,77),(74,70),(79,28),(12,22),(3,65),(11,87),(35,25),(8,102),(2,88);

-- /*Inserts en la tabla FAVORITO*/
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (83,84),(64,63),(103,11),(58,106),(105,63),(51,29),(36,105),(73,54),(100,74),(70,92);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (31,64),(49,105),(5,57),(49,99),(23,59),(91,51),(92,87),(38,101),(36,47),(92,100);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (90,55),(39,41),(56,54),(97,72),(14,13),(64,30),(104,15),(60,92),(61,44),(104,83);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (104,99),(83,43),(20,40),(106,28),(18,57),(21,73),(89,105),(11,7),(16,74),(54,59);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (89,1),(6,74),(79,62),(93,23),(93,97),(100,41),(81,104),(86,11),(94,85),(11,101);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (39,110),(104,78),(94,73),(81,79),(21,40),(56,86),(50,102),(103,42),(86,67),(25,71);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (14,14),(33,29),(72,60),(13,87),(99,32),(46,18),(100,53),(16,45),(61,110),(66,68);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (57,64),(80,90),(60,75),(52,4),(103,23),(60,108),(72,93),(24,73),(52,76),(7,3);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (12,26),(82,47),(104,97),(68,14),(106,28),(104,79),(56,47),(99,86),(90,108),(105,19);
-- INSERT INTO FAVORITO (fk_usuario,fk_articulo) VALUES (84,2),(76,78),(92,8),(75,21),(99,91),(97,93),(30,56),(18,63),(50,56),(32,7);

-- /*Inserts en la tabla COMENTARIO*/
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Articulo","leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor",66,41),("Denuncia","sit amet nulla. Donec non justo. Proin non massa non ante",92,101),("Denuncia","Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae",17,27),("Usuario","vitae sodales nisi magna sed dui. Fusce aliquam, enim nec",27,33),("Usuario","ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,",84,95),("Usuario","quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In",65,59),("Denuncia","Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc",70,104),("Articulo","placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna",33,48),("Denuncia","amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh.",47,44),("Denuncia","enim diam vel arcu. Curabitur ut odio vel est tempor",47,24);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Articulo","sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.",51,28),("Usuario","sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras",28,27),("Articulo","blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae",99,11),("Denuncia","auctor, nunc nulla vulputate dui, nec tempus mauris erat eget",79,101),("Denuncia","semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In",58,13),("Denuncia","quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam",82,43),("Articulo","metus urna convallis erat, eget tincidunt dui augue eu tellus.",61,102),("Articulo","lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum",41,62),("Denuncia","lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue,",15,48),("Articulo","est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed",21,71);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Articulo","ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus",16,83),("Denuncia","scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae,",46,52),("Usuario","eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus",27,29),("Articulo","mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies",24,62),("Denuncia","tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor",53,93),("Usuario","gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum",84,104),("Usuario","quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam",99,96),("Articulo","condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing",35,67),("Articulo","blandit at, nisi. Cum sociis natoque penatibus et magnis dis",58,75),("Articulo","Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin",22,28);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Denuncia","gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras",74,37),("Usuario","Cum sociis natoque penatibus et magnis dis parturient montes, nascetur",84,10),("Articulo","magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,",87,36),("Denuncia","hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.",13,38),("Usuario","In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum",34,22),("Denuncia","hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim.",88,97),("Usuario","nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum",73,97),("Articulo","rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi",42,69),("Denuncia","Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum.",62,43),("Articulo","ac mattis semper, dui lectus rutrum urna, nec luctus felis",8,82);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Articulo","lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.",79,60),("Usuario","Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi",49,7),("Denuncia","dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue,",49,95),("Usuario","orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec",20,8),("Usuario","mattis ornare, lectus ante dictum mi, ac mattis velit justo nec",104,25),("Usuario","et netus et malesuada fames ac turpis egestas. Fusce aliquet",90,105),("Articulo","dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl.",54,97),("Articulo","purus mauris a nunc. In at pede. Cras vulputate velit eu",106,17),("Usuario","eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.",74,2),("Articulo","justo eu arcu. Morbi sit amet massa. Quisque porttitor eros",60,27);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Denuncia","lobortis tellus justo sit amet nulla. Donec non justo. Proin",98,31),("Denuncia","nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.",17,59),("Articulo","ac mattis semper, dui lectus rutrum urna, nec luctus felis purus",72,62),("Articulo","feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut",69,56),("Articulo","neque sed dictum eleifend, nunc risus varius orci, in consequat enim",14,101),("Articulo","eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit",67,71),("Usuario","dui lectus rutrum urna, nec luctus felis purus ac tellus.",91,101),("Articulo","et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna",92,34),("Articulo","eu nulla at sem molestie sodales. Mauris blandit enim consequat",32,28),("Articulo","eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat",23,94);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Usuario","elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur",100,18),("Denuncia","ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,",69,31),("Denuncia","accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi",106,75),("Articulo","volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean",77,91),("Articulo","Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue.",72,24),("Usuario","velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas",71,51),("Denuncia","pretium neque. Morbi quis urna. Nunc quis arcu vel quam",81,32),("Usuario","Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi",49,6),("Denuncia","at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet",45,47),("Articulo","lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet",52,69);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Usuario","Nullam ut nisi a odio semper cursus. Integer mollis. Integer",53,105),("Denuncia","ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris",95,100),("Articulo","sit amet diam eu dolor egestas rhoncus. Proin nisl sem,",11,29),("Usuario","vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.",80,92),("Usuario","ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing.",38,98),("Usuario","egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta",69,5),("Articulo","consequat enim diam vel arcu. Curabitur ut odio vel est",89,47),("Denuncia","posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum",39,99),("Usuario","Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,",103,25),("Articulo","ante ipsum primis in faucibus orci luctus et ultrices posuere",40,97);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Usuario","Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus",43,95),("Usuario","Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna.",26,47),("Articulo","nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus",85,11),("Usuario","ac metus vitae velit egestas lacinia. Sed congue, elit sed",63,47),("Articulo","Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut",66,5),("Usuario","pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur",1,11),("Articulo","nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc",2,10),("Articulo","Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas",67,23),("Articulo","Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.",71,9),("Denuncia","dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.",25,72);
-- INSERT INTO COMENTARIO (tipo,comentario,fk_usuarioComentador,fk_dirigidoA) VALUES ("Usuario","risus varius orci, in consequat enim diam vel arcu. Curabitur",16,95),("Denuncia","tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor,",34,22),("Usuario","rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin",78,22),("Usuario","volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida",62,23),("Denuncia","nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat",15,48),("Articulo","porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor",73,10),("Denuncia","diam. Pellentesque habitant morbi tristique senectus et netus et malesuada",70,74),("Usuario","dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet",42,48),("Usuario","ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,",82,26),("Articulo","ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris",99,40);

-- /*Inserts en la tabla IMAGEN*/
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://http2.mlstatic.com/D_Q_NP_2X_799054-MLM46130141514_052021-P.webp",63),("https://http2.mlstatic.com/D_Q_NP_2X_909937-MLA32790540204_112019-P.webp",4),("https://http2.mlstatic.com/D_Q_NP_2X_888857-CBT45364211624_032021-P.webp",79),("https://http2.mlstatic.com/D_Q_NP_2X_958881-MLA45738482302_042021-P.webp",42),("https://http2.mlstatic.com/D_Q_NP_2X_635886-MLM44067130269_112020-P.webp",92),("https://http2.mlstatic.com/D_Q_NP_2X_994052-MLA45255550844_032021-P.webp",39),("https://http2.mlstatic.com/D_Q_NP_2X_616716-MLM46430012815_062021-P.webp",30),("https://http2.mlstatic.com/D_Q_NP_2X_864090-MLA45738471792_042021-P.webp",106),("https://http2.mlstatic.com/D_Q_NP_2X_757683-MLA46445315560_062021-P.webp",32),("https://http2.mlstatic.com/D_Q_NP_2X_647490-MLM46129165943_052021-P.webp",79);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://http2.mlstatic.com/D_Q_NP_2X_958881-MLA45738482302_042021-P.webp",94),("https://http2.mlstatic.com/D_Q_NP_2X_994052-MLA45255550844_032021-P.webp",19),("https://http2.mlstatic.com/D_Q_NP_2X_961223-MLA45255550823_032021-P.webp",83),("https://http2.mlstatic.com/D_Q_NP_2X_856749-MLM44398815085_122020-P.webp",46),("https://http2.mlstatic.com/D_Q_NP_2X_982104-MLM44551827858_012021-P.webp",29),("https://http2.mlstatic.com/D_Q_NP_2X_762449-MLA41257809614_032020-P.webp",56),("https://http2.mlstatic.com/D_Q_NP_2X_691124-MLM45550430862_042021-P.webp",25),("https://http2.mlstatic.com/D_Q_NP_2X_994165-MLM44695131662_012021-P.webp",21),("https://http2.mlstatic.com/D_Q_NP_2X_879598-CBT45054451699_032021-P.webp",94),("https://http2.mlstatic.com/D_Q_NP_2X_973286-MLM46117323619_052021-P.webp",99);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://http2.mlstatic.com/D_Q_NP_2X_701986-CBT45530784994_042021-P.webp",42),("https://http2.mlstatic.com/D_Q_NP_2X_626697-MLM44167616114_112020-P.webp",28),("https://http2.mlstatic.com/D_Q_NP_2X_636186-MLM44211861768_112020-P.webp",43),("https://i.ebayimg.com/thumbs/images/g/he4AAOSwcExggq9D/s-l300.jpg",43),("https://i.ebayimg.com/thumbs/images/g/boEAAOSwzW5g7WuA/s-l300.jpg",62),("https://http2.mlstatic.com/D_Q_NP_2X_649377-CBT46393001876_062021-P.webp",38),("https://http2.mlstatic.com/D_Q_NP_2X_930769-MLA45296832678_032021-P.webp",25),("https://http2.mlstatic.com/D_Q_NP_2X_772251-MLM45469204013_042021-P.webp",89),("https://http2.mlstatic.com/D_Q_NP_2X_771597-MLA45296870501_032021-P.webp",29),("https://http2.mlstatic.com/D_Q_NP_2X_695915-MLM41014715134_032020-P.webp",73);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://i.ebayimg.com/thumbs/images/g/RAQAAOSwsXFZNFY-/s-l300.jpg",8),("https://i.ebayimg.com/thumbs/images/g/jMMAAOSw7DJgVb82/s-l300.jpg",105),("https://i.ebayimg.com/thumbs/images/g/WAMAAOSwAoRg5a06/s-l300.jpg",13),("https://i.ebayimg.com/thumbs/images/g/NgEAAOSwCHVgOXZQ/s-l300.jpg",36),("https://i.ebayimg.com/thumbs/images/g/JtAAAOSwS6Ff3Wez/s-l300.jpg",80),("https://m.media-amazon.com/images/I/6181t0057sL._AC_UL320_.jpg",42),("https://m.media-amazon.com/images/I/51NkCL2lRBL._AC_UL320_.jpg",106),("https://m.media-amazon.com/images/I/41xyw4iqcJS._AC_UL320_.jpg",101),("https://m.media-amazon.com/images/I/61QnZ-V2enL._AC_UL320_.jpg",90),("https://m.media-amazon.com/images/I/51KOfnMru+L._AC_UL320_.jpg",93);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://m.media-amazon.com/images/I/61k3m+pmrqL._AC_UL320_.jpg",82),("https://m.media-amazon.com/images/I/71CT5AwS4lL._AC_UL320_.jpg",19),("https://m.media-amazon.com/images/I/51qzTF14H6L._AC_UL320_.jpg",12),("https://m.media-amazon.com/images/I/81sGn2OdrrL._AC_UL320_.jpg",44),("https://m.media-amazon.com/images/I/71gPwsiwmmL._AC_UL320_.jpg",101),("https://m.media-amazon.com/images/I/515HnTDmdDL._AC_UL320_.jpg",78),("https://m.media-amazon.com/images/I/7191EyVICUL._AC_UL320_.jpg",34),("https://m.media-amazon.com/images/I/71Eqgr5-moL._AC_UL320_.jpg",4),("https://m.media-amazon.com/images/I/61RLgJek0sL._AC_UL320_.jpg",85),("https://m.media-amazon.com/images/I/81miZB-8xeS._AC_UL320_.jpg",40);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://images-na.ssl-images-amazon.com/images/I/31nZeQ5ZNVL.jpg",30),("https://images-na.ssl-images-amazon.com/images/I/41yn8u3qJPL.jpg",28),("https://images-na.ssl-images-amazon.com/images/I/5118XlrWwlL.jpg",58),("https://images-na.ssl-images-amazon.com/images/I/51m5xW8hEaS.jpg",72),("https://images-na.ssl-images-amazon.com/images/I/41YuSwjJUIL.jpg",56),("https://images-na.ssl-images-amazon.com/images/I/31QqWNVFcFS.jpg",10),("https://images-na.ssl-images-amazon.com/images/I/41l-4yOemPL.jpg",75),("https://images-na.ssl-images-amazon.com/images/I/41BGSSgc1KL.jpg",63),("https://images-na.ssl-images-amazon.com/images/I/41j4kqdtewL.jpg",37),("https://cdn.pixabay.com/photo/2021/07/13/18/58/coffee-6464307__340.jpg",60);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://cdn.pixabay.com/photo/2021/07/13/11/34/cat-6463284__340.jpg",11),("https://cdn.pixabay.com/photo/2021/07/09/11/29/lavenders-6398894__340.jpg",52),("https://cdn.pixabay.com/photo/2021/01/28/21/12/wave-5959087__340.jpg",2),("https://cdn.pixabay.com/photo/2021/06/07/22/51/weevil-6319220__340.jpg",11),("https://cdn.pixabay.com/photo/2021/07/11/14/50/mountains-6403935__340.jpg",37),("https://cdn.pixabay.com/photo/2018/12/27/12/14/canal-3897510__340.jpg",26),("https://i.vimeocdn.com/video/1064479005_640x360.jpg",54),("https://cdn.pixabay.com/photo/2021/06/29/15/56/kingfisher-6374507__340.jpg",56),("https://cdn.pixabay.com/photo/2017/05/23/21/01/jar-2338584__340.jpg",102),("https://cdn.pixabay.com/photo/2020/10/02/09/01/tablets-5620566__340.jpg",24);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923__340.jpg",61),("https://cdn.pixabay.com/photo/2014/05/02/21/50/laptop-336378__340.jpg",15),("https://cdn.pixabay.com/photo/2014/11/21/17/17/house-540796__340.jpg",108),("https://cdn.pixabay.com/photo/2017/06/10/16/22/coffee-2390136__340.jpg",42),("https://cdn.pixabay.com/photo/2015/10/20/18/57/furniture-998265__340.jpg",97),("https://cdn.pixabay.com/photo/2019/12/10/10/53/architecture-4685608__340.jpg",86),("https://cdn.pixabay.com/photo/2014/12/27/14/37/living-room-581073__480.jpg",70),("https://cdn.pixabay.com/photo/2016/11/29/08/43/blank-1868502__340.jpg",74),("https://cdn.pixabay.com/photo/2015/12/08/00/26/desk-1081708__340.jpg",13),("https://cdn.pixabay.com/photo/2017/03/19/01/43/living-room-2155376__340.jpg",79);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://cdn.pixabay.com/photo/2017/03/22/17/39/kitchen-2165756__340.jpg",106),("https://cdn.pixabay.com/photo/2014/09/15/21/46/couch-447484__340.jpg",78),("https://cdn.pixabay.com/photo/2017/01/07/17/48/interior-1961070__340.jpg",100),("https://cdn.pixabay.com/photo/2016/04/18/13/53/room-1336497__340.jpg",8),("https://cdn.pixabay.com/photo/2016/11/23/14/29/living-room-1853203__340.jpg",65),("https://cdn.pixabay.com/photo/2017/03/28/12/10/chairs-2181947__340.jpg",24),("https://cdn.pixabay.com/photo/2017/03/28/12/17/chairs-2181994__340.jpg",44),("https://cdn.pixabay.com/photo/2016/11/21/12/59/couch-1845270__340.jpg",69),("https://cdn.pixabay.com/photo/2018/03/08/18/13/chair-3209341__340.jpg",93),("https://cdn.pixabay.com/photo/2015/03/26/09/42/bedroom-690129__340.jpg",44);
-- INSERT INTO IMAGEN (enlace_imagen,fk_articulo) VALUES ("https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390__340.jpg",71),("https://cdn.pixabay.com/photo/2015/08/13/01/00/keyboard-886462__340.jpg",69),("https://cdn.pixabay.com/photo/2017/03/20/04/57/truck-2158284__340.png",6),("https://cdn.pixabay.com/photo/2017/09/08/19/46/tank-2729903__340.png",100),("https://cdn.pixabay.com/photo/2017/08/18/08/38/steam-2654212__340.jpg",63),("https://cdn.pixabay.com/photo/2017/07/02/23/37/panzer-2466145__340.png",59),("https://cdn.pixabay.com/photo/2016/10/07/15/43/baby-carriage-1721858__340.png",35),("https://cdn.pixabay.com/photo/2018/01/19/20/56/truck-3093197__340.png",78),("https://cdn.pixabay.com/photo/2016/09/12/00/22/tutankhamen-1662814__340.jpg",98),("https://cdn.pixabay.com/photo/2018/02/14/22/35/shopping-cart-3154060__340.jpg",16);
-- COMMIT;


