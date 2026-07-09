-- construcción de bases de datos con SQL-LDD (Create, Alter, Drop)

-- Crear una base de datos

CREATE DATABASE universidad;
GO

-- Usar la base de datos
USE universidad;
GO

-- Crear una tabla

CREATE TABLE alumno(
	alumno_id INT,
	nombre_alumno VARCHAR (50),
	apellido_paterno VARCHAR (20),
	apellido_materno VARCHAR (20),
	fecha_nacimiento DATE,
	correo VARCHAR (50)
);
GO

INSERT INTO alumno
VALUES (1, 'Arcadia', 'Vaca', 'Del Corral', '1986-04-07', 'correo@correo.com');

INSERT INTO alumno
VALUES (1, 'Kevin', 'Cabeza', 'Del Borreo', '1942-04-07', 'correo@correo.com');

SELECT *
FROM alumno;

-- Renstricciones
/*
	Las renstricciones son reglas que garantizan la integridad de los datos

	Las más utilizadas son:
	
	- PRIMARY KEY
	- FOREIGN KEY
	- NOT NULL
	- UNIQUE
	- CHECK
	- DEFAULT
*/


DROP TABLE alumno;
GO

 -- PRIMARY KEY

CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(50),
	correo VARCHAR(50)
);
GO

INSERT INTO alumno
VALUES (1, 'Luis', 'correo@correo');


INSERT INTO alumno
VALUES (2, 'Jose', 'correo@correo');

DROP TABLE alumno;
GO


CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(50),
	correo VARCHAR(50)
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO

DROP TABLE alumno;

-- PRIMARY KEY CON IDENTITY

DROP TABLE alumno;
GO


CREATE TABLE alumno(
	alumno_id INT IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(50),
	correo VARCHAR(50)
);
GO

INSERT INTO alumno
VALUES ('Luis', 'correo@correo');


INSERT INTO alumno
VALUES ('Jose', 'correo@correo');

SELECT * FROM alumno;

DROP TABLE alumno;
GO

CREATE TABLE alumno(
	alumno_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(50),
	correo VARCHAR(50)
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO

-- NOT NULL

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1,1),
	numero_nomina VARCHAR (20) NOT NULL,
	nombre VARCHAR (15) NOT NULL,
	apellido_paterno VARCHAR (20) NOT NULL,
	apellido_materno VARCHAR (20) NULL,
	fecha_ingreso DATE,
	CONSTRAINT pk_profesor
	PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor
VALUES ('55555555','Jose','Hernandez',NULL, '2027-01-01');

INSERT INTO profesor (numero_nomina, nombre, apellido_materno)
VALUES ('2222222', 'Ricarda', 'Sonrics');

-- Renstricción UNIQUE

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	archivo BIT NOT NULL
);
GO

INSERT INTO categoria
VALUES(UPPER('Carnes Frias'), 1);


INSERT INTO categoria
VALUES(UPPER('Carnes Frias'), 1);

DROP TABLE categoria;
GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_categoria_nombre UNIQUE,
	archivo BIT NOT NULL
);
GO


CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	archivo BIT NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre 
	UNIQUE (nombre) 
);
GO

DROP TABLE categoria;
GO

-- Resntricción default


CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre 
	UNIQUE (nombre) 
);
GO

INSERT INTO categoria (nombre, activo)
VALUES ('Carnes frias',DEFAULT);


INSERT INTO categoria (nombre)
VALUES ('Carnes frias');

SELECT *
FROM categoria;

-- TODO: CREAR LAS TABLAS DE LAS OTRAS DOS FORMAS
-- TODO: CHECK

CREATE DATABASE empresa_patito;
GO

USE empresa_patito;

-- Primera forma de construccion (no utilizar en el futuro)

CREATE TABLE producto(
	producto_id INT IDENTITY (1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	descripcion VARCHAR(80),
	precio DECIMAL (10,2) NOT NULL CHECK (precio > 0.0),
	existencia INT NOT NULL CHECK (existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL DEFAULT 1,
	tipo CHAR (1) NOT NULL CHECK (tipo = 'r' OR tipo = 'p')
);
GO
DROP TABLE producto;

-- Segunda forma de construccion (Renstriccion por columna)

CREATE TABLE producto(
	producto_id INT IDENTITY (1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	descripcion VARCHAR(80),
	precio DECIMAL (10,2) NOT NULL
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	existencia INT NOT NULL
	CHECK (existencia BETWEEN 1 AND 100),
	activo BIT NOT NULl
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	tipo CHAR (1) NOT NULL
	CONSTRAINT ck_producto_tipo
	CHECK (tipo IN ('r','p')
);

-- Tercera forma de creacion (Definicion al final)

CREATE TABLE producto(
	producto_id INT IDENTITY (1,1),
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(80),
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULl
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	tipo CHAR (1) NOT NULL
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	CONSTRAINT ck_producto_precio
	CHECK (precio > 0.0),
	CONSTRAINT ck_producto_existencia
	CHECK (existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_producto_tipo
	CHECK (tipo IN ('r','p'))
);
GO


-- Renstriccion de Foreing key (Integridad Referencial)

CREATE TABLE proveedor(
	proveedor_id INT NOT NULL IDENTITY (1,1),
	empresa VARCHAR (20) NOT NULL,
	limite_credito NUMERIC (10,2) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_proveedor_activo
	DEFAULT 1,
	create_at DATETIME2 NOT NULL
	CONSTRAINT de_proveedor_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_proveedor_updated_at
	DEFAULT SYSDATETIME(),
	CONSTRAINT pk_proveedor
	PRIMARY KEY (proveedor_id),
	CONSTRAINT	uq_proveedor_empresa
	UNIQUE (empresa),
	CONSTRAINT ck_proveedor_limite_credito
	CHECK (limite_credito BETWEEN 100 AND 100000)
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT IDENTITY (1,1)
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	apellido_materno VARCHAR (15) NOT NULL,
	apellido_paterno VARCHAR (15) NULL,
	telefono VARCHAR (18) NOT NULL,
	proveedor_id INT NOT NULL,
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
);
GO

INSERT INTO proveedor (empresa, limite_credito)
VALUES ('Coca-cola', 78000),
		('Pepsi' , 74850),
		('Bimbo', 100000);

SELECT *
FROM proveedor;

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Luis', 'Aguilar', NULL, '222222222', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Casilda', 'Cabeza', 'de Vaca', '33333333', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Karen', 'Cabeza', 'Grnade', '4444444', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Arcadia', 'Puerco', 'Rosa', '6666666', 3);

SELECT *
FROM contacto_proveedor;

TRUNCATE TABLE contacto_proveedor; -- Elimina todos los registros de la tabla y reinicia los IDENTITYS y que no tenga referencias

DROP TABLE contacto_proveedor;
DROP TABLE proveedor;

-- ON DELETE y ON UPDATE NO ACTION

CREATE TABLE proveedor(
	proveedor_id INT NOT NULL,
	empresa VARCHAR (20) NOT NULL,
	limite_credito NUMERIC (10,2) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_proveedor_activo
	DEFAULT 1,
	create_at DATETIME2 NOT NULL
	CONSTRAINT de_proveedor_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_proveedor_updated_at
	DEFAULT SYSDATETIME(),
	CONSTRAINT pk_proveedor
	PRIMARY KEY (proveedor_id),
	CONSTRAINT	uq_proveedor_empresa
	UNIQUE (empresa),
	CONSTRAINT ck_proveedor_limite_credito
	CHECK (limite_credito BETWEEN 100 AND 100000)
);
GO

CREATE TABLE contacto_proveedor(
	contacto_id INT IDENTITY (1,1)
	CONSTRAINT pk_contacto_proveedor
	PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	apellido_materno VARCHAR (15) NOT NULL,
	apellido_paterno VARCHAR (15) NULL,
	telefono VARCHAR (18) NOT NULL,
	proveedor_id INT NULL,
	CONSTRAINT fk_contacto_proveedor_proveedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor (proveedor_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

DROP TABLE contacto_proveedor;

INSERT INTO proveedor (proveedor_id, empresa, limite_credito)
VALUES (1, 'Coca-cola', 78000),
		(2, 'Pepsi' , 74850),
		(3, 'Bimbo', 100000);

SELECT *
FROM proveedor;

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Luis', 'Aguilar', NULL, '222222222', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Casilda', 'Cabeza', 'de Vaca', '33333333', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Karen', 'Cabeza', 'Grnade', '4444444', 1);

INSERT INTO contacto_proveedor (nombre, apellido_materno, apellido_paterno, telefono, proveedor_id)
VALUES ('Arcadia', 'Puerco', 'Rosa', '6666666', 3);

SELECT *
FROM contacto_proveedor;

-- Eliminar el padre con no action

DELETE FROM contacto_proveedor
WHERE proveedor_id = 1;

DELETE FROM proveedor
WHERE proveedor_id = 1;

-- TODO: Se debe realizar el ON UPDATE NO ACTION y las demas integriades referenciales