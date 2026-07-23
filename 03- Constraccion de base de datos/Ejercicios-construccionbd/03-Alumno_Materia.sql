CREATE DATABASE inscripciones;
GO

USE inscripciones;
GO

CREATE TABLE alumno (
	alumno_id INT NOT NULL IDENTITY (1,1),
	matricula VARCHAR (20) NOT NULL,
	nombre VARCHAR (20) NOT NULL,
	apellido1 VARCHAR (20) NOT NULL,
	apellido2 VARCHAR (20) NOT NULL,
	semestre INT NOT NULL,

	CONSTRAINT pk_alumno 
	PRIMARY KEY (alumno_id)
);
GO

CREATE TABLE materia (
	materia_id INT NOT NULL IDENTITY (1,1),
	nombre_materia VARCHAR (20) NOT NULL,
	creditos INT NOT NULL,

	CONSTRAINT pk_materia
	PRIMARY KEY (materia_id)
);
GO

CREATE TABLE inscribe (
	materia_id INT NOT NULL,
	alumno_id INT NOT NULL,
	fecha_inscripcion DATE NOT NULL,
	calificacion_final DECIMAL (3,1) NOT NULL,

	CONSTRAINT pk_inscribe
	PRIMARY KEY (materia_id, alumno_id),
	
	CONSTRAINT fk_alumno
	FOREIGN KEY (alumno_id)
	REFERENCES alumno(alumno_id),

	CONSTRAINT fk_materia
	FOREIGN KEY (materia_id)
	REFERENCES materia(materia_id),

	CONSTRAINT ck_inscribe_calificacion_final
	CHECK (calificacion_final > 0.0)
);
GO

INSERT INTO alumno (matricula, nombre, apellido1, apellido2, semestre)
VALUES
('A2024001', 'Juan', 'Pérez', 'López', 3),
('A2024002', 'María', 'Gómez', 'Ramírez', 5),
('A2024003', 'Carlos', 'Hernández', 'Soto', 1);

INSERT INTO materia (nombre_materia, creditos)
VALUES
('Bases de Datos', 5),
('Programación', 6),
('Matemáticas', 4);

INSERT INTO inscribe (materia_id, alumno_id, fecha_inscripcion, calificacion_final)
VALUES
(1, 1, '2025-01-15', 9.5),
(2, 2, '2025-01-16', 8.7),
(3, 3, '2025-01-17', 10.0);

SELECT * FROM alumno;

SELECT * FROM materia;

SELECT * FROM inscribe;