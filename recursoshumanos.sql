CREATE DATABASE Recursoshumanos;
USE Recursoshumanos;
CREATE TABLE Empresa(
    id_empresa     INT PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR (20)
);
CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100),
    ubicacion VARCHAR(200),
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);
);
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    fecha_ingreso DATE,
    salario DECIMAL (10, 2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES
    Departamento (id_departamento)
);
INSERT INTO Empresa (nombre_empresa, direccion, telefono) VALUES
('Tech Solutions', 'Av. Reforma 1000, Ciudad de México', '555-1234'),
('Innovative Systems', 'Calle del Sol 250, Monterrey', '555-5678'),
('Global Enterprises', 'Paseo de la Reforma 200, Guadalajara', '555-9101'),
('HealthCare Inc.', 'Calle San Pedro 300, Mérida', '555-1122'),
('Retail Corp.', 'Avenida Juárez 500, Puebla', '555-3344'),
('Financial Group', 'Calle Hidalgo 400, Querétaro', '555-5566'),
('Creative Minds', 'Avenida 16 de Septiembre 600, León', '555-7788'),
('Media World', 'Calle de la Luna 150, Cancún', '555-9900'),
('E-commerce Ltd.', 'Avenida Insurgentes 700, Tijuana', '555-2233'),
('Smart Technologies', 'Calle de la Paz 800, Oaxaca', '555-4455');

-- Insertar 10 registros en la tabla Departamento
INSERT INTO Departamento (nombre_departamento, ubicacion, id_empresa) VALUES
('Tecnología', 'Piso 1', 1),
('Investigación y Desarrollo', 'Piso 2', 2),
('Finanzas', 'Piso 3', 3),
('Recursos Humanos', 'Piso 4', 4),
('Ventas', 'Piso 5', 5),
('Marketing', 'Piso 6', 6),
('Atención al Cliente', 'Piso 7', 7),
('Logística', 'Piso 8', 8),
('Operaciones', 'Piso 9', 9),
('Administración', 'Piso 10', 10);

-- Insertar 10 registros en la tabla Empleado
INSERT INTO Empleado (nombre, apellido, fecha_nacimiento, fecha_ingreso, salario, id_departamento) VALUES
('Juan', 'Pérez', '1985-06-15', '2020-01-10', 35000.00, 1),
('María', 'González', '1990-02-25', '2021-03-15', 40000.00, 2),
('Carlos', 'Rodríguez', '1987-11-05', '2019-07-22', 45000.00, 3),
('Ana', 'López', '1983-04-18', '2018-05-30', 30000.00, 4),
('Pedro', 'Martínez', '1992-09-10', '2022-08-17', 38000.00, 5),
('Laura', 'Hernández', '1988-12-20', '2017-06-11', 50000.00, 6),
('David', 'Gómez', '1986-03-25', '2020-12-02', 42000.00, 7),
('Sofía', 'Ramírez', '1994-07-13', '2021-05-19', 35000.00, 8),
('Luis', 'Sánchez', '1991-10-22', '2018-09-15', 45000.00, 9),
('Elena', 'Torres', '1989-01-30', '2019-03-23', 37000.00, 10);

SELECT E.nombre, E.apellido, E.fecha_nacimiento, E.fecha_ingreso, E.salario,
D.nombre_departamento
FROM Empleado E
JOIN Departamento D ON E.id_departamento = D.id_departamento
WHERE D.nombre_departamento = 'Tecnologia';