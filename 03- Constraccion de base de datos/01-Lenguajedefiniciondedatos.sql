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