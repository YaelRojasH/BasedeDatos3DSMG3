/*
==========================================================================================
SQL-LQD en SQLServer

Archivo: 04-pracrtices.sql

Descripcion: Realiza los comandos de SELECT
==========================================================================================
*/

-- Verificar la existencia de data en las tablas

SELECT * FROM [dbo].[categorias];
SELECT * FROM [dbo].[ciudades];
SELECT * FROM [dbo].[clientes];
SELECT * FROM [dbo].[departamentos];
SELECT * FROM [dbo].[detalle_ventas];
SELECT * FROM [dbo].[empleados];
SELECT * FROM [dbo].[estados];
SELECT * FROM [dbo].[productos];
SELECT * FROM [dbo].[productos];
SELECT * FROM [dbo].[proveedores];
SELECT * FROM [dbo].[ventas];

SELECT COUNT(*) FROM [dbo].[categorias];
SELECT COUNT(*) FROM [dbo].[ciudades];
SELECT COUNT(*) FROM [dbo].[clientes];
SELECT COUNT(*) FROM [dbo].[departamentos];
SELECT COUNT(*) FROM [dbo].[detalle_ventas];
SELECT COUNT(*) FROM [dbo].[empleados];
SELECT COUNT(*) FROM [dbo].[estados];
SELECT COUNT(*) FROM [dbo].[productos];
SELECT COUNT(*) FROM [dbo].[productos];
SELECT COUNT(*) FROM [dbo].[proveedores];
SELECT COUNT(*) FROM [dbo].[ventas];

/*
==========================================================================================

Instruccion SELECT, es la instruccion mas utilizada en SQL.
Su objetivo es consultar informacion de una o varias tablas 

Sintaxis

SELECT 
	columna_1,
	columna_2,
	columna_3,
	columna_n;
FROM nombre_tabla;

SELECT:

- FROM.
- WHERE:
	- Operadores relacionales (<, >, >=, <>, =)
	- Operadores l�gicos (AND, OR, NOT)
	- LIKE
	- BETWEEN
	- IN

- JOINS:
	- INNER
	- LEFT
	- RIGHT
	- FULL
	- CROSS

==========================================================================================
*/

-- Mostrar todos los estados de la republica

SELECT * 
FROM estados; -- No es recomendable usarla cuando existen muchos datos
GO

SELECT 
	nombre;
FROM estados;
GO

-- Mostrar los repartamentos 

SELECT nombre
FROM departamentos;
GO

-- Mostrar el nombre del proveedor, el telefono y su contrato

SELECT
	empresa,
	telefono,
	contacto
FROM proveedores;
GO

-- Alias de columnas

-- Moestrar los nombres de los estados 

SELECT 
	nombre 'Nombre del estado'
FROM estados;
GO

SELECT 
	nombre AS 'Nombre del estado'
FROM estados;
GO

SELECT 
	nombre Nombredelestado
FROM estados;
GO

SELECT 
	nombre AS Nombre_del_estado
FROM estados;
GO

SELECT 
	nombre [Nombre del estado]
FROM estados;
GO

SELECT COUNT (*) AS [Total de ventas detalle]
FROM detalle_ventas;

-- Mostrar el codigo, nombre y precio pero con
-- nombres mas adecuadas para el usuario 

SELECT 
	codigo AS Codigo_producto,
	UPPER (nombre) AS Producto,
	precio AS Precio_unitario
FROM productos;

-- TODO: VER CAMPOS CALCULADOS

-- Orden L�gico de una consulta SELECT 



-- Orden de como escribimos la consulta 

 -- SELECT 
 -- FROM
 -- WHERE
 -- GROUP BY
 -- HAVING 
 -- ORDER BY

-- ORDEN DE EJECUC�ON DE SQL SERVER

/*
FROM
WHERE 
GROUP BY
HAVING 
SELECT
ORDER BY
*/