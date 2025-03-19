CREATE DATABASE Cursosonline;
USE Cursosonline;
CREATE TABLE Usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE
);
CREATE TABLE Curso (
    id_curso INT  PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    duracion_hora INT
);
CREATE TABLE Inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_ususario INT,
    id_curso INT,
    fecha_inscripcion DATE,
    estado VARCHAR(50),

    FOREIGN KEY (id_ususario) REFERENCES
    Usuario (id_usuario),
    FOREIGN KEY (id_curso) REFERENCES
    Curso (id_curso)
);
INSERT INTO Usuario (nombre, apellido, email, fecha_registro) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '2024-01-10'),
('María', 'López', 'maria.lopez@email.com', '2024-01-12'),
('Carlos', 'Ramírez', 'carlos.ramirez@email.com', '2024-02-05'),
('Ana', 'Gómez', 'ana.gomez@email.com', '2024-02-20'),
('Pedro', 'Sánchez', 'pedro.sanchez@email.com', '2024-03-01'),
('Lucía', 'Martínez', 'lucia.martinez@email.com', '2024-03-15'),
('Diego', 'Fernández', 'diego.fernandez@email.com', '2024-03-18'),
('Elena', 'Torres', 'elena.torres@email.com', '2024-03-25'),
('Roberto', 'Díaz', 'roberto.diaz@email.com', '2024-04-02'),
('Laura', 'Castillo', 'laura.castillo@email.com', '2024-04-10');

INSERT INTO Curso (nombre_curso, descripcion, fecha_inicio, fecha_fin, duracion_hora) VALUES
('Python Básico', 'Curso introductorio de Python', '2024-04-01', '2024-04-30', 40),
('SQL para Principiantes', 'Aprende las bases de SQL', '2024-04-05', '2024-04-20', 20),
('Desarrollo Web', 'HTML, CSS y JavaScript desde cero', '2024-04-10', '2024-05-10', 50),
('Java Avanzado', 'Conceptos avanzados de Java', '2024-04-15', '2024-05-15', 60),
('Machine Learning', 'Introducción a Machine Learning', '2024-05-01', '2024-06-01', 45),
('Ciberseguridad', 'Conceptos de seguridad informática', '2024-05-05', '2024-06-05', 30),
('Big Data', 'Introducción a Big Data', '2024-05-10', '2024-06-10', 35),
('Desarrollo Móvil', 'Apps con Android e iOS', '2024-05-15', '2024-06-15', 50),
('Redes y Servidores', 'Configuración de redes y servidores', '2024-05-20', '2024-06-20', 40),
('UX/UI', 'Diseño de experiencia de usuario', '2024-05-25', '2024-06-25', 25);

INSERT INTO Inscripcion (id_ususario, id_curso, fecha_inscripcion, estado) VALUES
(1, 1, '2024-04-02', 'Activo'),
(2, 2, '2024-04-06', 'Activo'),
(3, 3, '2024-04-12', 'Completado'),
(4, 4, '2024-04-18', 'Activo'),
(5, 5, '2024-05-02', 'Pendiente'),
(6, 6, '2024-05-06', 'Activo'),
(7, 7, '2024-05-12', 'Pendiente'),
(8, 8, '2024-05-18', 'Completado'),
(9, 9, '2024-05-22', 'Activo'),
(10, 10, '2024-05-26', 'Pendiente');
SELECT U.nombre, U.apellido, C.nombre_curso, C.descripcion,
I.fecha_inscripcion, I.estado
FROM Inscripcion I
JOIN Usuario U ON I.id_ususario = U.id_usuario
JOIN Curso C ON I.id_curso = C.id_curso
WHERE U.id_usuario = 1;