CREATE DATABASE Tiendaenlinea;
USE Tiendaenlinea;
CREATE TABLE Cliente (
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(100) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 email VARCHAR(150) UNIQUE NOT NULL,
 telefono VARCHAR(20),
 direccion TEXT NOT NULL
);
CREATE TABLE Producto (
 id_producto INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
 precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
 stock INT NOT NULL CHECK (stock >= 0)
);
CREATE TABLE Pedido (
 id_pedido INT PRIMARY KEY AUTO_INCREMENT,
 id_cliente INT NOT NULL,
 fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
 estado ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') DEFAULT
'Pendiente',
 FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE
CASCADE
);
CREATE TABLE DetallePedido (
 id_detalle INT PRIMARY KEY AUTO_INCREMENT,
 id_pedido INT NOT NULL,
 id_producto INT NOT NULL,
 cantidad INT NOT NULL CHECK (cantidad > 0),
 precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario > 0),
 FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE
CASCADE,
 FOREIGN KEY (id_producto) REFERENCES Producto(id_producto) ON DELETE
CASCADE
);
INSERT INTO Cliente (nombre, apellido, email, telefono, direccion) VALUES
('Luis', 'Mendoza', 'luis.mendoza@email.com', '5551112233', 'Calle 101, Ciudad'),
('Andrea', 'Santos', 'andrea.santos@email.com', '5552223344', 'Avenida 202, Ciudad'),
('Ricardo', 'Fernandez', 'ricardo.fernandez@email.com', '5553334455', 'Calle 303, Ciudad'),
('Valeria', 'Gomez', 'valeria.gomez@email.com', '5554445566', 'Boulevard 404, Ciudad'),
('Manuel', 'Rojas', 'manuel.rojas@email.com', '5555556677', 'Calle 505, Ciudad'),
('Carolina', 'Diaz', 'carolina.diaz@email.com', '5556667788', 'Avenida 606, Ciudad'),
('Jorge', 'Castro', 'jorge.castro@email.com', '5557778899', 'Pasaje 707, Ciudad'),
('Natalia', 'Suarez', 'natalia.suarez@email.com', '5558889900', 'Calle 808, Ciudad'),
('Felipe', 'Vega', 'felipe.vega@email.com', '5559990011', 'Avenida 909, Ciudad'),
('Gabriela', 'Hernandez', 'gabriela.hernandez@email.com', '5550001122', 'Calle 010, Ciudad');

INSERT INTO Producto (nombre, descripcion, precio, stock) VALUES
('Laptop Dell XPS 13', 'Laptop ultraligera con Intel Core i7 y 16GB RAM', 1200.00, 20),
('Mouse Razer DeathAdder', 'Mouse ergonómico para gaming', 59.99, 50),
('Teclado Logitech MX Keys', 'Teclado inalámbrico con teclas retroiluminadas', 99.99, 25),
('Monitor LG 27"', 'Monitor LED 4K UHD', 350.00, 15),
('SSD Kingston 500GB', 'Unidad de almacenamiento rápida NVMe', 75.00, 30),
('Silla Ergonómica Hbada', 'Silla de oficina con soporte lumbar', 180.00, 10),
('Smartphone iPhone 14', 'Teléfono con pantalla OLED y 128GB de almacenamiento', 999.00, 15),
('Audífonos Bose QC45', 'Auriculares con cancelación de ruido', 279.99, 20),
('Tarjeta de Video RX 6700 XT', 'GPU para gaming de alta gama', 479.00, 12),
('Impresora HP LaserJet Pro', 'Impresora láser monocromática', 160.00, 18);

INSERT INTO Pedido (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-03-21 10:00:00', 'Entregado'),
(2, '2025-03-22 15:30:00', 'Pendiente'),
(3, '2025-03-23 18:45:00', 'Enviado'),
(4, '2025-03-24 12:10:00', 'Cancelado'),
(5, '2025-03-25 14:20:00', 'Entregado'),
(6, '2025-03-26 17:50:00', 'Pendiente'),
(7, '2025-03-27 11:35:00', 'Entregado'),
(8, '2025-03-28 16:40:00', 'Enviado'),
(9, '2025-03-29 19:25:00', 'Cancelado'),
(10, '2025-03-30 13:50:00', 'Pendiente');

INSERT INTO DetallePedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200.00),
(1, 5, 2, 75.00),
(2, 2, 1, 59.99),
(2, 3, 1, 99.99),
(3, 4, 1, 350.00),
(3, 6, 1, 180.00),
(4, 7, 1, 999.00),
(4, 8, 1, 279.99),
(5, 9, 1, 479.00),
(5, 10, 1, 160.00);

SELECT C.nombre AS cliente, C.apellido AS apellido,
 P.nombre AS producto, DP.cantidad, DP.precio_unitario,
 (DP.cantidad * DP.precio_unitario) AS total
FROM DetallePedido DP
JOIN Pedido Pe ON DP.id_pedido = Pe.id_pedido
JOIN Cliente C ON Pe.id_cliente = C.id_cliente
JOIN Producto P ON DP.id_producto = P.id_producto
WHERE C.id_cliente = 8; -- Cambia el ID para consultar otro client
