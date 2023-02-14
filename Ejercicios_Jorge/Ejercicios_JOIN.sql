-- EJERCICIOS COMBINACIONES INTERNAS

--Uso de Join SQL Server - Combinaciones internas

USE HOSPITAL 

--1. Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados cuyo salario sea mayor de 300000


SELECT E.[APELLIDO ], E.[OFICIO ], E.[SALARIO ], E.[DEPT_NO ], D.[NOMBRE ]
FROM EMP E 
INNER JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
WHERE E.[SALARIO ] > 300000


--2. Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.


SELECT H.[NOMBRE ] AS HOSPITAL, S.[NOMBRE ] AS SALA
FROM HOSPITAL H
JOIN SALA S ON S.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]

--3. Calcular cuantos trabajadores de la empresa hay en cada ciudad.

SELECT COUNT(*) AS NUM_TRABAJADORES, E.[DEPT_NO ], D.[LOC ]
FROM EMP E
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY E.[DEPT_NO ],D.[LOC ]


--4. Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.


SELECT COUNT(*) AS NUM_PERSONAS, E.[OFICIO ],  E.[DEPT_NO ], D.[NOMBRE ]
FROM EMP E 
INNER JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY E.[OFICIO ],  E.[DEPT_NO ], D.[NOMBRE ]


--5. Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital.


SELECT COUNT(*) AS NUM_SALAS, S.[NOMBRE ] AS SALA, H.[NOMBRE ] AS HOSPITAL
FROM SALA S
INNER JOIN HOSPITAL H ON H.[HOSPITAL-COD ] = S.[HOSPITAL-COD ]
GROUP BY S.[NOMBRE ], H.[NOMBRE ]


--6. Calcular cuantos trabajadores hay en cada departamento(nombre de departamento)

SELECT COUNT(*) AS NUM_PERSONAS, D.[NOMBRE ]
FROM EMP E 
INNER JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY  D.[NOMBRE ]


--7. Buscar aquellos departamentos con cuatro o mas personas trabajando.

SELECT COUNT(*) AS NUM_PERSONAS, D.[NOMBRE ]
FROM EMP E 
INNER JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY  D.[NOMBRE ]
HAVING COUNT(*) > 3


--8. Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala 
--y el codigo de cada una de ellas.

SELECT AVG(S.[NUM-CAMA ]) AS NUM_MEDIO_CAMAS, S.[NOMBRE ], S.[SALA-COD ]
FROM SALA S

GROUP BY S.[SALA-COD ], S.[NOMBRE ]



--9. Calcular la media salarial por ciudad.


SELECT ROUND(AVG(E.[SALARIO ]),0) AS SAL_MEDIO, D.[LOC ]
FROM EMP E 
INNER JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY  D.[LOC ]
ORDER BY 1

--10. Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.

SELECT D.[APELLIDO ], H.[NOMBRE ] AS HOSPITAL, H.[DIRECCION ], H.[TELEFONO ]
FROM  DOCTOR D
JOIN HOSPITAL H ON H.[HOSPITAL-COD ] = D.[HOSPITAL_COD ]


--11. Mostrar los nombres de los hospitales junto con el mejor salario de los empleados de cada hospital.

SELECT H.[NOMBRE ], MAX(P.[SALARIO ]) AS MAX_SALARIO
FROM HOSPITAL H
JOIN PLANTILLA P ON H.[HOSPITAL-COD ] = P.[HOSPITAL-COD ]
GROUP BY H.[NOMBRE ]


--12. Visualizar el nombre de los empleados de la plantilla junto con el nombre de la sala, el nombre del hospital y el número de camas libres de cada una de ellas.

SELECT p.[APELLIDO ], S.[NOMBRE ] AS SALA ,S.[NUM-CAMA ],H.[NOMBRE ] ASHOSPITAL
FROM HOSPITAL H
JOIN PLANTILLA P ON H.[HOSPITAL-COD ] = P.[HOSPITAL-COD ]
JOIN SALA S ON S.[HOSPITAL-COD ] = P.[HOSPITAL-COD ]


--13. Visualizar el máximo salario, mínimo salario de los empleados dependiendo de la ciudad en la que trabajen. Indicando el número total de trabajadores por ciudad.

SELECT MAX(E.[SALARIO ]) AS MAX_SALARIO, MIN(E.[SALARIO ]) AS MIN_SALARIO, D.[LOC ]
FROM EMP E
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]
GROUP BY  D.[LOC ]

--14. Averiguar la combinación de que salas podría haber por cada uno de los hospitales.

SELECT S.[NOMBRE ] AS SALA ,H.[NOMBRE ] ASHOSPITAL
FROM HOSPITAL H
JOIN SALA S ON S.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]

SELECT S.[NOMBRE ] AS SALA ,H.[NOMBRE ] ASHOSPITAL
FROM HOSPITAL H
JOIN SALA S ON S.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]


--15. Mostrar el Numero de empleado, apellido, oficio y Nombre del departamento de los empleados, 
--junto al Número de empleado, apellido, oficio y Nombre del departamento de sus subordinados respectivamente, 
--para obtener una visión jerarquica de la empresa.

SELECT E.[EMP_NO ],E.[APELLIDO ],E.[OFICIO ],E.[DEPT_NO ], E.[DIR ],
	   E2.[EMP_NO ],E2.[APELLIDO ] AS APELLIDO_JEFE,E2.[OFICIO ] AS OFICIO_JEFE,
	   E2.[DEPT_NO ] AS DEPT_JEFE, E2.[DIR ] AS COD_JEFDE
FROM EMP E
JOIN EMP E2 ON E2.[EMP_NO ] = E.[DIR ]