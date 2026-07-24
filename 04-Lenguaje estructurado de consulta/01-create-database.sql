/*
==========================================================================================
SQL-LQD en SQLServer

Archivo: 01-create-database.sql

Descripcion: Crea la base de datos para el lenguaje SQL
==========================================================================================
*/

USE master;
GO

IF DB_ID ('comercial_db') IS NOT NULL
BEGIN 
	
	ALTER DATABASE comercial_db
	SET SINGLE_USER -- Solo yo, por si alguien mas esta usando la base de datos
	WITH ROLLBACK IMMEDIATE; -- Rollback: Cancelar todas las transacciones

	DROP DATABASE comercial_db;

END;
GO

CREATE DATABASE comercial_db;

USE comercial_db;

SELECT DB_ID ('comercial_db');