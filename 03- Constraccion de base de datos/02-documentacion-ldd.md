# Construcción de Base de Datos con Lenguaje SQL

El luenguaje SQL que significa (Structured Query Language) se divide en 5 grandes categorias:

1. DDL(Data Definition Language)

2. DML(Data Manipulation Language)

3. DCL(Data Control Language - Controla Permisos) - GRANT, REVOKE
**Lenguaje de control de datos (DCL)**
4. TCL(Transaction Control Language - Controla transacciones) - COMMIT, ROLLBACK, SAVEPOINT, BEGIN TRANSACTION, SET TRANSACTION
**Lenguaje de control de transacciones (TCL)**
5. DQL(Data Query Language)


-----

## SQL-DDL

**Lenguaje de definición de datos (DDL)**

se utiliza para **crear y modificar la estructura** de una base de datos

con DDL trabajamos sobre los objetos de la base de datos:

- _Base de datos_
- _Tablas_
- _Renstricciones_
- Vistas
- Índices
- Esquemas
- Store Procedures
- Functions
- Triggers

**Comandos principales**

| Comando | Función |
| :--- | :--- |
| CREATE | Crear objetos de la base de datos |
| ALTER | Modifica objetos de la base de datos |
| DROP | Elimina objetos de la base de datos |
| TRUNCATE | Vacia una tabla |
| RENAME | Renombra objetos (Según el SGBD) |

---

## SQL-DML

**Lenguaje de manipulación de datos (DML)**

Sirve para **trabajar con la informacion almacenada**

Con este lenguaje no se cambia la estructura, sino los registros de las tablas, es decir, los datos que se encuentran en la base de datos.

| Comando | Función |
| :--- | :--- |
| INSERT | Inserta nuevos registros en una tabla |
| UPDATE | Modifica registros existentes en una tabla |
| DELETE | Elimina registros de una tabla |

----

## SQL-DQL

**Lenguaje de consulta de datos (DQL)**

Su funcion es **consultar la información almacenada** en la base de datos, es decir, extraer información de las tablas.

Este es probablemente el grupo mas utilizado:

**Comando principal**

| Comando | Función |
| :--- | :--- |
| SELECT | Consulta información de una o varias tablas |

Generalmente se combina con:

- WHERE: Para filtrar registros
- ORDER BY: Para ordenar registros
- GROUP BY: Para agrupar registros
- HAVING: Para filtrar grupos de registros
- JOIN (LEFT, RIGHT, INNER, FULL, CROSS): Para combinar registros de varias tablas
- DISTINCT: Para eliminar registros duplicados
- Funciones de agregado (SUM, AVG, COUNT, MAX, MIN, COUNT(*)): Para realizar cálculos sobre los registros
- WINDOW FUNCTIONS (Funciones de ventana): Para realizar cálculos sobre un conjunto de registros relacionados

---- 

## Nomenclatura para la construcción de base de datos (Snake Case)

La nomenclatura o convensión que más se recomienda hoy si se busca una nomenclatura moderna, portable y alineada con buenas prácticas en distintos motores de base de datos

La razón es que funcion de forma consuistente en **SQL SERVER, MYSQL, MARIA DB** y especialmente en **POSTGRESQL**, donde los identificadores sin comillas se convierten automaticamente a minusculas. Con **Snake Case** evitas problemas de mayusculas y haces qye las consultas sean más legibles y consistentes.

| Objeto | Convención | Ejemplo |
|:----------|:---------:|----------:|
| Base de datos | snake_case    | control_escolar  |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | signgular en snake_case | cliente, pedido, detalle_pedido |
| Columna | snake_case | cliente_id, fecha_registro, correo_electronico |
| PK | <tabla>_id | cliente_id, producto_id |
| FK | Igual que la PK referenciada | cliente_id, categoria_id |
| Tabla puente | <tabla1>_<tabla2> | alumno_curso, producto_proveedor |

----

## Nombrar las Resntricciones 

- pk_cliente
- fk_pedido_cliente
- uq_cliente_correo_electrónico
- ck_producto_precio
- df_cliente_activo
- ix_pedido_fecha

**Prefijos**

- pk_: Primary Key
- fk_: Foreign Key
- uq_: Unique
- ck_: Check
- df_: Default
- ix_: Index

## ALTER TABLE

Permite modificar una tabla existente

Puede:

- Agregar una columna
- Eliminar una columna
- Modificar una columna
- Agregar restricción restricciones
- Eliminar restricciones