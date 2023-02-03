create database if not exists RBsombrillas;
use RBsombrillas;

create table if not exists ciudad(
ID_ciudad int primary key auto_increment,
nombre varchar(255) not null
);

create table if not exists producto(
ID_producto int primary key auto_increment,
cantidad int not null,
tipo_producto enum('P' , 'J'), -- de playa o jardin 
precio_mayor float not null,
precio_menor float not null
);

create table if not exists cliente(
ID_cliente int primary key auto_increment,
nombre varchar(255) not null,
apellido varchar(255) not null,
direccion VARCHAR(255),
telefono VARCHAR(255) not null,
DNI varchar(10) not null ,
cuil varchar(15),
ID_ciudad int ,
foreign key (ID_ciudad) references ciudad (ID_ciudad) 
);

create table if not exists proveedor(
ID_proveedor int primary key auto_increment,
nombre varchar(255) not null,
apellido varchar(255) not null,
direccion VARCHAR(255),
telefono VARCHAR(255) not null,
DNI varchar(10) not null ,
cuil varchar(15),
ID_ciudad int ,
foreign key (ID_ciudad) references ciudad (ID_ciudad) ,
CBU int 
);

create table if not exists vendedor(
ID_vendedor int primary key auto_increment,
nombre varchar(255) not null,
apellido varchar(255) not null,
direccion VARCHAR(255),
telefono VARCHAR(255) not null,
DNI varchar(10) not null ,
cuit varchar(15),
ID_ciudad int ,
foreign key (ID_ciudad) references ciudad (ID_ciudad) 
);

create table if not exists pedido_venta(
ID_pedidoV int primary key auto_increment,
ID_cliente int,
foreign key (ID_cliente) references cliente (ID_cliente),
ID_vendedor int,
foreign key (ID_vendedor) references vendedor(ID_vendedor),
fecha_inicio DATE NOT NULL,
fecha_entrega DATE NOT NULL
);

create table if not exists pedido_compra(
ID_pedidoc int primary key auto_increment,
ID_proveedor int,
foreign key (ID_proveedor) references proveedor (ID_proveedor),
fecha_inicio DATE NOT NULL,
fecha_entrega DATE NOT NULL
);

create table if not exists factura_emitida(
ID_factura_emitida int primary key auto_increment,
ID_cliente int,
foreign key (ID_cliente) references cliente (ID_cliente),
ID_vendedor int,
foreign key (ID_vendedor) references vendedor(ID_vendedor),
ID_pedidoC int,
foreign key (ID_pedidoC) references pedido_compra (ID_pedidoC),
fecha date not null,
numero_factura int not null,
monto float not null 
);

create table if not exists factura_recibida(
ID_factura_recibida int primary key auto_increment,
ID_proveedor int,
foreign key (ID_proveedor) references proveedor (ID_proveedor),
ID_pedidoV int,
foreign key (ID_pedidoV) references pedido_venta (ID_pedidoV),
fecha date not null,
numero_factura int not null,
monto float not null 
);

-- correcciones :
drop table if exists factura_recibida;
drop table  if exists pedido_venta ;

create table if not exists detalle_pedido(
ID_detalle_pedido int primary key auto_increment,
ID_pedidoV int,
foreign key (ID_pedidoV) references pedido_venta (ID_pedidoV),
ID_producto int,
foreign key (ID_producto) references producto (ID_producto),
precio float not null ,
cantidad int not null
);

select * from ciudad;
/*
-- Query: select * from ciudad
LIMIT 0, 1000

-- Date: 2022-11-22 12:27
*/
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (1,'Al');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (2,'Dietrich');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (3,'Royall');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (4,'Ingrid');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (5,'Janie');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (6,'Jeanine');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (7,'Dee');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (8,'Stephan');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (9,'Leroi');
INSERT INTO ciudad (`ID_ciudad`,`nombre`) VALUES (10,'Marius');

select * from producto; 
/*
-- Query: select * from producto
LIMIT 0, 1000

-- Date: 2022-11-22 22:33
*/
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (1,22,'P',87118,97689);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (2,156,'J',40441,91039);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (3,60,'P',80472,97520);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (4,117,'P',9787,87328);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (5,156,'J',51770,60366);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (6,69,'P',83876,53128);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (7,73,'P',98679,80495);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (8,15,'J',44139,9724);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (9,20,'P',91881,16225);
INSERT INTO producto (`ID_producto`,`cantidad`,`tipo_producto`,`precio_mayor`,`precio_menor`) VALUES (10,15,'J',92647,31218);

select * from cliente;
delete from cliente;
SET sql_safe_updates=1;

/*
-- Query: select * from cliente
LIMIT 0, 1000

-- Date: 2022-11-22 23:11
*/
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (1,'Angelico','Berzin','61 Pawling Hill','3537185385','167722405','493829149',10);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (2,'Chane','Shulem','11831 Parkside Drive','1591652117','362713901','789715708',9);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (3,'Leesa','Hunn','1023 Bayside Court','5193786136','363879373','501550052',8);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (4,'Meris','Fesby','111 Fordem Alley','8383764129','196965590','552056904',7);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (5,'Corry','Finnimore','37 Mifflin Road','3124396095','679079506','507365404',6);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (6,'Lacie','Serot','45 Barby Crossing','2022538705','166402222','286935905',5);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (7,'Damiano','Salmoni','0 Hoffman Circle','6078420269','205153848','376540334',4);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (8,'Damita','Colleford','30 Meadow Valley Drive','1558441274','255491735','714609352',3);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (9,'Theda','Cutchie','8197 Dottie Parkway','9042352977','883266293','217306494',2);
INSERT INTO cliente(`ID_cliente`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`) VALUES (10,'Connie','Piggrem','22 Shoshone Circle','2266220165','293524837','680467671',1);

select * from proveedor;
/*
-- Query: select * from proveedor
LIMIT 0, 1000

-- Date: 2022-11-23 15:07
*/
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (1,'Delbert','Patillo','Brown','4176544776','6993778','4874852018',1,891);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (2,'De','Handrik','Mesta','8126507430','4699884','5274437487',2,69);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (3,'Wheeler','Fewless','Maryland','1177188387','5625912','3215982563',3,992);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (4,'Carleton','Emeny','Arrowood','9504451487','9646259','2469112455',4,9);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (5,'Auberta','Petasch','Forster','6664073774','2674744','3387030904',5,302);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (6,'Loni','Scallan','Dayton','6154890684','1363792','8813082369',6,8004);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (7,'Ara','MacNulty','Comanche','5712622328','4293265','7735437118',7,674);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (8,'Judith','Cullnean','Weeping Birch','8231150980','6927454','7380789801',8,307);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (9,'Giralda','Symms','Hoffman','5756261975','3492262','7496168545',9,32);
INSERT INTO proveedor (`ID_proveedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuil`,`ID_ciudad`,`CBU`) VALUES (10,'Reese','Kissock','Emmet','1027027480','3507022','1249253074',10,142);

select * from vendedor;
/*
-- Query: select * from vendedor
LIMIT 0, 1000

-- Date: 2022-11-23 15:04
*/
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (1,'Delbert','Patillo','Brown','4176544776','6993778','4874852018',1);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (2,'De','Handrik','Mesta','8126507430','4699884','5274437487',2);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (3,'Wheeler','Fewless','Maryland','1177188387','5625912','3215982563',3);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (4,'Carleton','Emeny','Arrowood','9504451487','9646259','2469112455',4);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (5,'Auberta','Petasch','Forster','6664073774','2674744','3387030904',5);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (6,'Loni','Scallan','Dayton','6154890684','1363792','8813082369',6);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (7,'Ara','MacNulty','Comanche','5712622328','4293265','7735437118',7);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (8,'Judith','Cullnean','Weeping Birch','8231150980','6927454','7380789801',8);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (9,'Giralda','Symms','Hoffman','5756261975','3492262','7496168545',9);
INSERT INTO vendedor (`ID_vendedor`,`nombre`,`apellido`,`direccion`,`telefono`,`DNI`,`cuit`,`ID_ciudad`) VALUES (10,'Reese','Kissock','Emmet','1027027480','3507022','1249253074',10);

select * from pedido_venta;
/*
-- Query: select * from pedido_venta
LIMIT 0, 1000

-- Date: 2022-11-23 15:26
*/
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (1,1,1,'2022-01-24','2022-05-06');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (2,2,2,'2022-09-28','2022-07-03');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (3,3,3,'2022-07-05','2022-09-16');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (4,4,4,'2022-10-16','2022-06-16');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (5,5,5,'2022-10-11','2021-12-26');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (6,6,6,'2021-12-22','2021-12-17');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (7,7,7,'2022-01-31','2022-11-03');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (8,8,8,'2022-08-16','2022-06-20');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (9,9,9,'2022-08-16','2022-07-05');
INSERT INTO pedido_venta (`ID_pedidoV`,`ID_cliente`,`ID_vendedor`,`fecha_inicio`,`fecha_entrega`) VALUES (10,10,10,'2022-05-23','2021-12-23');

select * from pedido_compra;
/*
-- Query: select * from pedido_compra
LIMIT 0, 1000

-- Date: 2022-11-23 15:36
*/
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (1,1,'2022-01-24','2022-05-06');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (2,2,'2022-09-28','2022-07-03');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (3,3,'2022-07-05','2022-09-16');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (4,4,'2022-10-16','2022-06-16');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (5,5,'2022-10-11','2021-12-26');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (6,6,'2021-12-22','2021-12-17');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (7,7,'2022-01-31','2022-11-03');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (8,8,'2022-08-16','2022-06-20');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (9,9,'2022-08-16','2022-07-05');
INSERT INTO pedido_compra (`ID_pedidoc`,`ID_proveedor`,`fecha_inicio`,`fecha_entrega`) VALUES (10,10,'2022-05-23','2021-12-23');

select *from factura_emitida;
/*
-- Query: select *from factura_emitida
LIMIT 0, 1000

-- Date: 2022-11-23 15:43
*/
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (1,1,1,1,'2021-12-26',91259,220380);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (2,2,2,2,'2022-05-09',432551,664339);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (3,3,3,3,'2022-03-29',966492,690681);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (4,4,4,4,'2022-03-29',922758,870842);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (5,5,5,5,'2022-10-17',219801,18624.8);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (6,6,6,6,'2022-02-11',753916,678008);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (7,7,7,7,'2022-07-13',904890,603049);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (8,8,8,8,'2022-09-30',244737,512306);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (9,9,9,9,'2022-10-09',984012,668929);
INSERT INTO factura_emitida(`ID_factura_emitida`,`ID_cliente`,`ID_vendedor`,`ID_pedidoC`,`fecha`,`numero_factura`,`monto`) VALUES (10,10,10,10,'2021-12-16',430813,726026);

select * from factura_recibida;

/*
-- Query: select * from factura_recibida
LIMIT 0, 1000

-- Date: 2022-11-23 15:56
*/
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (1,10,10,'2021-12-16',430813,6025.88);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (2,9,10,'2022-10-09',984012,6629.02);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (3,8,5,'2022-09-30',244737,5125.81);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (4,7,7,'2022-07-13',904890,603049);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (5,8,2,'2022-02-11',753916,6708.22);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (6,5,5,'2022-10-17',219801,624.8);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (7,4,5,'2022-03-29',922758,870842);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (8,4,3,'2022-03-29',966492,690681);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (9,2,2,'2022-05-09',432551,64339.1);
INSERT INTO factura_recibida (`ID_factura_recibida`,`ID_proveedor`,`ID_pedidoV`,`fecha`,`numero_factura`,`monto`) VALUES (10,1,10,'2021-12-26',91259,2280.37);

select * from detalle_pedido;
/*
-- Query: select * from detalle_pedido
LIMIT 0, 1000

-- Date: 2022-11-23 16:10
*/
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (1,1,1,995296,58);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (2,2,2,811865,72);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (3,3,3,481516,67);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (4,4,4,957098,190);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (5,5,5,530043,9);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (6,6,6,688598,175);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (7,7,7,442887,177);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (8,8,8,135151,87);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (9,9,9,468226,131);
INSERT INTO detalle_pedido (`ID_detalle_pedido`,`ID_pedidoV`,`ID_producto`,`precio`,`cantidad`) VALUES (10,10,10,210259,183);


/* 
vistas 
*/
select * from cliente;
CREATE OR REPLACE VIEW telefono_clientes
AS 
select nombre , apellido , telefono 
from cliente ;
select *from telefono_clientes;


CREATE OR REPLACE VIEW vista_stock_10 AS
SELECT ID_producto , tipo_producto , cantidad  
FROM producto
WHERE ID_producto IN (SELECT ID_producto
			FROM producto
			WHERE cantidad >= 10);
select * from vista_stock_10;


CREATE OR REPLACE VIEW  vista_compras AS  
select c.nombre, c.apellido , c.telefono
from cliente as c 
inner join pedido_venta as PV
on PV.ID_pedidoV = c.ID_cliente
where PV.fecha_entrega like '%2022%'; 

select * from vista_compras;

create or replace view vista_ventas_playa as
select  d.ID_producto , d.cantidad
from detalle_pedido as d
inner join producto as p
on p.ID_producto = d.ID_producto
where p.tipo_producto like '%P%';

select * from  vista_ventas_playa; 

/*
Tercera entrega
*/
use rbsombrillas;
select * from proveedor;

 -- Traer el nombre de proveedores 
 drop function  get_name_proveedor ;
 
DELIMITER $$
CREATE FUNCTION get_name_proveedor (numero_proveedor INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	DECLARE resultado VARCHAR(255);
    SET resultado = (SELECT nombre FROM proveedor WHERE ID_proveedor = numero_proveedor);
    RETURN resultado;
END $$

select get_name_proveedor(ID_proveedor) as 'Nombre Proveedor' FROM proveedor;

-- Traer facturas emitidas con un monton mayor a $600.000 por fecha descendente
drop function get_segun_monto;

DELIMITER $$
CREATE FUNCTION get_segun_monto (monto_factura FLOAT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	CASE
		WHEN monto_factura >= 600000 THEN RETURN 'Monto mayor a 600.000';
        ELSE RETURN 'Monto menor';
    END CASE;
END $$

select ID_cliente , get_segun_monto(monto) as ' Montos factura', fecha, ID_vendedor from factura_emitida
order by fecha desc; 
  
select * from factura_emitida;

/*
--- stored procedure ---
*/

DROP PROCEDURE sp_ordenar;
-- ordenar segun la columna que enviamos como parametro . 
DELIMITER $$
CREATE PROCEDURE sp_ordenar (IN columna VARCHAR(30) )
BEGIN
	
    IF columna <> '' THEN
		SET @orden = CONCAT('ORDER BY ' , columna);
    ELSE
		SET @orden = '';
	END IF;
    
    SET @clausula = CONCAT('SELECT * FROM producto ' ,@orden);
    
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END$$
CALL sp_ordenar ('cantidad');
CALL sp_ordenar ('tipo_producto');

select * producto;

-- mostrar los pedidos que tengan cierta cantidad de productos. 
select * from detalle_pedido;

drop procedure sp_mostrar_por_cantidad ;

DELIMITER $$
CREATE PROCEDURE sp_mostrar_por_cantidad (IN p_cantidad INT)
BEGIN
	IF p_cantidad >= 100 THEN
		SELECT * FROM detalle_pedido WHERE cantidad >= p_cantidad ORDER BY cantidad DESC;
	ELSE
		SELECT * FROM detalle_pedido WHERE cantidad <= p_cantidad ORDER BY cantidad ASC;
	END IF;
END$$

call sp_mostrar_por_cantidad (110);
call sp_mostrar_por_cantidad (80);

/*
--- triggers  ---
*/

SELECT * FROM producto;

DROP table producto_historico;

CREATE TABLE IF NOT EXISTS producto_historico (
	ID_p INT ,
    tipo_p enum('P' , 'J'), -- de playa o jardin
    precio_may FLOAT,
    precio_men FLOAT,
    fecha_hora datetime
);

DELIMITER //
CREATE TRIGGER trigger_producto_historico
AFTER INSERT ON producto -- after porque es despues de ingresado
FOR EACH ROW -- por cada uno de los registros 
BEGIN
    INSERT INTO producto_historico (ID_p,tipo_p,precio_may, precio_men,fecha_hora) 
    VALUES (NEW.ID_producto, NEW.tipo_producto,new.precio_mayor,new.precio_menor, NOW());
END//

drop trigger trigger_producto_historico;

select * from producto_historico;

INSERT INTO producto VALUES (11,10,'P', 11000, 23000);

-- trigger que guarde los clientes nuevos 
drop table cliente_historico;

CREATE TABLE IF NOT EXISTS cliente_historico (
	ID_client INT ,
	nombre varchar(255) not null,
	apellido varchar(255) not null,
    telefono VARCHAR(255) not null, 
    fecha_hora datetime
);

DELIMITER //
CREATE TRIGGER trigger_cliente_historico
AFTER INSERT ON cliente 
FOR EACH ROW 
BEGIN
    INSERT INTO cliente_historico (ID_client,nombre,apellido, telefono,fecha_hora) 
    VALUES (new.ID_cliente, new.nombre, new.apellido, new.telefono, NOW());
END//

INSERT INTO cliente VALUES (null,'Daniela','Tassara','cabaliito','3537185385','167722405','493829149',5);

select * from cliente_historico;