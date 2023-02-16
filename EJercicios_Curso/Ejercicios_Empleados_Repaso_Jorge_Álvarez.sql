
DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados;
USE empleados;

CREATE TABLE departamento (
 --id INT IDENTITY(1, 1) PRIMARY KEY,
 id INT  PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 presupuesto FLOAT NOT NULL,
 gastos FLOAT NOT NULL
);
CREATE TABLE empleado (
 --id INT IDENTITY(1, 1) PRIMARY KEY,
 id INT PRIMARY KEY,
 nif VARCHAR(9) NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 apellido1 VARCHAR(100) NOT NULL,
 apellido2 VARCHAR(100),
 id_departamento INT,
 FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego', 'Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta', 'Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores',
NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez',
'Guerrero', NULL);


--1.1 Consultas sobre una tabla; 

--1. Lista el primer apellido de todos los empleados.

SELECT e.apellido1
FROM empleado e

--2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

SELECT distinct e.apellido1
FROM empleado e

--3. Lista todas las columnas de la tabla empleado.

SELECT *
FROM empleado

--4. Lista el nombre y los apellidos de todos los empleados.

SELECT E.nombre, E.apellido1, E.apellido2
FROM empleado E


--5. Lista el identificador de los departamentos de los empleados que aparecen en la 
--tabla empleado.

SELECT E.id_departamento
FROM EMPLEADO E

--6. Lista el identificador de los departamentos de los empleados que aparecen en la 
--tabla empleado, eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT E.id_departamento
FROM EMPLEADO E

--7. Lista el nombre y apellidos de los empleados en una única columna.

SELECT E.nombre
FROM empleado E
UNION ALL
SELECT E.apellido1
FROM empleado E
UNION ALL
SELECT E.apellido2
FROM empleado E


--8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los 
--caracteres en mayúscula.

SELECT UPPER(E.nombre) AS NOMBRE_APELLIDOS
FROM empleado E
UNION ALL
SELECT UPPER(E.apellido1)
FROM empleado E
UNION ALL
SELECT UPPER(E.apellido2)
FROM empleado E

--9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los 
--caracteres en minúscula.

SELECT LOWER(E.nombre) AS NOMBRE_APELLIDOS
FROM empleado E
UNION ALL
SELECT LOWER(E.apellido1)
FROM empleado E
UNION ALL
SELECT LOWER(E.apellido2)
FROM empleado E

--10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, 
--una mostrará únicamente los dígitos del nif y la otra la letra.

SELECT E.id, LEFT(E.nif, 7) AS NUM_nif, RIGHT(E.nif,1) AS LETRA_NIF
FROM empleado E


--11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para 
--calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los 
--gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden 
--existir valores negativos. Utilice un alias apropiado para la nueva columna que está calculando.

SELECT D.nombre, (D.presupuesto - D.gastos) AS PRESUPUETO_ACTUAL
FROM departamento D
ORDER BY 2 ASC

--12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma 
--ascendente.

SELECT D.nombre, D.presupuesto
FROM departamento D
ORDER BY 2 ASC


--13. Lista el nombre de todos los departamentos ordenados de forma ascendente.

SELECT D.nombre
FROM departamento D
ORDER BY 1 ASC

--14. Lista el nombre de todos los departamentos ordenados de forma descendente.

SELECT D.nombre
FROM departamento D
ORDER BY 1 DESC

--15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética teniendo 
--en cuenta en primer lugar sus apellidos y luego su nombre.

SELECT E.nombre, E.apellido1, E.apellido2
FROM empleado E
ORDER BY 2,3,1


--16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor 
--presupuesto.

SELECT TOP 3 D.nombre, D.presupuesto
FROM departamento D
ORDER BY 2 DESC


--17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor 
--presupuesto.

SELECT TOP 3 D.nombre, D.presupuesto
FROM departamento D
ORDER BY 2 ASC


--18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.

SELECT TOP 2 D.nombre, D.gastos
FROM departamento D
ORDER BY 2 DESC

--19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.

SELECT TOP 2 D.nombre, D.gastos
FROM departamento D
ORDER BY 2 ASC

--20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se 
--debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.

SELECT *
FROM empleado E
WHERE E.id > 2 AND E.id <8

--21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen 
--un presupuesto mayor o igual a 150000 euros.

SELECT  D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto >= 150000
ORDER BY 2 ASC


--22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen 
--menos de 5000 euros de gastos.

SELECT  D.nombre, D.gastos
FROM departamento D
WHERE  D.gastos < 5000
ORDER BY 2 ASC


--23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen 
--un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

SELECT  D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto >= 100000 AND D.presupuesto  <= 200000
ORDER BY 2 ASC


--24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 
--100000 y 200000 euros. Sin utilizar el operador BETWEEN.

SELECT  D.nombre, D.presupuesto
FROM departamento D
WHERE  D.presupuesto <= 100000 OR D.presupuesto  >= 200000
ORDER BY 2 ASC


--25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 
--100000 y 200000 euros. Utilizando el operador BETWEEN.


SELECT  D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto BETWEEN  100000 AND 200000
ORDER BY 2 ASC

--26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 
--100000 y 200000 euros. Utilizando el operador BETWEEN.


SELECT  D.nombre, D.presupuesto
FROM departamento D
WHERE NOT D.presupuesto BETWEEN  100000 AND 200000
ORDER BY 2 ASC

--27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos 
--departamentos donde los gastos sean mayores que el presupuesto del que disponen.


SELECT *
FROM departamento D
WHERE D.gastos > D.presupuesto
ORDER BY 2 ASC

--28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
--departamentos donde los gastos sean menores que el presupuesto del que disponen.

SELECT *
FROM departamento D
WHERE D.gastos < D.presupuesto
ORDER BY 2 ASC


--29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos 
--departamentos donde los gastos sean iguales al presupuesto del que disponen.

SELECT *
FROM departamento D
WHERE D.gastos = D.presupuesto


--30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

SELECT *
FROM empleado E
WHERE E.apellido2 is NULL


--31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

SELECT *
FROM empleado E
WHERE E.apellido2 is not NULL


--32. Lista todos los datos de los empleados cuyo segundo apellido sea López.

SELECT *
FROM empleado E
WHERE E.apellido2 IN ('López')

--33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el 
--operador IN.

SELECT *
FROM empleado E
WHERE E.apellido2 = 'Díaz' OR E.apellido2 = 'Moreno'

--34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el 
--operador IN.

SELECT *
FROM empleado E
WHERE E.apellido2 IN ( 'Díaz' ,'Moreno')


--35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.

SELECT *
FROM empleado E
WHERE E.id_departamento IN (3)

--36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.

SELECT *
FROM empleado E
WHERE E.id_departamento IN ( 2,4,5)




--1.2 Consultas multitabla (Composición interna); 

--Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

--1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

SELECT *
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento

--2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada 
--uno. Ordena el resultado, en primer lugar, por el nombre del departamento (en orden 
--alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.

SELECT *
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
ORDER BY 8, 3,4,5

--3. Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos 
--departamentos que tienen empleados.

SELECT D.id, D.nombre
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
GROUP BY D.id, D.nombre
HAVING COUNT(*) > 0



--4. Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto 
--actual del que dispone, solamente de aquellos departamentos que tienen empleados. El valor 
--del presupuesto actual lo puede calcular restando al valor del presupuesto inicial 
--(columna presupuesto) el valor de los gastos que ha generado (columna gastos).




--5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

SELECT D.id, D.nombre
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE E.nif IN ('38382980M')


--6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

SELECT D.id, D.nombre
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE E.nombre IN ('Pepe') AND E.apellido1  IN ('Ruiz')  AND E.apellido2  IN ('Santana')

--7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. 
--Ordena el resultado alfabéticamente.

SELECT *
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE D.nombre IN ('I+D')

--8. Devuelve un listado con los datos de los empleados que trabajan en el departamento 
--de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

SELECT *
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE D.nombre IN ( 'Sistemas','Contabilidad' ,'I+D')
ORDER BY D.nombre


--9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen 
--un presupuesto entre 100000 y 200000 euros.

SELECT E.nombre 
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE D.presupuesto NOT BETWEEN 100000 AND 200000
ORDER BY D.nombre

--10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo 
--segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos 
--que estén repetidos.

SELECT DISTINCT D.nombre
FROM empleado E 
JOIN departamento D ON D.id = E.id_departamento
WHERE E.apellido2 IS NULL
ORDER BY D.nombre


--1.3 Consultas multitabla (Composición externa); 

--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

--1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde 
--trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento 
--asociado.

SELECT *
FROM empleado E 
LEFT JOIN departamento D ON D.id = E.id_departamento
ORDER BY D.nombre

--2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún 
--departamento asociado.

SELECT *
FROM empleado E 
LEFT JOIN departamento D ON D.id = E.id_departamento
WHERE E.id_departamento IS NULL
ORDER BY D.nombre


--3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún 
--empleado asociado.

SELECT D.nombre AS NOMBRE_DEPT
FROM empleado E 
RIGHT JOIN departamento D ON D.id = E.id_departamento
WHERE E.id_departamento IS NULL
ORDER BY D.nombre


--4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde 
--trabajan. El listado debe incluir los empleados que no tienen ningún departamento asociado y 
--los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente 
--por el nombre del departamento.

SELECT *
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
ORDER BY D.nombre

--5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los 
--departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por 
--el nombre del departamento.

SELECT *
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
WHERE E.id_departamento IS NULL
ORDER BY D.nombre



--1.4 Consultas resumen; 

--1. Calcula la suma del presupuesto de todos los departamentos.


SELECT SUM(D.presupuesto) as presupuesto_TOTAL
FROM departamento D



--2. Calcula la media del presupuesto de todos los departamentos.

SELECT AVG(D.presupuesto) as presupuesto_MEDIO
FROM departamento D



--3. Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT MIN(D.presupuesto) as presupuesto_MEDIO
FROM departamento D

--4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con 
--menor presupuesto.

SELECT D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto IN (SELECT MIN(D.presupuesto) FROM departamento D)

--5. Calcula el valor máximo del presupuesto de todos los departamentos.

SELECT MAX(D.presupuesto) as presupuesto_MEDIO
FROM departamento D

--6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con 
--mayor presupuesto.

SELECT D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto IN (SELECT MAX(D.presupuesto) FROM departamento D)

--7. Calcula el número total de empleados que hay en la tabla empleado.

SELECT COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E


--8. Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E
WHERE E.apellido2 IS NOT NULL

--9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos 
--columnas, una con el nombre del departamento y otra con el número de empleados que tiene 
--asignados.

SELECT D.nombre, COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
GROUP BY  D.nombre
ORDER BY D.nombre

--10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe 
--tener dos columnas, una con el nombre del departamento y otra con el número de empleados 
--que tiene asignados.

SELECT D.nombre, COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
GROUP BY  D.nombre
HAVING COUNT(*) > 2
ORDER BY D.nombre


--11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado 
--de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún 
--empleado asociado.

SELECT D.nombre, COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
GROUP BY  D.nombre
ORDER BY D.nombre

--12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un 
--presupuesto mayor a 200000 euros.

SELECT D.nombre, COUNT(*) AS NUM_TOTAL_EMP
FROM empleado E 
FULL JOIN departamento D ON D.id = E.id_departamento
WHERE  D.presupuesto > 200000
GROUP BY  D.nombre
ORDER BY D.nombre


---1.5 Subconsultas; 


--1.5.1 Con operadores básicos de comparación; 


--1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin 
--utilizar INNER JOIN).

SELECT E.nombre
FROM empleado E 
WHERE E.id_departamento = (SELECT D.id
							FROM departamento D
							WHERE D.nombre IN ('Sistemas'))

--2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

SELECT D.nombre, D.presupuesto
FROM departamento d 
WHERE D.presupuesto = (SELECT MAX(D.presupuesto)
							FROM departamento D)


--3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

SELECT D.nombre, D.presupuesto
FROM departamento d 
WHERE D.presupuesto = (SELECT MIN(D.presupuesto)
							FROM departamento D)


--1.5.2 Subconsultas con ALL y ANY; 

--4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. 
--Sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto >= ALL( SELECT  D.presupuesto
							FROM departamento D)


--5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. 
--Sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT D.nombre, D.presupuesto
FROM departamento D
WHERE D.presupuesto <= ALL( SELECT  D.presupuesto
							FROM departamento D)

--6. Devuelve los nombres de los departamentos que tienen empleados asociados. 
--(Utilizando ALL o ANY).

SELECT D.nombre
FROM departamento D
WHERE D.id = ANY( SELECT  E.id_departamento
							FROM empleado E)


--7. Devuelve los nombres de los departamentos que no tienen empleados asociados. 
--(Utilizando ALL o ANY).

SELECT D.nombre
FROM departamento D
WHERE D.id not in(SELECT D.id
					FROM departamento D
					WHERE D.id = ANY( SELECT  E.id_departamento
												FROM empleado E))



--1.5.3 Subconsultas con IN y NOT IN; 

--8. Devuelve los nombres de los departamentos que tienen empleados asociados. 
--(Utilizando IN o NOT IN).

SELECT D.nombre
FROM departamento D
WHERE D.id IN (SELECT E.id_departamento FROM empleado E)

--9. Devuelve los nombres de los departamentos que no tienen empleados asociados. 
--(Utilizando IN o NOT IN).

SELECT D.nombre
FROM departamento D
WHERE D.nombre not IN (SELECT D.nombre
					FROM departamento D
					WHERE D.id IN (SELECT E.id_departamento FROM empleado E))


--1.5.4 Subconsultas con EXISTS y NOT EXISTS; 

--10. Devuelve los nombres de los departamentos que tienen empleados asociados. 
--(Utilizando EXISTS o NOT EXISTS).

SELECT D.nombre
FROM departamento d 
WHERE EXISTS (SELECT * FROM empleado E)