-- Calcula el n�mero total de productos que hay en la tabla productos.

SELECT COUNT ( p.nombre) AS NumeroTotal
FROM Producto p 

-- Calcula el n�mero total de fabricantes que hay en la tabla fabricante.

SELECT COUNT ( f.nombre) AS NumeroTotalFabricantes
FROM Fabricante f 

-- Calcula el n�mero de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT COUNT ( p.id_fabricante) AS NumeroTotalFabricantes
FROM Producto p 


-- Calcula la media del precio de todos los productos.

-- Calcula el precio m�s barato de todos los productos.

-- Calcula el precio m�s caro de todos los productos.

-- Lista el nombre y el precio del producto m�s barato.

-- Lista el nombre y el precio del producto m�s caro.

-- Calcula la suma de los precios de todos los productos.

-- Calcula el n�mero de productos que tiene el fabricante Asus.

-- Calcula la media del precio de todos los productos del fabricante Asus.

-- Calcula el precio m�s barato de todos los productos del fabricante Asus.

-- Calcula el precio m�s caro de todos los productos del fabricante Asus.

-- Calcula la suma de todos los productos del fabricante Asus.

-- Muestra el precio m�ximo, precio m�nimo, precio medio y el n�mero total de productos que tiene el fabricante Crucial.

-- Muestra el n�mero total de productos que tiene cada uno de los fabricantes. El listado tambi�n debe incluir los fabricantes que no tienen ning�n producto. El resultado mostrar� dos columnas, una con el nombre del fabricante y otra con el n�mero de productos que tiene. Ordene el resultado descendentemente por el n�mero de productos.

-- Muestra el precio m�ximo, precio m�nimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrar� el nombre del fabricante junto con los datos que se solicitan.

-- Muestra el precio m�ximo, precio m�nimo, precio medio y el n�mero total de productos de los fabricantes que tienen un precio medio superior a 200�. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.

-- Muestra el nombre de cada fabricante, junto con el precio m�ximo, precio m�nimo, precio medio y el n�mero total de productos de los fabricantes que tienen un precio medio superior a 200�. Es necesario mostrar el nombre del fabricante.

-- Calcula el n�mero de productos que tienen un precio mayor o igual a 180�.

-- Calcula el n�mero de productos que tiene cada fabricante con un precio mayor o igual a 180�.

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150�.

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o m�s productos.

-- Devuelve un listado con los nombres de los fabricantes y el n�mero de productos que tiene cada uno con un precio superior o igual a 220 �. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condici�n.

-- Devuelve un listado con los nombres de los fabricantes y el n�mero de productos que tiene cada uno con un precio superior o igual a 220 �. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay alg�n fabricante que no tiene productos con un precio superior o igual a 220� deber� aparecer en el listado con un valor igual a 0 en el n�mero de productos.

-- Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 �.

-- Devuelve un listado con el nombre del producto m�s caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfab�ticamente de menor a mayor por el nombre del fabricante.