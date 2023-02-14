-- FUNCIONES DE AGREGADO




/*Las funciones de agregado son funciones que se utilizan para calcular valores en las tablas. Si queremos usarlas combinándolas junto con otros campos debemos utilizar Group by y agrupar los datos que no son funciones.
Con la sentencia group by no se utiliza la clausula where, se utilizara una clausula propia de la expresión: HAVING. Equivalente a where 

COUNT: Cuenta los registros que hay en la consulta.
Si pongo un valor dentro de la expresión devolverá la cuenta de todos los registros no nulos.
Si pongo un asterisco contará todos los registros aunque tengan valores nulos.
select count(*) from emp
: Valores con Nulos
select count(oficio) from emp
: Valores sin nulos

AVG: Realiza la media sobre la expresión dada, debe ser un tipo de dato Int.
select avg(salario) from emp

MAX: Saca el valor máximo de una consulta.
select max(fecha_alt) from emp

MIN: Devuelve el valor mínimo de una consulta.
select min(fecha_alt) from emp

SUM: Devuelve la suma de los salarios 
select sum(salario) from emp*/


--1. Encontrar el salario medio de los analistas, mostrando el número de los empleados con oficio analista.

SELECT COUNT(*) AS NUM_EPLEADOS, AVG(E.[SALARIO ]) AS AVG_SALARIO, [OFICIO ]
FROM EMP E
WHERE E.[OFICIO ] IN ('ANALISTA')
GROUP BY E.[OFICIO ]


--2. Encontrar el salario mas alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.


SELECT MAX (E.[SALARIO ]) AS MAX_SALARIO, 
	   MIN(E.[SALARIO ]) AS MIN_SALARIO,
	   MAX (E.[SALARIO ]) - Min (E.[SALARIO ]) AS DIF_SALARIO
FROM EMP E
WHERE E.[OFICIO ] IN ('EMPLEADO')
GROUP BY E.[OFICIO ]


--3. Visualizar los salarios mayores para cada oficio.

SELECT MAX (E.[SALARIO ]) AS MAX_SALARIO
FROM EMP E
GROUP BY E.[OFICIO ]


--4. Visualizar el número de personas que realizan cada oficio en cada departamento.

SELECT E.[DEPT_NO ],COUNT (*) AS NUM_PERSONAS,  E.[OFICIO ]
FROM EMP E
GROUP BY E.[DEPT_NO ], E.[OFICIO ]
ORDER BY 1,2,3

--5. Buscar aquellos departamentos con cuatro o mas personas trabajando.

SELECT E.[DEPT_NO ],COUNT (*) AS NUM_PERSONAS
FROM EMP E
GROUP BY E.[DEPT_NO ]
HAVING COUNT (*) >= 4
ORDER BY 1,2

--6. Mostrar el número de directores que existen por departamento.

SELECT E.[DEPT_NO ],COUNT (*) AS NUM_PERSONAS, E.[OFICIO ]
FROM EMP E
GROUP BY E.[DEPT_NO ], E.[OFICIO ]
HAVING E.[OFICIO ] IN( 'DIRECTOR')
ORDER BY 1,2,3


--7. Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.

SELECT P.[FUNCION ], COUNT(*) AS NUM_PLANTILLA
FROM PLANTILLA P
GROUP BY P.[FUNCION ]
HAVING P.[FUNCION ] IN( 'ENFERMERO', 'ENFERMERA', 'INTERNO')
ORDER BY 1,2

--8. Visualizar departamentos, oficios y número de personas, 
--para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio.

SELECT E.[DEPT_NO ], E.[OFICIO ], COUNT(*) AS NUM_PERSONAS
FROM EMP E
GROUP BY E.[DEPT_NO ], E.[OFICIO ]
HAVING COUNT(*) >1


--9. Calcular el salario medio, Diferencia, Máximo y Mínimo de cada oficio. 
-- Indicando el oficio y el número de empleados de cada oficio.

SELECT E.[OFICIO ], COUNT(*) AS NUM_EMPL,
	   AVG (E.[SALARIO ]) AS AVG_SALARIO,
	   MAX (E.[SALARIO ]) - Min (E.[SALARIO ]) AS DIF_SALARIO,
	   MAX (E.[SALARIO ]) AS MAX_SALARIO, 
	   MIN(E.[SALARIO ]) AS MIN_SALARIO
FROM EMP E
GROUP BY E.[OFICIO ]


--10. Calcular el valor medio de las camas que existen para cada nombre de sala. 
--Indicar el nombre de cada sala y el número de cada una de ellas

SELECT * FROM SALA

SELECT S.[SALA-COD ],S.[NOMBRE ],SUM(S.[NUM-CAMA ]) AS NUM_CAMAS, AVG(S.[NUM-CAMA ]) AS AVG_CAMAS
FROM SALA S
GROUP BY S.[NOMBRE ], S.[SALA-COD ]
ORDER BY 1,2


--11. Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. 
--Indicar la función y el número de empleados.

SELECT P.[FUNCION ], AVG(P.[SALARIO ]) AS AVG_SALARIO, COUNT(*) NUM_EMP
FROM PLANTILLA P
WHERE P.[SALA-COD] IN (6)
GROUP BY P.[FUNCION ]


--12. Averiguar los últimos empleados que se dieron de alta en la empresa en cada uno de los oficios, ordenados por la fecha.

SELECT E.[APELLIDO ], MAX(E.[FECHA_ALTA ]) AS ULTIMA_FECHA, E.[OFICIO ]
FROM EMP E
GROUP BY E.[OFICIO ],E.[APELLIDO ]
ORDER BY 2

--13. Mostrar el número de hombres y el número de mujeres que hay entre los enfermos.
SELECT COUNT(*) AS NÚMERO , E.[S ] AS SEXO
FROM ENFERMO E
GROUP BY E.[S ]

--14. Mostrar la suma total del salario que cobran los empleados de la plantilla para cada función y turno.

SELECT P.[FUNCION ],P.[TURNO ],SUM(P.[SALARIO ]) AS SUM_SALARIO
FROM PLANTILLA P
GROUP BY P.[FUNCION ], p.[TURNO ]
ORDER BY 1

--15. Calcular el número de salas que existen en cada hospital.

SELECT  COUNT(*) AS NUM_SALAS, S.[HOSPITAL-COD ]
FROM SALA S
GROUP BY S.[HOSPITAL-COD ]

--16. Mostrar el número de enfermeras que existan por cada sala.

SELECT P.[SALA-COD], COUNT(*) AS NUM_ENFERMERAS
FROM PLANTILLA P
WHERE P.[FUNCION ] IN ('ENFERMERA')
GROUP BY P.[SALA-COD]