CREATE DATABASE Bibliotecadigit;
USE Bibliotecadigit;
CREATE TABLE Usuario (
 id_usuario INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 email VARCHAR(150) UNIQUE NOT NULL,
 telefono VARCHAR(20),
 direccion TEXT NOT NULL
);
CREATE TABLE Libro (
 id_libro INT PRIMARY KEY AUTO_INCREMENT,
 titulo VARCHAR(255) NOT NULL,
 autor VARCHAR(150) NOT NULL,
 genero VARCHAR(100),
 año_publicacion INT CHECK (año_publicacion > 0),
 cantidad_disponible INT NOT NULL CHECK (cantidad_disponible >= 0)
);CREATE TABLE Prestamo (
 id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
 id_usuario INT NOT NULL,
 id_libro INT NOT NULL,
 fecha_prestamo DATE NOT NULL,
 fecha_devolucion DATE,
 estado ENUM('Activo', 'Devuelto', 'Retrasado') DEFAULT 'Activo',
 FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE
CASCADE,
 FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE
);
INSERT INTO Usuario (nombre, apellido, email, telefono, direccion) VALUES
('Alberto', 'Nuñez', 'alberto.nunez@email.com', '5551237890', 'Calle 111, Ciudad'),
('Beatriz', 'Salazar', 'beatriz.salazar@email.com', '5559873214', 'Avenida 222, Ciudad'),
('Cristian', 'Mora', 'cristian.mora@email.com', '5556541239', 'Pasaje 333, Ciudad'),
('Diana', 'Reyes', 'diana.reyes@email.com', '5557413698', 'Boulevard 444, Ciudad'),
('Emilio', 'Gutierrez', 'emilio.gutierrez@email.com', '5553697412', 'Calle 555, Ciudad'),
('Fernanda', 'Campos', 'fernanda.campos@email.com', '5552583697', 'Avenida 666, Ciudad'),
('Gerardo', 'Silva', 'gerardo.silva@email.com', '5557531598', 'Pasaje 777, Ciudad'),
('Helena', 'Fuentes', 'helena.fuentes@email.com', '5558527531', 'Calle 888, Ciudad'),
('Iván', 'Peña', 'ivan.pena@email.com', '5559632587', 'Boulevard 999, Ciudad'),
('Jessica', 'Lara', 'jessica.lara@email.com', '5551473698', 'Avenida 101, Ciudad');
INSERT INTO Libro (titulo, autor, genero, año_publicacion, cantidad_disponible) VALUES
('La sombra del viento', 'Carlos Ruiz Zafón', 'Misterio', 2001, 6),
('El nombre del viento', 'Patrick Rothfuss', 'Fantasía', 2007, 5),
('Los pilares de la Tierra', 'Ken Follett', 'Histórico', 1989, 8),
('La chica del tren', 'Paula Hawkins', 'Thriller', 2015, 4),
('El código Da Vinci', 'Dan Brown', 'Misterio', 2003, 7),
('Sapiens', 'Yuval Noah Harari', 'Historia', 2011, 5),
('It', 'Stephen King', 'Terror', 1986, 6),
('El Alquimista', 'Paulo Coelho', 'Filosofía', 1988, 9),
('El psicoanalista', 'John Katzenbach', 'Suspenso', 2002, 3),
('Bajo la misma estrella', 'John Green', 'Romance', 2012, 5);
INSERT INTO Prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 4, '2025-04-01', '2025-04-15', 'Devuelto'),
(2, 2, '2025-04-02', NULL, 'Activo'),
(3, 3, '2025-04-03', '2025-04-17', 'Devuelto'),
(4, 5, '2025-04-04', NULL, 'Retrasado'),
(5, 1, '2025-04-05', NULL, 'Activo'),
(6, 10, '2025-04-06', '2025-04-20', 'Devuelto'),
(7, 9, '2025-04-07', NULL, 'Activo'),
(8, 8, '2025-04-08', '2025-04-22', 'Devuelto'),
(9, 6, '2025-04-09', NULL, 'Retrasado'),
(10, 7, '2025-04-10', '2025-04-24', 'Devuelto');
SELECT U.nombre AS usuario, U.apellido,
 L.titulo AS libro, P.fecha_prestamo, P.fecha_devolucion, P.estado
FROM Prestamo P
JOIN Usuario U ON P.id_usuario = U.id_usuario
JOIN Libro L ON P.id_libro = L.id_libro
WHERE P.estado = 'Activo' AND U.id_usuario = 2;