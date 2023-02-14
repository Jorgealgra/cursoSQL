--Ejercicio 1 JORGE ALVAREZ

--Crear base de datos: 

--CREATE DATABASE TiendaInformatica;

USE TiendaInformatica;


CREATE TABLE Fabricante(
id INT NOT NULL,
nombre NVARCHAR(50) NOT NULL, 

)
INSERT INTO Fabricante (id, nombre) VALUES (1, 'Asus')
INSERT INTO Fabricante (id, nombre) VALUES (2, 'Lenovo')
INSERT INTO Fabricante (id, nombre) VALUES (3, 'Hewlett-Packard')
INSERT INTO Fabricante (id, nombre) VALUES (4, 'Samsung')
INSERT INTO Fabricante (id, nombre) VALUES (5, 'Seagate')
INSERT INTO Fabricante (id, nombre) VALUES (6, 'Crucial')
INSERT INTO Fabricante (id, nombre) VALUES (7, 'Gigabyte')
INSERT INTO Fabricante (id, nombre) VALUES (8, 'Huawei')
INSERT INTO Fabricante (id, nombre) VALUES (9, 'Xiaomi')
;


CREATE TABLE Producto(
id INT NOT NULL,
nombre NVARCHAR(50) NOT NULL, 
precio FLOAT NOT NULL,
id_fabricante INT NOT NULL
);


INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (2, 'Memoria RAM DDR4 8GB', 120,6)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (3, 'Disco SSD 1 TB', 150.99,4)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (4, 'GeForce GTX 1050Ti', 185,7)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (5, 'GeForce GTX 1080 Xtreme', 755,6)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (6, 'Monitor 24 LED Full HD', 202,1)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (7, 'Monitor 27 LED Full HD', 245.99,1)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (8, 'Portátil Yoga 520', 559,2)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (9, 'Portátil Ideapd 320', 444,2)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (10, 'Impresora HP Deskjet 3720', 59.99,3)
INSERT INTO Producto (id, nombre, precio, id_fabricante) 
VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180,3)
;