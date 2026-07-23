CREATE DATABASE empleados;
GO

USE empleados;
GO

CREATE TABLE employee(
    ssn CHAR(9) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    address VARCHAR(100),
    bdate DATE,
    salary DECIMAL(10,2),
    sex CHAR(1),
    jefe CHAR(9) NULL,

    CONSTRAINT pk_employee
    PRIMARY KEY(ssn)
);
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_jefe
FOREIGN KEY (jefe)
REFERENCES employee(ssn);
GO

CREATE TABLE department(
    number INT NOT NULL,
    name VARCHAR(40) NOT NULL,
    manager CHAR(9) NOT NULL,
    startdate DATE NOT NULL,

    CONSTRAINT pk_department
    PRIMARY KEY(number),

    CONSTRAINT uq_manager
    UNIQUE(manager),

    CONSTRAINT fk_department_manager
    FOREIGN KEY(manager)
    REFERENCES employee(ssn)
);
GO

CREATE TABLE locations(
    num_location INT NOT NULL,
    number_dep INT NOT NULL,
    location VARCHAR(50) NOT NULL,

    CONSTRAINT pk_locations
    PRIMARY KEY(num_location, number_dep),

    CONSTRAINT fk_locations_department
    FOREIGN KEY(number_dep)
    REFERENCES department(number)
);
GO

CREATE TABLE projects(
    number INT NOT NULL,
    name VARCHAR(40) NOT NULL,
    location VARCHAR(40),
    number_dep INT NOT NULL,

    CONSTRAINT pk_projects
    PRIMARY KEY(number),

    CONSTRAINT fk_project_department
    FOREIGN KEY(number_dep)
    REFERENCES department(number)
);
GO

CREATE TABLE dependent(
    name VARCHAR(30) NOT NULL,
    ssn CHAR(9) NOT NULL,
    sex CHAR(1),
    relationship VARCHAR(20),
    bdate DATE,

    CONSTRAINT pk_dependent
    PRIMARY KEY(name, ssn),

    CONSTRAINT fk_dependent_employee
    FOREIGN KEY(ssn)
    REFERENCES employee(ssn)
);
GO

CREATE TABLE works_on(
    ssn CHAR(9) NOT NULL,
    number_proj INT NOT NULL,
    hours DECIMAL(4,1),

    CONSTRAINT pk_works_on
    PRIMARY KEY(ssn, number_proj),

    CONSTRAINT fk_works_employee
    FOREIGN KEY(ssn)
    REFERENCES employee(ssn),

    CONSTRAINT fk_works_project
    FOREIGN KEY(number_proj)
    REFERENCES projects(number)
);
GO

INSERT INTO employee (ssn, firstname, lastname, address, bdate, salary, sex, jefe)
VALUES
('100000001', 'Juan', 'Pérez', 'Monterrey', '1980-05-12', 35000.00, 'M', NULL),
('100000002', 'María', 'Gómez', 'Guadalajara', '1985-08-20', 32000.00, 'F', NULL),
('100000003', 'Carlos', 'López', 'CDMX', '1990-11-15', 25000.00, 'M', NULL);
GO

UPDATE employee
SET jefe = '100000001'
WHERE ssn IN ('100000002','100000003');
GO

INSERT INTO department (number, name, manager, startdate)
VALUES
(1, 'Sistemas', '100000001', '2023-01-01'),
(2, 'Ventas', '100000002', '2023-02-15'),
(3, 'Recursos Humanos', '100000003', '2023-03-01');
GO

INSERT INTO locations (num_location, number_dep, location)
VALUES
(1, 1, 'Monterrey'),
(2, 2, 'Guadalajara'),
(3, 3, 'Ciudad de México');
GO

INSERT INTO projects (number, name, location, number_dep)
VALUES
(101, 'Sistema Escolar', 'Monterrey', 1),
(102, 'Sistema de Ventas', 'Guadalajara', 2),
(103, 'Portal RH', 'Ciudad de México', 3);
GO

INSERT INTO dependent (name, ssn, sex, relationship, bdate)
VALUES
('Luis', '100000001', 'M', 'Hijo', '2012-06-10'),
('Ana', '100000002', 'F', 'Hija', '2015-09-22'),
('Laura', '100000003', 'F', 'Esposa', '1992-03-18');
GO

INSERT INTO works_on (ssn, number_proj, hours)
VALUES
('100000001', 101, 35.5),
('100000002', 102, 40.0),
('100000003', 103, 30.0),
('100000001', 102, 10.0),
('100000002', 101, 15.5);
GO

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM locations;
SELECT * FROM projects;
SELECT * FROM dependent;
SELECT * FROM works_on;