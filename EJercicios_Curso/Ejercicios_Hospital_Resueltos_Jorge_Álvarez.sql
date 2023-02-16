--Ejercicios 7/02/2022 - 9/02/2022    JORGE ÁLVAREZ GRACIA

--CREATE DATABASE Hospital
USE Hospital
--1. Encuentre a todos los miembros del personal cuyo nombre empiece por h.

SELECT d.[APELLIDO ]
FROM DOCTOR d
WHERE d.[APELLIDO ] LIKE 'H%'
UNION
SELECT e.[APELLIDO ]
FROM EMP e
WHERE e.[APELLIDO ] LIKE 'H%'
UNION
SELECT p.[APELLIDO ]
FROM PLANTILLA p
WHERE p.[APELLIDO ] LIKE 'H%'

--2. ¿Quiénes son las enfermeras y enfermeros que trabajan en turnos de tarde o de mañana.

SELECT p.[APELLIDO ]
FROM PLANTILLA P
WHERE P.[FUNCION ] IN('Enfermera', 'Enfermero') AND P.[TURNO ] IN ('T','M')


--3. Listado de las enfermeras que ganan entre 2 millones y 2.5 millones y medio.

SELECT p.[EMPLEADO-NO ],p.[APELLIDO ]
FROM PLANTILLA P
WHERE P.[FUNCION ] IN('Enfermera') AND P.[SALARIO ] BETWEEN 2000000 AND 2500000

--4. Mostrar para todos los hospitales el código de hospital, el nombre completo del hospital,
-- su nombre abreviado, (tres primeras letras, y ordenarlo por ese nombre abreviado).

SELECT H.[HOSPITAL-COD ], H.[NOMBRE ], LEFT(H.[NOMBRE ], 3) AS NOMBRE_ABR
FROM HOSPITAL H
ORDER BY NOMBRE_ABR

--5. En la tabla de doctor otorgar a cardiología un código que es el uno, a psiquiatría un código que es el 2
--pediatría el número 3 y el resto el cuatro.
--Mostrar todos los doctores con su especialidad y su código asignado.

SELECT D.[DOCTOR_NO ],D.[APELLIDO ],D.[ESPECIALIDAD ], CASE D.[ESPECIALIDAD ] 
							   WHEN ('Cardiología') THEN 1
							   WHEN ('psiquiatría') THEN 2
							   WHEN ('Pediatría') THEN 3
							   ELSE 4 END AS ESP_COD
FROM DOCTOR D
ORDER BY D.[ESPECIALIDAD ], ESP_COD

--6. Hacer un listado de los nombres de los pacientes de aquellos 
-- que dispongan de una letra A en el apellido.

SELECT E.[APELLIDO ]
FROM ENFERMO E
WHERE E.[APELLIDO ] LIKE '%A%'

-- 7. Concatenar 'El departamento __ (nombre) está en ___ (ciudad)'

SELECT CONCAT('El departamento: ', D.[NOMBRE ], ' está en ', D.[LOC ])
FROM DEPT2 D


-- 8. Empleados cuyos apellidos contengan una 'N' ordenados por el apellido.

SELECT D.[APELLIDO ]
FROM DOCTOR D
WHERE D.[APELLIDO ] LIKE '%N%'
UNION
SELECT E.[APELLIDO ]
FROM EMP E
WHERE E.[APELLIDO ] LIKE '%N%'
UNION
SELECT P.[APELLIDO ]
FROM PLANTILLA P
WHERE P.[APELLIDO ] LIKE '%N%'
ORDER BY [APELLIDO ] 


-- 9. Para cada empleado debemos obtener el salario total, salario + comisión, salario mensual
-- la información deberá ser ordenada por el salario total y apellido descendentemente.

SELECT E.[APELLIDO ], (E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0)) AS SALARIO_TOTAL , ROUND((E.[SALARIO ] /12),1) AS SALARIO_MENSUAL
FROM EMP E
ORDER BY SALARIO_TOTAL DESC, E.[APELLIDO ] DESC

--10 Para cada empleado que no tenga comisión o su comisión sea mayor que el 15% por ciento de su salario.
-- Obtendremos el salario total, el apellido y el oficio y deberá ser ordenado por oficio y salario de forma descendentemente

SELECT(E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0)) AS SALARIO_TOTAL ,  E.[APELLIDO ],  E.[OFICIO ]
FROM EMP E
WHERE ISNULL(E.[COMISIÓN ],0) > 0 AND E.[COMISIÓN ] > E.[SALARIO ]*0.15
ORDER BY  E.[OFICIO ] DESC, SALARIO_TOTAL DESC, E.[APELLIDO ] DESC


--11. Encuentra a todas las enfermeras y enfermeros indicando el salario mensual de cada uno.


SELECT P.[EMPLEADO-NO ], P.[APELLIDO ] ,ROUND((P.[SALARIO ] /12),1) AS SALARIO_MENSUAL
FROM PLANTILLA P
WHERE P.[FUNCION ] IN('Enfermera', 'Enfermero')

--12. Nombre, oficio y fecha de alta del personal 
--del departamento 20 que ganan más de 150000 mensuales.

SELECT E.[APELLIDO ], E.[FECHA_ALTA ]
FROM EMP E
WHERE E.[DEPT_NO ] IN (20)
AND E.[SALARIO ]/12 > 150000

--13. Nombre, oficio y día de la semana en la que han sido dados de alta los empleados 
--de la semana pero solo para aquellos cuyo día de alta ha sido el martes o jueves.  


SELECT E.[APELLIDO ], E.[OFICIO ], DATEPART(WEEKDAY, E.[FECHA_ALTA ]) AS DIA_SEMANA_ALTA
FROM EMP E
--WHERE DIA_SEMANA_ALTA IN (2,4) 
WHERE DATEPART(WEEKDAY, E.[FECHA_ALTA ]) IN (2, 4)

--14. Para todos los empleados el día que fueron de alta deben estar ordenados de lunes a viernes, 
--aquellos días no laborables deberan ser denominados como fin de semana.

SELECT E.[APELLIDO ], E.[OFICIO ],  DATEPART(WEEKDAY, E.[FECHA_ALTA ]) AS DIA_SEMANA_ALTA, 
	   CASE  DATEPART(WEEKDAY, E.[FECHA_ALTA ])
							   WHEN 6 THEN 'FIN DE SEMANA'
							   WHEN 7 THEN 'FIN DE SEMANA'
							   ELSE 'NO FIN DE SEMANA' 
							   END AS IS_FIN_DE_SEMANA
FROM EMP E
ORDER BY DIA_SEMANA_ALTA


--15. Encontrar el salario medio de los analistas.

SELECT E.[OFICIO ], AVG (E.[SALARIO ]) AS SALARIO_MEDIO
FROM EMP E
WHERE E.[OFICIO ] IN ('ANALISTA')
GROUP BY E.[SALARIO ], E.[OFICIO ]

--16. Encontrar el salario más alto y el más bajo de la tabla empleados e indicar la diferencia entre ambos.


SELECT MAX (E.[SALARIO ]) AS MAX_SALARIO, 
       MIN (E.[SALARIO ]) AS MIN_SALARIO, 
	   MAX (E.[SALARIO ]) -  MIN (E.[SALARIO ]) AS DIF_MAX_MIN_SALARIO
FROM EMP E


--17. Calcular el número de oficios diferentes que exiten en total en los departamentos 10 y 20.


SELECT E.[OFICIO ], COUNT(E.[OFICIO ]) AS N_EMPLEADOS
FROM EMP E
WHERE E.[DEPT_NO ] IN (10, 20) 
GROUP BY  E.[OFICIO ]

--18. Calcular el número de personas que realizan cada oficio en cada departamento.

SELECT  COUNT (*) AS NO_EMP, E.[OFICIO ], E.[DEPT_NO ]
FROM EMP E
GROUP BY E.[OFICIO ],E.[DEPT_NO ]

--19. Buscar qué departamento tienen más de cuatro personas trabajando. 

SELECT E.[DEPT_NO ], D.[NOMBRE ]
FROM DEPT2 D
JOIN EMP E ON E.[DEPT_NO ] = D.[DEPT_NO ]
GROUP BY E.[DEPT_NO ] ,D.[NOMBRE ]
HAVING COUNT(E.[DEPT_NO ]) > 4

--20. Buscar qué departamentos tienen más de dos personas trabajando en la misma profesión. 


SELECT E.[DEPT_NO ], D.[NOMBRE ], COUNT(E.[OFICIO ]) AS N_OFICIOS
FROM DEPT2 D
JOIN EMP E ON E.[DEPT_NO ] = D.[DEPT_NO ]
GROUP BY E.[DEPT_NO ] ,D.[NOMBRE ], E.[OFICIO ]
HAVING COUNT(E.[OFICIO ]) > 2


--21. Se desea saber el número de departamentos que tienen por oficio el de empleado, 
--la salida debe estar ordenada por el número de departamento. 

SELECT E.[DEPT_NO ], COUNT(E.[DEPT_NO ]) AS C_DEPARTAMENTOS
FROM EMP E
WHERE E.[OFICIO ] IN ('EMPLEADO')
GROUP BY E.[DEPT_NO ]
ORDER BY E.[DEPT_NO ]

--22. Se desea saber el salario total medio de los vendedores de nuestra empresa.

SELECT AVG(E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0)) AS SALARIO_MEDIO_TOTAL
FROM EMP E
WHERE E.[OFICIO ] IN ('VENDEDOR')
GROUP BY E.[OFICIO ]

--23. Se desea saber el salario total medio de los empleados y vendedores de nuestra empresa. 


SELECT E.[OFICIO ], AVG(E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0)) AS SALARIO_MEDIO_TOTAL
FROM EMP E
WHERE E.[OFICIO ] IN ('VENDEDOR', 'EMPLEADO')
GROUP BY E.[OFICIO ]

--24. Se desea saber para cada departamento y cada oficio el máximo salario y la suma total de los salarios,  
--pero solo para aquellos departamentos 
--y oficios cuya suma salarial supere o sea igual que el 50% de su máximo salario. 

SELECT E.[DEPT_NO ], E.[OFICIO ] ,MAX(E.[SALARIO ]) AS MAX_SALARIO, SUM(E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0)) AS SALARIO_TOTAL
FROM EMP E
GROUP BY E.[DEPT_NO ], E.[OFICIO ]
HAVING  MAX(E.[SALARIO ])*0.5 <= SUM(E.[SALARIO ] + ISNULL(E.[COMISIÓN ],0))


--25. Se desea saber para cada oficio, dentro de cada año de alta distinto que existe en nuestra empresa
-- el número de empleados y la media salarial que tienen. 

SELECT E.[OFICIO ], COUNT(*) AS NUM_EMP, AVG(E.[SALARIO ]),YEAR(E.[FECHA_ALTA ])
FROM EMP E
GROUP BY E.[OFICIO ], YEAR(E.[FECHA_ALTA ])


--26. Se desea saber para cada inicial de apellido que exista en la empresa, tratando solo las iniciales consonantes el salario asociado. 


SELECT E.[SALARIO ], E.[APELLIDO ]
FROM EMP E
WHERE LEFT(E.[APELLIDO ],1) NOT IN ('A','E','I','O', 'U')
UNION
SELECT P.[SALARIO ]
FROM PLANTILLA P
WHERE LEFT(P.[APELLIDO ],1) NOT IN ('A','E','I','O', 'U')
ORDER BY [APELLIDO ] 

--27. Se desea saber para cada inicial de apellido que exista en la empresa, tratando solo las iniciales consonantes el salario sin tener en cuenta aquellos apellidos donde hay más de una n. 

SELECT E.[SALARIO ]
FROM EMP E
WHERE E.[APELLIDO ] NOT LIKE 'N%'
UNION
SELECT P.[SALARIO ]
FROM PLANTILLA P
WHERE P.[APELLIDO ] NOT LIKE 'N%'
ORDER BY [APELLIDO ] 

--28. Obtener por oficio y departamento el máximo salario. 

SELECT E.[OFICIO ],E.[DEPT_NO ], MAX(E.[SALARIO ]) AS MAX_SALARIO
FROM EMP E
GROUP BY E.[OFICIO ],E.[DEPT_NO ]
ORDER BY MAX_SALARIO DESC

--29. Se desea saber para cada departamento y oficio, la suma de comisiones, teniendo en cuenta que para aquellos empleados que no tienen comisión: 
--Si son del departamento 10, 10% de su salario.
--Si son del departamento 20, 15% de su salario.
--Si son del departamento 30, 17% de su salario.
--Y cualquier otro departamento, 5% de su salario.

--No se tendrán en cuenta aquellos empleados que se hayan dado de alta posteriormente al año 1989 y 
--al cargo del presidente. 

SELECT E.[DEPT_NO ] , E.[OFICIO ], SUM(ISNULL(E.[COMISIÓN ], CASE   E.[DEPT_NO ] 
															 WHEN 10 THEN  E.[SALARIO ]*0.10
															 WHEN 20 THEN  E.[SALARIO ]*0.15
															 WHEN 30 THEN  E.[SALARIO ]*0.17
															 ELSE E.[SALARIO ]*0.05 END )) AS SUM_NEW_COMISION

FROM EMP E		
WHERE YEAR(E.[FECHA_ALTA ])<1989 AND E.[OFICIO ] NOT IN ('PRESIDENTE')
GROUP BY E.[OFICIO ], E.[DEPT_NO ]
ORDER BY SUM_NEW_COMISION DESC

--30. Queremos saber el MAX, MIN, y Media del salrio de cada departamento de la empresa.

SELECT  E.[DEPT_NO ] ,
        MAX(E.[SALARIO ]) AS SALARIO_MAX, 
		MIN(E.[SALARIO ]) AS SALARIO_MIN, 
		ROUND(AVG(E.[SALARIO ]),1) AS SALARIO_MEDIO
FROM EMP E
GROUP BY E.[DEPT_NO ]

--31. Listar a través de las tablas EMP, DEPT2, de su apellido, oficio, 
--número de departamento Y nombre del departamento

SELECT E.[APELLIDO ],E.[OFICIO ], E.[DEPT_NO ], D.[NOMBRE ]
FROM EMP E
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]

--32.Seleccionar los nombres de las profesiones y de los departamentos donde trabajan los analistas.

SELECT  E.[APELLIDO ], E.[OFICIO ], D.[NOMBRE ]
FROM EMP E 
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
WHERE E.[OFICIO ] IN ('ANALISTA')


--33. Se desea conocer el nombre y el oficio de todos los empleados que trabajan en madrid 
--y ordenar de manera ascendente.


SELECT  E.[APELLIDO ], E.[OFICIO ]
FROM EMP E 
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
WHERE D.[LOC ] IN ('MADRID')


--34. Se desea conocer cuántos empleados existen en cada departamento ordenado descendentemente 
--por el número de empleados. 

SELECT E.[DEPT_NO ], COUNT(*) AS NUM_EMP
FROM EMP E 
GROUP BY E.[DEPT_NO ]
ORDER BY NUM_EMP DESC

--35. Se desea conocer tanto para los departamentos de ventas 
--y contabilidad su máximo, mínimo y media salarial , así como el número de empleados en cada departamento, 
--ordenados por nombre de departamento.

SELECT  D.[NOMBRE ], 
		MAX(E.[SALARIO ]) AS SALARIO_MAX, 
		MIN(E.[SALARIO ]) AS SALARIO_MIN, 
		ROUND(AVG(E.[SALARIO ]),1) AS SALARIO_MEDIO,
		COUNT(E.[APELLIDO ]) AS NUM_EMPLEADOS
FROM EMP E 
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
WHERE D.[NOMBRE ] IN ('VENTAS', 'CONTABILIDAD')
GROUP BY E.[DEPT_NO ],D.[NOMBRE ]
ORDER BY D.[NOMBRE ] DESC



--36. Se desea conocer el en cada sala de cada hospital dado el resultado ordenado de forma descendente por

--37. Se desea conocer el número de empleado, su nombre,  el oficio 
--que tiene jefe y obtener la misma información de su jefe. 

SELECT E.[EMP_NO ], E.[APELLIDO ], E.[OFICIO ], E.[DIR ], E2.[APELLIDO ], E2.[OFICIO ]
FROM EMP E
JOIN EMP E2 ON E.[DIR ] = E2.[EMP_NO ]


--38. Se desea conocer para todos los departamentos existentes el salario mínimo de cada departamento 
--y para este muestreo no queremos tener en cuenta las personas con oficio de empleado. 
-- Ordenados de forma descendente por salario mínimo.


SELECT E.[DEPT_NO ], MIN(E.[SALARIO ]) AS MIN_SALARIO
FROM EMP E
WHERE E.[OFICIO ] NOT IN ('EMPLEADO')
GROUP BY E.[DEPT_NO ]
ORDER BY MIN(E.[SALARIO ])



--39. Se desea obtener un listado con el mismo formato que del ejercicio 37 
--pero ahora también obtener aquellos no que disponen de jefe. (dónde jefe será null).

SELECT E.[EMP_NO ], E.[APELLIDO ], E.[OFICIO ], E.[DIR ], E2.[APELLIDO ], E2.[OFICIO ]
FROM EMP E
LEFT JOIN EMP E2 ON E.[DIR ] = E2.[EMP_NO ]



--40. Obtener el apellido, número de departamento, oficio de todos los empleados,  
--que estén en el departamento 20 pero que en ese oficio no sea ventas. 

SELECT E.[APELLIDO ], E.[DEPT_NO ], E.[OFICIO ]
FROM EMP E
WHERE E.[DEPT_NO ] IN (20) AND E.[OFICIO ] NOT IN ('VENTAS')


--41. Obtener el número de empleado, número de departamento
--y apellido de todos los empleados que trabajen el departamento 20 o 30 
--y su salario sea mayor que dos veces el salario mínimo de la empresa, sin contar el oficio de presidente. 

SELECT E.[EMP_NO ], E.[DEPT_NO ], E.[APELLIDO ] , E.[SALARIO ]
FROM EMP E
WHERE E.[DEPT_NO ] IN (20, 30) 
	  AND E.[OFICIO ] NOT IN ('PRESIDENTE') 
GROUP BY E.[EMP_NO ]
HAVING E.[SALARIO ] > MIN( E.[SALARIO ])*2   --falta

--42. Encontrar las personas que ganan 500.000 más que el miembro del personal de sueldo más alto del turno de mañana 
--y que tenga el mismo trabajo de señor Nuñez.

SELECT P.[APELLIDO ], P.[APELLIDO ]
FROM PLANTILLA P
WHERE  P.[SALARIO ] > (SELECT MAX(P.[SALARIO ] + 500000)
						  FROM PLANTILLA P
						  WHERE P.[TURNO ] IN ('M'))

	  AND P.[FUNCION ] IN (SELECT P.[FUNCION ]
						  FROM PLANTILLA P
						  WHERE P.[APELLIDO ] LIKE '%NuÑez%')



--43. Averiguar el apellido del individuo más antiguo de la empresa.

SELECT TOP(1) E.[APELLIDO ], E.[FECHA_ALTA ]
FROM EMP E
ORDER BY E.[FECHA_ALTA ]

--44. Presentar nombres y oficios de los empleados que tienen el mismo trabajo que Jimenez. 

SELECT E.[APELLIDO ], E.[OFICIO ]
FROM EMP E
WHERE E.[OFICIO ] IN (SELECT E.[OFICIO ]
					  FROM EMP E
					  WHERE E.[APELLIDO ] = 'JIMENEZ')

--45. Conocer el apellido, oficio y departamento de todos los individuos cuyo salario sea mayor que el salario del departamento 30. 

SELECT E.[APELLIDO ], E.[OFICIO ], E.[DEPT_NO ]
FROM EMP E
WHERE E.[SALARIO ] > (SELECT  MAX(E.[SALARIO ])
					 FROM EMP E
					 WHERE E.[DEPT_NO ] IN (30) 
					 GROUP BY E.[DEPT_NO ])


--46. Presentar nombres y oficios de todos los empleados del departamento 20 cuyo 
--trabajo sea idéntico al de cualquiera de los empleados del departamento de ventas.

SELECT E.[APELLIDO ], E.[OFICIO ]
FROM EMP E
WHERE E.[DEPT_NO ] IN (20)
	 AND E.[OFICIO ] IN (SELECT E.[OFICIO ]
						 FROM EMP E
						 JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
						 WHERE D.[NOMBRE ] IN ('VENTAS'))


--47. Se desea obtener a todos los empleados de los departamentos que no ganan ni el máximo ni el mínimo salarial de la empresa.  

SELECT E.[APELLIDO ]
FROM EMP E
WHERE E.[SALARIO ] NOT IN (SELECT MAX(E.[SALARIO ])
						   FROM EMP E 
						   GROUP BY E.[DEPT_NO ])
				   AND E.[SALARIO ] NOT IN  (SELECT MIN(E.[SALARIO ])
						   FROM EMP E 
						   GROUP BY E.[DEPT_NO ])

--48. Obtener el máximo salario por departamento sin tener en cuenta aquellos empleados 
--cuyo apellido empieza con la inicial de alguno de 
--los empleados que tienen el máximo salario de algún departamento.

SELECT  E.[DEPT_NO ], MAX( E.[SALARIO ]) AS MAX_SALARIO
FROM EMP E
WHERE E.[APELLIDO ] NOT IN 
						(SELECT E.[APELLIDO ]
						 FROM EMP E
						 WHERE LEFT(E.[APELLIDO ],1) IN (SELECT LEFT(E.[APELLIDO ],1) AS INICIAL_EMP
													FROM EMP E
													WHERE E.[SALARIO ] IN ( SELECT MAX( E.[SALARIO ]) AS MAX_SALARIO
																			FROM EMP E
																			GROUP BY E.[DEPT_NO ]))) 
GROUP BY E.[DEPT_NO ]


--49. Igual que el anterior pero sin los datos con departamentos de menos de tres personas.

SELECT  E.[DEPT_NO ], MAX( E.[SALARIO ]) AS MAX_SALARIO
FROM EMP E
WHERE E.[APELLIDO ] NOT IN 
						(SELECT E.[APELLIDO ]
						 FROM EMP E
						 WHERE LEFT(E.[APELLIDO ],1) IN (SELECT LEFT(E.[APELLIDO ],1) AS INICIAL_EMP
													FROM EMP E
													WHERE E.[SALARIO ] IN ( SELECT MAX( E.[SALARIO ]) AS MAX_SALARIO
																			FROM EMP E
																			GROUP BY E.[DEPT_NO ]))) 
GROUP BY E.[DEPT_NO ]
HAVING COUNT(*) <3

--50. Se desea averiguar el número de oficios por departamento sin tener en cuenta en el muestro aquellos 
--individuos que están en alguno de los departamentos que contienen vendedores. 
