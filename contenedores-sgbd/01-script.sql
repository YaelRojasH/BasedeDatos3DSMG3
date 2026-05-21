
CREATE DATABASE pruebabd;

CREATE TABLE tbl1 (
	id INT,
	nombre varchar(30)
);

insert into tbl1
values (1, 'pepito'),
       (2, 'Luis'),
       (3, 'Luar');
      
select * FROM tbl1;