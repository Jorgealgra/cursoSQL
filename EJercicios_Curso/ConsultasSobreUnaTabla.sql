-- JORGE ÁLVAREZ GRACIA

-- Lista el nombre de todos los productos que hay en la tabla producto.

SELECT p.nombre 
FROM Producto p

-- Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT p.nombre, p.precio
FROM Producto p

-- Lista todas las columnas de la tabla producto.

SELECT *
FROM Producto p

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT p.nombre, p.precio, p.precio*1.1

FROM Producto p


-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT p.nombre, p.precio as precio_eur, p.precio*1.1 as precio_usd

FROM Producto p

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(p.nombre) as NOMBRE, p.precio
FROM Producto p

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(p.nombre) as nombre, p.precio
FROM Producto p

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT f.nombre, LEFT(UPPER(f.nombre),2)
FROM Fabricante F 

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT p.nombre, ROUND(p.precio,0)
FROM Producto p


-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.


SELECT p.nombre, ROUND(p.precio,0,1)
FROM Producto p


-- Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT f.id
FROM Producto p, Fabricante f
WHERE p.id_fabricante = f.id


-- Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.


SELECT DISTINCT f.id
FROM Producto p, Fabricante f
WHERE p.id_fabricante = f.id

-- Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT f.nombre
FROM Fabricante f
ORDER BY f.nombre 

-- Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT f.nombre
FROM Fabricante f
ORDER BY f.nombre DESC


-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT p.nombre
FROM Producto p
ORDER BY p.nombre ASC, p.precio DESC

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT *
FROM Fabricante f
WHERE f.id < 6

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

SELECT *
FROM Fabricante f
WHERE  f.id > 3 AND f.id < 6

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT TOP(1) p.nombre,  p.precio
FROM Producto p
ORDER BY p.precio ASC, p.nombre 

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT TOP(1) p.nombre,  p.precio
FROM Producto p
ORDER BY p.precio DESC, p.nombre 

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

SELECT f.nombre
FROM Fabricante f
WHERE f.id > 1

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT p.nombre
FROM Producto p
WHERE p.precio < 121

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT p.nombre
FROM Producto p
WHERE p.precio > 399

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT p.nombre
FROM Producto p
WHERE p.precio < 400

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT p.nombre
FROM Producto p
WHERE  80 < p.precio AND p.precio < 300

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT p.nombre
FROM Producto p
WHERE p.precio BETWEEN 60 AND 200


-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.

SELECT p.nombre
FROM Producto p
WHERE  p.id = 6 AND p.precio > 200

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT p.nombre
FROM Producto p
WHERE  p.id = 1 OR p.id = 3 OR p.id = 5


-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT p.nombre
FROM Producto p
WHERE  p.id IN( 1,3,5)


-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT p.nombre, p.precio*100 AS céntimos
FROM Producto p

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.-- 

SELECT f.nombre
FROM Fabricante f
WHERE LEFT(f.nombre,1) = 'S'


-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT f.nombre
FROM Fabricante f
WHERE RIGHT(f.nombre,1) = 'e'


-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT f.nombre
FROM Fabricante f
WHERE f.nombre LIKE '%w%'

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT f.nombre
FROM Fabricante f
WHERE LEN(f.nombre) = 4

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT p.nombre
FROM Producto p
WHERE p.nombre LIKE '%Portátil%'

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT p.nombre
FROM Producto p
WHERE p.nombre LIKE '%Monitor%' AND	p.precio < 215

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT p.nombre, p.precio
FROM Producto p
WHERE p.precio >= 180