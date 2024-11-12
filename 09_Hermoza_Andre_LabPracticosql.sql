CREATE DATABASE IF NOT EXISTS dbGamarraMarket
DEFAULT CHARACTER SET utf8;
USE dbGamarraMarket;

-- Tabla cliente

CREATE TABLE CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    email VARCHAR(80),
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN DEFAULT TRUE
);

DROP TABLE CLIENTE;
-- Listar tablas de Cliente

INSERT INTO CLIENTE (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@gmail.com', '998456323', str_to_date('20/10/1970', '%d /%m /%Y')),
('DNI', '45781233', 'Alicia', 'García Campos', '', '', str_to_date('20/03/1980', '%d /%m /%Y')),
('CNE', '315487922', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741', str_to_date('06/06/1986', '%d /%m /%Y')),
('CNE', '122116633', 'Ana', 'Enrique Flores', 'ana.enriquez@empresa.com', '', str_to_date('06/06/1986', '%d /%m /%Y')),
('CNE', '088741589', 'Claudia', 'Perales Ortíz', 'claudia.perales@yahoo.com', '997845263', str_to_date('25/07/1981', '%d /%m /%Y')),
('DNI', '45122587', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525871', str_to_date('10/10/1987', '%d /%m /%Y')),
('CNE', '175258564', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '995236741', str_to_date('06/06/1990', '%d /%m /%Y')),
('DNI', '47142536', 'Alejandro', 'Jimenez Huapaya', '', '941525365', str_to_date('01/06/1989', '%d /%m /%Y')),
('DNI', '15352585', 'Claudia', 'Marquez Litano', 'claudia.marquez@gmail.com', '985814723', str_to_date('01/10/1991', '%d /%m /%Y')),
('CNE', '465772587', 'Mario', 'Rodríguez  Mayo', 'mario.rodriguez@outlook.com', '912662587', str_to_date('10/11/1987', '%d /%m /%Y')),
('CNE', '837952514', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@yahoo.com', '974422136', str_to_date('21/12/1988', '%d /%m /%Y')),
('DNI', '74142585', 'Pedro Al...', 'Candela Valenzuela', 'pedro.candela@gmail.com', '94148525', str_to_date('30/06/1995', '%d /%m /%Y')),
('DNI', '53298147', 'Angel M...', 'Rojas Avila', 'angel.rojas@outlook.com', '', str_to_date('02/03/1975', '%d /%m /%Y')),
('DNI', '11453265', 'Hilario F...', 'Avila Huayapa', '', '985514326', str_to_date('02/05/2000', '%d /%m /%Y')),
('CNE', '757472186', 'Octavio...', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '966223141', str_to_date('22/09/2000', '%d /%m /%Y')),
('CNE', '558693219', 'Manolo E...', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '966223141', str_to_date('22/09/2000', '%d /%m /%Y')),
('DNI', '41552567', 'Genoveva', 'Ortíz Quispe', 'genoveva.ortiz@outlook.es', '92564137', str_to_date('12/04/2003', '%d /%m /%Y')),
('DNI', '49985471', 'Oscar C..', 'Quiroz Zavala', '', '988223145', str_to_date('12/10/2004', '%d /%m /%Y')),
('DNI', '44992217', 'Verónica', 'Romero Vargas', 'vernica.romero@yahoo.com', '', str_to_date('25/08/2002', '%d /%m /%Y')),
('DNI', '00253641', 'Eliseo', 'Prada Ortíz', 'eliseo.prada@yahoo.com', '', str_to_date('15/09/2004', '%d /%m /%Y'));
SHOW COLUMNS IN CLIENTE;
select * from CLIENTE;

UPDATE CLIENTE
SET celular = '922881101'
WHERE id;

UPDATE CLIENTE
SET celular = '977226604'
WHERE numero_documento = '53298147';

UPDATE CLIENTE
SET activo = 0
WHERE numero_documento IN ('11453265', '74142585', '49985471');

UPDATE CLIENTE
SET celular = ''
WHERE numero_documento IN ('87952514', '55869321', '74142585');

UPDATE CLIENTE
SET activo = 1, email = 'oscar.quiroz@yahoo.es'
WHERE id = 18;

DELETE FROM CLIENTE
WHERE numero_documento IN ('47142536', '77889955');

DELETE FROM CLIENTE
WHERE year(fecha_nacimiento) = 1980;




set FOREIGN_KEY_CHECKS = 0;
truncate table CLIENTE;
set FOREIGN_KEY_CHECKS = 1;




-- Tabla Venta

CREATE TABLE IF NOT EXISTS venta (
id int not null primary key auto_increment,
fecha_hora timestamp not null default current_timestamp,
activo bool not null default true,
cliente_id int not null,
vendedor_id int not null,

);

insert INTO venta (cliente_id, vendedor_id) values 
();
-- Listar columnas en ventas
SHOW COLUMNS IN venta;



-- Tabla Vendedor 

CREATE TABLE IF NOT EXISTS vendedor(
id int primary key  auto_increment,
tipo_documento char(3) not null,
numero_documento char(15) not null,
nombres varchar(60) not null,
apellidos varchar(90) not null,
salario decimal(8,2) not null,
celular char(9),
email varchar(80),
activo bool not null default true
);
-- Listar columenas en vendedor
SHOW COLUMNS IN vendedor;

INSERT INTO vendedor (tipo_documento, numero_documento, nombres, apellidos, salario, celular, email)values
('DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com'),
('DNI', '47259136', 'sofia', 'Ávila Solis', 1350.00, '', ''),
('DNI', '61542280', 'Marcela', 'Napaico Cama', 1600.00, '965874357', 'marcela.napaico@outlook.com'),
('CNE', '742536140', 'Carmelo', 'Rodríguez Chauca', 1550.00, '', 'carmelo.rodriguez@yahoo.com');



DELETE FROM vendedor
WHERE id = 3;

select * from vendedor;

-- Tabla prenda 

CREATE TABLE IF NOT EXISTS prenda (
id int not null primary key auto_increment,
descripcion varchar (90) not null,
marca varchar(60) not null,
cantidad int not null,
talla varchar (10) not null,
precio decimal (8,2) not null
);

INSERT INTO prenda (descripcion, marca, cantidad, talla, precio) VALUES
('Pantalon Jeans', 'Levis', 60, 28, 65.80),
('Camisa manga corta', 'Adams', 75, 16, 55.00),
('Polo sport', 'Australia', 100, 16, 40.00),
('Camisa manga larga', 'Newport', 150, 16, 42.50),
('Pijama para caballero', 'Adams', 180, 28, 79.50),
('Corbata', 'Maxwell', 85, 16, 14.50),
('Pijama para dama', 'Adams', 170, 24, 55.50),
('Pantalon Jeans', 'Australia', 200, 28, 68.50),
('Camisa Sport', 'John Holden', 85, 16, 88.50),
('Shorts Jeans', 'Pepe Jeans', 185, 28, 77.20);

UPDATE prenda
SET precio = 45.00
WHERE id = 3;

UPDATE prenda
SET descripcion = 'Corbata Michi elegante'
WHERE id = 6;





-- Listar columnas en prenda
select * from prenda;
SHOW COLUMNS IN prenda;


-- Tabla venta_detalle

CREATE TABLE IF NOT EXISTS venta_detalle (
id int not null primary key auto_increment,
venta_id int not null,
prenda_id int not null,
cantidad int not null
);

INSERT INTO venta_detalle (venta_id, prenda_id, cantidad) VALUES
(1, 6, 3),
(1, 3, 5),
(1, 2, 7),
(2, 2, 3),
(3, 7, 4),
(3, 10, 6),
(3, 2, 6),
(3, 5, 7),
(4, 2, 4),
(4, 5, 3);


select * from venta_detalle;
drop table venta_detalle;
-- Listar columnas en venta_detalle
SHOW COLUMNS IN venta_detalle;


-- Agregar claves Foranesas (foreing keys)

ALTER TABLE venta
	ADD CONSTRAINT venta_cliente foreign key (cliente_id)
    references CLIENTE (id)
    ON update cascade
    on delete cascade;
    
ALTER TABLE venta 
	add constraint venta_vendedor foreign key (vendedor_id)
    references vendedor (id)
    on update cascade
	on delete cascade;
    
ALTER TABLE venta_detalle 
	add constraint detalle_venta foreign key (venta_id)
    references venta (id) 
    on update cascade
	on delete cascade;
    
ALTER TABLE venta_detalle 
	add constraint detalle_prenda foreign key (prenda_id) 
    references prenda (id) 
    on update cascade
	on delete cascade;
    
/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, 
    k.table_name, 
    k.column_name,
    k.referenced_table_name, 
    k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i
LEFT JOIN 
    information_schema.KEY_COLUMN_USAGE k
ON 
    i.CONSTRAINT_NAME = k.CONSTRAINT_NAME
WHERE 
    i.CONSTRAINT_TYPE = 'FOREIGN KEY'
    AND i.TABLE_SCHEMA = DATABASE();
    
    
    /* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;


