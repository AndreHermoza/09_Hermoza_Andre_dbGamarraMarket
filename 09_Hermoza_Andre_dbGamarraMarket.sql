DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

USE dbGamarraMarket;

-- Tabla cliente

CREATE TABLE CLIENTE
(
    id int not  null,
    tipo_documento char(3) not null,
    numero_documento char(15) not null,
    nombres varchar(60) not null,
    apellidos varchar(90) not null,
    email varchar(80),
    celular char(9),
    fecha_nacimiento date not null,
    activo bool not null,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

-- Listar tablas de Cliente

SHOW COLUMNS IN CLIENTE;





-- Tabla Venta

CREATE TABLE IF NOT EXISTS venta (
id int not null,
fecha_hora timestamp not null,
activo bool not null,
cliente_id int not null,
vendedor_id int not null,
CONSTRAINT ventas_pk PRIMARY KEY (id)
);


-- Listar columnas en ventas
SHOW COLUMNS IN venta;



-- Tabla Vendedor 

CREATE TABLE IF NOT EXISTS vendedor(
id int not null,
tipo_documento char(3) not null,
numero_documento char(15) not null,
nombres varchar(60) not null,
apellidos varchar(90) not null,
salario decimal(8,2) not null,
celular char(3),
email varchar(80),
activo bool not null,
constraint vendedor_pk PRIMARY KEY(id)
);
-- Listar columenas en vendedor
SHOW COLUMNS IN vendedor;



-- Tabla prenda 

CREATE TABLE IF NOT EXISTS prenda (
id int not null,
descripcion varchar (90) not null,
marca varchar(60) not null,
cantidad int not null,
talla varchar (10) not null,
precio decimal (8,2) not null,
constraint prenda_pk PRIMARY KEY(id)
);

-- Listar columnas en prenda

SHOW COLUMNS IN prenda;


-- Tabla venta_detalle

CREATE TABLE IF NOT EXISTS venta_detalle (
id int not null,
cantidad int not null,
venta_id int not null,
prenda_id int not null,
constraint venta_datella_pk primary key (id)
);


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