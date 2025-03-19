CREATE DATABASE IF NOT EXISTS gestióndehospital;
USE gestióndehospital;

CREATE TABLE Pacientes (
    id_pacientes INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido varchar(50),
   fecha_nacimiento DATE,
    telefono VARCHAR(15),
    direccion VARCHAR(100),
    email VARCHAR(50) UNIQUE
);
CREATE TABLE Medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50)UNIQUE
);
CREATE TABLE Citas
(
    id_cita      INT PRIMARY KEY AUTO_INCREMENT,
    id_pacientes INT,
    id_medico    INT,
    fecha        DATE,
    hora         TIME,
    motivo       VARCHAR(100),
    FOREIGN KEY (id_pacientes) REFERENCES Pacientes (id_pacientes) ON
        DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES Medico (id_medico) ON DELETE
        CASCADE
);
CREATE TABLE Tratamiento
(
    id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    id_pacientes   INT,
    diagnostico    VARCHAR(100),
    medicamento    VARCHAR(100),
    duracion       VARCHAR(50),
    FOREIGN KEY (id_pacientes) REFERENCES Pacientes (id_pacientes) ON
        DELETE CASCADE
);
INSERT INTO Pacientes (nombre, apellido, fecha_nacimiento, telefono, direccion, email) VALUES
('Carlos', 'Ramírez', '1985-03-12', '555-1234', 'Av. Reforma 123', 'carlos.ramirez@email.com'),
('Ana', 'Gómez', '1992-07-24', '555-5678', 'Calle Juárez 45', 'ana.gomez@email.com'),
('Pedro', 'Sánchez', '1978-05-09', '555-8765', 'Blvd. Hidalgo 78', 'pedro.sanchez@email.com'),
('Laura', 'Fernández', '1995-11-30', '555-4321', 'Calle Morelos 321', 'laura.fernandez@email.com'),
('Diego', 'Torres', '1989-01-15', '555-6789', 'Av. Universidad 987', 'diego.torres@email.com'),
('Sofía', 'Martínez', '2000-09-18', '555-2468', 'Calle Independencia 56', 'sofia.martinez@email.com'),
('Javier', 'López', '1982-04-07', '555-1357', 'Blvd. Revolución 789', 'javier.lopez@email.com'),
('Mariana', 'Díaz', '1993-06-22', '555-3698', 'Calle Hidalgo 111', 'mariana.diaz@email.com'),
('Ricardo', 'Castillo', '1987-12-01', '555-9876', 'Av. Insurgentes 654', 'ricardo.castillo@email.com'),
('Gabriela', 'Mendoza', '1990-08-14', '555-7410', 'Calle Allende 333', 'gabriela.mendoza@email.com');

INSERT INTO Medico (nombre, apellido, especialidad, telefono, email) VALUES
('José', 'Pérez', 'Cardiología', '555-1111', 'jose.perez@hospital.com'),
('María', 'Luna', 'Neurología', '555-2222', 'maria.luna@hospital.com'),
('Fernando', 'Rojas', 'Pediatría', '555-3333', 'fernando.rojas@hospital.com'),
('Andrea', 'Vega', 'Ortopedia', '555-4444', 'andrea.vega@hospital.com'),
('Luis', 'Hernández', 'Gastroenterología', '555-5555', 'luis.hernandez@hospital.com'),
('Clara', 'Santos', 'Dermatología', '555-6666', 'clara.santos@hospital.com'),
('Carlos', 'Medina', 'Oftalmología', '555-7777', 'carlos.medina@hospital.com'),
('Elena', 'Ortega', 'Ginecología', '555-8888', 'elena.ortega@hospital.com'),
('Manuel', 'Ruiz', 'Urología', '555-9999', 'manuel.ruiz@hospital.com'),
('Patricia', 'Nava', 'Endocrinología', '555-0000', 'patricia.nava@hospital.com');

INSERT INTO Citas (id_pacientes, id_medico, fecha, hora, motivo) VALUES
(1, 1, '2024-03-20', '09:30:00', 'Chequeo de presión arterial'),
(2, 2, '2024-03-21', '10:00:00', 'Dolor de cabeza frecuente'),
(3, 3, '2024-03-22', '11:00:00', 'Revisión pediátrica'),
(4, 4, '2024-03-23', '12:30:00', 'Dolor en rodilla izquierda'),
(5, 5, '2024-03-24', '14:00:00', 'Malestar estomacal'),
(6, 6, '2024-03-25', '15:00:00', 'Revisión de lunares en la piel'),
(7, 7, '2024-03-26', '16:00:00', 'Problemas de visión'),
(8, 8, '2024-03-27', '09:00:00', 'Control ginecológico'),
(9, 9, '2024-03-28', '10:30:00', 'Chequeo de próstata'),
(10, 10, '2024-03-29', '11:45:00', 'Chequeo de niveles de glucosa');

INSERT INTO Tratamiento (id_pacientes, diagnostico, medicamento, duracion) VALUES
(1, 'Hipertensión', 'Losartán 50mg', '6 meses'),
(2, 'Migraña crónica', 'Sumatriptán 100mg', 'Indefinido'),
(3, 'Resfriado común', 'Paracetamol 500mg', '5 días'),
(4, 'Lesión de ligamentos', 'Ibuprofeno 400mg', '2 semanas'),
(5, 'Gastritis', 'Omeprazol 20mg', '1 mes'),
(6, 'Dermatitis', 'Cremas tópicas', '3 semanas'),
(7, 'Miopía', 'Uso de lentes', 'Permanente'),
(8, 'Quiste ovárico', 'Anticonceptivos hormonales', '6 meses'),
(9, 'Hiperplasia prostática', 'Tamsulosina 0.4mg', 'Indefinido'),
(10, 'Diabetes tipo 2', 'Metformina 850mg', 'Permanente');
SELECT P.nombre As paciente, P.apellido AS apellido_paciente,
       C.id_cita, C.fecha, C.hora, C.motivo,
       M.nombre AS medico, M.apellido AS apellido_medico,
       M.especialidad
FROM Citas C
JOIN Pacientes P on P.id_pacientes = C.id_pacientes
JOIN Medico M on C.id_medico = M.id_medico
WHERE C.id_pacientes = 5
