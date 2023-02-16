-- JORGE ÁLVAREZ GRACIA

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.


SELECT p.nombre, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id


-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT p.nombre, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
ORDER BY f.nombre

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT p.id, p.nombre, p.id_fabricante, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id


-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT TOP(1) p.nombre, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
ORDER BY p.precio

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT TOP(1) p.nombre, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
ORDER BY p.precio DESC

-- Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT p.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo'

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT p.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial' AND p.precio >200

-- Devuelve un listado con todos los productos de los fabricantes Asus, . Sin utilizar el operador IN.

SELECT p.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus'


-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

SELECT p.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packardy Seagate'


-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT p.nombre, p.precio
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE RIGHT(f.nombre, 1) = 'e'


-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT p.nombre, p.precio
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%'


-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT p.nombre, p.precio, f.nombre
FROM Producto p
JOIN Fabricante f
ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY p.precio DESC , f.nombre ASC, P.nombre ASC;


-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT f.id, f.nombre
FROM Producto p
LEFT JOIN Fabricante f
ON p.id_fabricante = f.id
