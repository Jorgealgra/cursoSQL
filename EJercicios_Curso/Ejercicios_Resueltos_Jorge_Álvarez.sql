--Ejercicio PROVEEDORES - JORGE ALVAREZ

--Crear base de datos: 

--CREATE DATABASE Fabrica;

USE Fabrica;

--- TABLA PROVEEDORES ----

CREATE TABLE PROVEEDORES(
P# NVARCHAR(10) NOT NULL,
PNOMBRE NVARCHAR(50) NOT NULL,
CATEGORIA INT NOT NULL,
CIUDAD NVARCHAR(50) NOT NULL, 
PRIMARY KEY (P#)
)

INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P1', 'CARLOS', 20, 'SEVILLA')
INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P2', 'JUAN', 10, 'MADRID')
INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P3', 'JOSE', 30, 'SEVILLA')
INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P4', 'INMA', 20, 'SEVILLA')
INSERT INTO PROVEEDORES (P#, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P5', 'EVA', 30, 'CACERES')
;

--SELECT * FROM PROVEEDORES

--- TABLA COMPONENTES  ----

CREATE TABLE COMPONENTES(
C# NVARCHAR(10) NOT NULL,
CNOMBRE NVARCHAR(50) NOT NULL,
COLOR NVARCHAR(50) NOT NULL,
PESO INT NOT NULL,
CIUDAD NVARCHAR(50) NOT NULL, 
PRIMARY KEY (C#)
)

INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C1', 'X3A', 'ROJO', 12, 'SEVILLA')
INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C2', 'B85', 'VERDE', 17, 'MADRID')
INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C3', 'C4B', 'AZUL', 17, 'MALAGA')
INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C4', 'C4B', 'ROJO', 14, 'SEVILLA')
INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C5', 'VT8', 'AZUL', 12, 'MADRID')
INSERT INTO COMPONENTES (C#, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C6', 'C30', 'ROJO', 19, 'SEVILLA')
;


--SELECT * FROM COMPONENTES

--- TABLA ARTICULOS  ----

CREATE TABLE ARTICULOS(
T# NVARCHAR(10) NOT NULL,
TNOMBRE NVARCHAR(50) NOT NULL,
CIUDAD NVARCHAR(50) NOT NULL, 
PRIMARY KEY (T#)
)

INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T1', 'CLASIFICADORA', 'MADRID')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T2', 'PERFORADORA', 'MALAGA')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T3', 'LECTORA', 'CACERES')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T4', 'CONSOLA', 'CACERES')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T5', 'MEZCLADORA', 'SEVILLA')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T6', 'TERMINAL', 'BARCELONA')
INSERT INTO ARTICULOS (T#, TNOMBRE, CIUDAD) VALUES ('T7', 'CINTA', 'SEVILLA')
;

--SELECT * FROM ARTICULOS



--- TABLA ARTICULOS  ----

CREATE TABLE ENVIOS(
P# NVARCHAR(10) NOT NULL,
C# NVARCHAR(10) NOT NULL,
T# NVARCHAR(10) NOT NULL,
CANTIDAD INT, 
)

INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P1', 'C1', 'T1', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P1', 'C1', 'T4', 700)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T1', 400)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T2', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T3', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T4', 500)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T5', 600)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T6', 400)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C3', 'T7', 800)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P2', 'C5', 'T2', 100)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P3', 'C3', 'T1', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P3', 'C4', 'T2', 500)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P4', 'C6', 'T3', 300)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P4', 'C6', 'T7', 300)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C2', 'T2', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C2', 'T4', 100)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C5', 'T4', 500)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C5', 'T7', 100)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C6', 'T2', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C1', 'T4', 100)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C3', 'T4', 200)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C4', 'T4', 800)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C5', 'T5', 400)
INSERT INTO ENVIOS (P#, C#, T#, CANTIDAD) VALUES ('P5', 'C6', 'T4', 500)
;

--SELECT * FROM ENVIOS


--  EJERCICIOS RESUELTOS


--1. Obtener todos los detalles de todos los art�culos de CACERES. 

SELECT * FROM ARTICULOS WHERE CIUDAD = 'CACERES'

--2. Obtener todos los valores de P# para los proveedores que abastecen el art�culo T1. 

SELECT p.P# FROM PROVEEDORES p
JOIN ENVIOS e ON p.P# = e.P#
WHERE T# = 'T1'

--3. Obtener la lista de pares de atributos (COLOR, CIUDAD) de la tabla componentes 
--eliminando los pares duplicados. 

SELECT DISTINCT COLOR, CIUDAD FROM COMPONENTES 

--4. Obtener de la tabla de art�culos los valores de T# y CIUDAD donde el nombre de la 
--ciudad acaba en D o contiene al menos una E. 

SELECT T#, CIUDAD FROM ARTICULOS 
WHERE CIUDAD LIKE '%E%' OR CIUDAD LIKE  '%D'

--5. Obtener los valores de P# para los proveedores que suministran para el art�culo T1 el 
--componente C1. 

SELECT p.P# FROM PROVEEDORES p
JOIN ENVIOS e ON p.P# = e.P#
WHERE T# = 'T1' AND C# = 'C1'

--6. Obtener los valores de TNOMBRE en orden alfab�tico para los art�culos abastecidos por el proveedor P1. 

SELECT a.TNOMBRE FROM ARTICULOS a
JOIN ENVIOS e ON a.T# = e.T#
WHERE P# = 'P1'
ORDER BY TNOMBRE ASC

--7. Obtener los valores de C# para los componentes suministrados para cualquier art�culo de MADRID. 

SELECT c.C# FROM COMPONENTES c
JOIN ENVIOS e ON c.C# = e.C#
JOIN ARTICULOS a ON a.T# = e.T#
WHERE a.CIUDAD = 'MADRID'


--8. Obtener todos los valores de C# de los componentes tales que ning�n otro componente tenga un valor de peso inferior. 

SELECT c.C# 
FROM COMPONENTES c 
WHERE c.PESO = (
				SELECT MIN(cc.PESO)
				FROM COMPONENTES cc)


--9. Obtener los valores de P# para los proveedores que suministren los art�culos T1 y T2. 

SELECT e.P#
FROM ENVIOS e
WHERE e.T# = 'T1'
INTERSECT
SELECT e.P#
FROM ENVIOS e
WHERE e.T# = 'T2'

--10. Obtener los valores de P# para los proveedores que suministran para un art�culo de SEVILLA o MADRID un componente ROJO. 

SELECT p.P#
FROM PROVEEDORES p
WHERE p.CIUDAD  IN ( 'SEVILLA' ,'MADRID')

--11. Obtener, mediante subconsultas, los valores de C# para los componentes suministrados para alg�n art�culo de SEVILLA por un proveedor de SEVILLA. 

SELECT c.C# 
FROM COMPONENTES c
JOIN ENVIOS e ON e.C# = c.C#
JOIN ARTICULOS a ON a.T# = e.T#
WHERE e.P# IN 
	(SELECT p.P#
	FROM PROVEEDORES p
	WHERE P.CIUDAD = 'SEVILLA') 
AND  a.T# IN 
	(SELECT a.T#
	FROM ARTICULOS a
	WHERE a.CIUDAD = 'SEVILLA') 


--12. Obtener los valores de T# para los art�culos que usan al menos un componente que se puede obtener con el proveedor P1. 

SELECT a.T#, e.P#
FROM ARTICULOS a
JOIN ENVIOS e ON e.T# = a.T#
JOIN COMPONENTES c ON e.C# = c.C#
WHERE e.C# IN ( 
		SELECT e.P# FROM ENVIOS e WHERE e.P# = 'P1')

--13. Obtener todas las ternas (CIUDAD, C#, CIUDAD) tales que un proveedor de la primera ciudad 
--suministre el componente especificado para un art�culo montado en la segunda ciudad. 

SELECT p.CIUDAD, c.C#, c.CIUDAD
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
JOIN COMPONENTES c ON e.C# = c.C#
WHERE p.CIUDAD = c.CIUDAD --REVISAR

--14. Repetir el ejercicio anterior pero sin recuperar las ternas en los que los dos valores de ciudad sean los mismos. 

SELECT p.CIUDAD, c.C#, c.CIUDAD
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
JOIN COMPONENTES c ON e.C# = c.C#
WHERE p.CIUDAD != c.CIUDAD

--15. Obtener el n�mero de suministros, el de art�culos distintos suministrados y la cantidad total de art�culos suministrados por el proveedor P2. 

SELECT  a.TNOMBRE, COUNT(p.P#) AS N_SUMINISTROS, SUM(e.CANTIDAD) AS CANTIDAD_TOTAL
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
JOIN ARTICULOS a ON a.T# = e.T#
WHERE p.P# = 'P2'
GROUP BY p.P#, e.CANTIDAD, a.TNOMBRE


--16. Para cada art�culo y componente suministrado obtener los valores de C#, T# 
-- y la cantidad total correspondiente. 

SELECT  a.T#, c.C#, e.CANTIDAD
FROM COMPONENTES c
JOIN ENVIOS e ON e.C# = c.C#
JOIN ARTICULOS a ON a.T# = e.T#

--17. Obtener los valores de T# de los art�culos abastecidos al menos por un proveedor que no 
--viva en MADRID y que no est� en la misma ciudad en la que se monta el art�culo. 

SELECT  a.T#
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
JOIN ARTICULOS a ON a.T# = e.T#
WHERE p.CIUDAD NOT IN  ('Madrid')


--18. Obtener los valores de P# para los proveedores que suministran al menos un componente 
--suministrado al menos por un proveedor que suministra al menos un componente ROJO. 


SELECT DISTINCT p.P#
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
WHERE e.C# IN (
SELECT c.C# FROM COMPONENTES c
WHERE c.COLOR = 'ROJO')

--19. Obtener los identificadores de art�culos, T#, para los que se ha suministrado alg�n 
--componente del que se haya suministrado una media superior a 320 art�culos. 

SELECT DISTINCT e.T#
FROM ENVIOS e
WHERE e.C# IN (
SELECT e.C# AS componente_cantidad FROM ENVIOS e
GROUP BY e.C#
HAVING AVG(e.CANTIDAD) > 320)


--20. Seleccionar los identificadores de proveedores que hayan realizado alg�n env�o con 
--Cantidad mayor que la media de los env�os realizados para el componente a que 
--corresponda dicho env�o. 


SELECT e.P#
FROM ENVIOS e
WHERE e.C# in ( SELECT e.C#  FROM ENVIOS e
GROUP BY e.C#
HAVING AVG(e.CANTIDAD) > e.CANTIDAD) --ACABAR


--21. Seleccionar los identificadores de componentes suministrados para el art�culo 'T2' por el proveedor 'P2'. 

SELECT c.C#
FROM COMPONENTES c 
JOIN ENVIOS e on e.C# = c.C#
WHERE e.T# = 'T2' AND e.P# = 'P2'


--22. Seleccionar todos los datos de los env�os realizados de componentes cuyo color no sea 'ROJO'. 

SELECT *
FROM ENVIOS e 
JOIN COMPONENTES c on e.C# = c.C#
WHERE c.COLOR != 'ROJO'

--23. Seleccionar los identificadores de componentes que se suministren para los art�culos 'T1' y 'T2'. 

SELECT DISTINCT e.C# 
FROM ENVIOS e
WHERE e.T# IN ('T1','T2')

--24. Seleccionar el identificador de proveedor y el n�mero de env�os de componentes de color 
--'ROJO' llevados a cabo por cada proveedor. 

SELECT p.P#, COUNT(e.C#) AS NUMERO_ENVIOS
FROM PROVEEDORES p 
JOIN ENVIOS e on e.P# = p.P#
GROUP BY e.C#, p.P#
HAVING e.C# IN (SELECT c.C# FROM COMPONENTES c WHERE c.COLOR IN ('ROJO'))


--25. Seleccionar los colores de componentes suministrados por el proveedor 'P1'. 

SELECT c.COLOR
FROM COMPONENTES c
JOIN ENVIOS e on e.C# = c.C#
WHERE e.P# IN ('P1')


--26. Seleccionar los datos de env�o y nombre de ciudad de aquellos env�os que cumplan que 
--el art�culo, proveedor y componente son de la misma ciudad.

SELECT e.P#, e.C#, e.T#, e.CANTIDAD, c.CIUDAD
FROM ENVIOS e 
JOIN PROVEEDORES p ON p.P# = e.P#
JOIN COMPONENTES c ON c.C# = e.C#
JOIN ARTICULOS a ON a.T# = e.T#
WHERE a.CIUDAD = p.CIUDAD AND p.CIUDAD = c.CIUDAD

--27. Seleccionar los nombres de los componentes que son suministrados en una cantidad total 
--superior a 500. 


SELECT c.CNOMBRE
FROM COMPONENTES c
JOIN ENVIOS e ON  e.C# = c.C#
GROUP BY e.C#,c.CNOMBRE
HAVING SUM (e.CANTIDAD) > 500


--28. Seleccionar los identificadores de proveedores que residan en Sevilla y no suministren 
--m�s de dos art�culos distintos. 

SELECT p.P#
FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
WHERE p.CIUDAD IN ('SEVILLA')
GROUP BY p.P#
HAVING COUNT(p.P#) <=2

--29. Seleccionar los identificadores de art�culos para los cuales todos sus componentes se 
--fabrican en una misma ciudad. 

SELECT a.T#
FROM ARTICULOS a
JOIN ENVIOS e ON e.T# = a.T#
JOIN COMPONENTES c ON c.C# = e.C#
WHERE a.CIUDAD = c.CIUDAD


--30. Seleccionar los identificadores de art�culos para los que se provean env�os de todos los 
--componentes existentes en la base de datos. 

SELECT DISTINCT a.T#
FROM ARTICULOS a
JOIN ENVIOS e ON e.T# = a.T#
WHERE e.C# in (SELECT c.C# FROM COMPONENTES c)

--31. Seleccionar los c�digos de proveedor y art�culo que suministran al menos dos 
--componentes de color 'ROJO'. 

SELECT p.P#, a.T# FROM PROVEEDORES p
JOIN ENVIOS e ON e.P# = p.P#
JOIN ARTICULOS a ON a.T# = e.T#
JOIN COMPONENTES c ON c.C# = e.C#
WHERE --falta


--32. Prop�n tu mismo consultas que puedan realizarse sobre esta base de datos de ejemplo. 
--Intenta responderla, y si te parece un problema interesante o no est�s seguro de su 
--soluci�n, puedes exponerlos en la clases pr�cticas para su resoluci�n en grupo.