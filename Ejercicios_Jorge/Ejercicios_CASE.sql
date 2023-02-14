-- EJERCICIOS CASE

--1. Queremos saber a qué empleados eliminariamos si quitasemos los departamentos 10 y 30 y cúales se mantendrían. 
--Mostrar un informe con el apellido, salario, oficio y fechas de alta en la empresa.

SELECT E.[APELLIDO ], E.[SALARIO ], E.[OFICIO ], E.[FECHA_ALTA ],
	   CASE E.[DEPT_NO ]
			WHEN 10 THEN 'ELIMINAR'
			WHEN 30 THEN 'ELIMINAR'
			ELSE 'NO ELIMINAR'
	   END 
	   AS EMP_ELIMINAR
FROM EMP E
--WHERE OFICIO = 'EMPLEADO'

--2. Debemos hacer recortes de salario en la empresa, para ello debemos saber a que personas recortaremos el sueldo, 
--cuales se mantendrán y cuales subiremos el puesto. Utilizar todos los empleados de la empresa(Plantilla y Empleados) 
--Cuando el salario sea menor de 100000, Subiremos sueldo, cuando esté entre 100000 y 250000 lo mantendremos y cuando sea superior, lo bajaremos.


SELECT E.[APELLIDO ], E.[SALARIO ], 
	   'ACCION'= CASE 
			WHEN E.[SALARIO ] <100000 THEN 'SUBIR SUELDO'
			WHEN E.[SALARIO ] BETWEEN 100000 AND  250000 THEN 'MANTENER'
			ELSE 'BAJAR SUELDO'
	   END 
	   
FROM EMP E
UNION
SELECT P.[APELLIDO ], P.[SALARIO ], 
	   'ACCION'= CASE 
			WHEN P.[SALARIO ] <100000 THEN 'SUBIR SUELDO'
			WHEN P.[SALARIO ] BETWEEN 100000 AND  250000 THEN 'MANTENER'
			ELSE 'BAJAR SUELDO'
	   END 
FROM PLANTILLA P


--3. Queremos saber que empleados de la plantilla trabajan en turno de tarde, noche o en otros, 
--para ello mostraremos ‘Tarde’ o ‘Noche’ dependiendo de sus valores.

SELECT P.[APELLIDO ], P.[SALARIO ], 
	   'TURNO'= CASE P.[TURNO ]
			WHEN 'T' THEN 'TARDE'
			WHEN 'N' THEN 'NOCHE'
			ELSE 'OTROS'
	   END 
FROM PLANTILLA P

--4. Queremos cambiar de localidad en Barcelona, para ello tenemos que saber qué empleados cambiarian de localidad y cúales no. 
--Combinar tablas y mostrar el nombre del departamento junto a los datos del empleado.


SELECT D.[NOMBRE ] AS NOMBRE_DPT, E.[APELLIDO ], E.[DEPT_NO ],
		'CAMBIAR lOCALIDAD'= CASE D.[LOC ]
								WHEN 'BARCELONA' THEN 'CAMBIAR LOCALIDAD'
								ELSE 'NO CAMBIAR LOCALIDAD'
							END 
FROM EMP E 
JOIN DEPT2 AS D ON E.[DEPT_NO ] = D.[DEPT_NO ]


--5. Queremos saber el número de trabajadores que cambiarían de localidad si cambiasemos a Barcelona y que número de trabajadores no cambiarian de localidad.


SELECT COUNT(*) AS NUM_TRABAJADORES, D.[LOC ] AS CIUDAD,
		'CAMBIAR lOCALIDAD'= CASE D.[LOC ]
								WHEN 'BARCELONA' THEN 'CAMBIAR LOCALIDAD'
								ELSE 'NO CAMBIAR LOCALIDAD'
							END 
FROM EMP E 
JOIN DEPT2 AS D ON E.[DEPT_NO ] = D.[DEPT_NO ]
GROUP BY D.[LOC ]



--6. Mostrar el apellido, la dirección, la fecha de nacimiento mostrando la década en la que está cada persona 
--el sexo mostrando si es masculino o femenino de la tabla enfermo.


SELECT E.[APELLIDO ], E.[DIRECCION ], E.[FECHA-NAC ], 
	   'DECADA_NACIMIENTO' = CASE 
					WHEN E.[FECHA-NAC ] BETWEEN '01/01/1940' AND '01/01/1950' THEN
					'DECADA DE LOS 40'
					WHEN E.[FECHA-NAC ] BETWEEN '01/01/1950' AND '01/01/1960' THEN
					'DECADA DE LOS 50'
					WHEN E.[FECHA-NAC ] BETWEEN '01/01/1960' AND '01/01/1970' THEN
					'DECADA DE LOS 60'
					WHEN E.[FECHA-NAC ] BETWEEN '01/01/1970' AND '01/01/1980' THEN
					'DECADA DE LOS 70'
					WHEN E.[FECHA-NAC ] BETWEEN '01/01/1980' AND '01/01/1990' THEN
					'DECADA DE LOS 80'
					ELSE 'DECADA INFERIOR O POSTERIOR'
				END,
	   'SEXO' = CASE E.[S ]
					WHEN 'M' THEN 'MASCULINO'
					ELSE 'FEMENINO'
				END

FROM ENFERMO E

--7. Mostrar el apellido, el salario, el oficio y el nombre del departamento de todos los empleados aunque no tengan departamento. 
--Si no tienen departamento mostraré que no tienen departamento. Mostraré además si tienen comisión o si no tienen comisión.

SELECT *, '¿TIENE_DEPARTAMENTO?' = CASE 
					WHEN E.[DEPT_NO ] >0 THEN 'TIENE DEPARTAMENTO'
					ELSE 'NO TIENE DEPARTAMENTO'
				END,

			 '¿TIENE_COMISIÓN?' = CASE 
					WHEN E.[COMISIÓN ] >0 THEN 'TIENE COMISIÓN'
					ELSE 'NO TIENE COMISIÓN'
				END
FROM EMP E

--8. Mostrar todas las camas que existen para cada hospital y cada sala. Mostraré el nombre del hospital, 
--las salas y su número de camas. Si no hubiese camas para algún hospital las dejaré a 0. 
--También mostraré que son muchas camas cuando sean más de 90, buen número cuando sean mayores de 40 y pocas camas para las demás.


SELECT H.[NOMBRE ] AS NOMBRE_HOSPITAL, S.[NOMBRE ] AS NOMBRE_SALAS, ISNULL(S.[NUM-CAMA ],0) AS NUM_CAMAS,
	   'CARACTESITCA_CAMAS'  = CASE
								WHEN S.[NUM-CAMA ] > 90 THEN 'MUCHAS CAMAS'
								WHEN S.[NUM-CAMA ] BETWEEN 40 AND 90 THEN 'NO ESTA MAL'
								ELSE 'HAY POCAS CAMAS'
							END
FROM HOSPITAL H
JOIN SALA S ON S.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]

--9. Seleccionar qué empleados están dentro de la media 
--y cuales están por debajo de la media, mostrando el apellido, oficio, salario, 
--comisión y el nombre de los departamentos. No dejar ningún campo a NULL. 

DECLARE @MEDIA INT
SELECT @MEDIA = AVG(E.[SALARIO ]) FROM EMP E
PRINT(CONCAT('MEDIA: ',  @MEDIA))

SELECT E.[APELLIDO ], E.[OFICIO ], E.[SALARIO ],  ISNULL(E.[COMISIÓN ], 0) AS COMISION , D.[NOMBRE ] AS NOMBRE_DEPARTAMENTO,
		  '¿ENCIMA DE LA MEDIA?' = CASE 
										WHEN @MEDIA > E.[SALARIO ] THEN 'DEBAJO DE LA MEDIA'
										ELSE 'ENCIMA O IGUAL QUE LA MEDIA'
									END

			
FROM EMP E
JOIN DEPT2 D ON D.[DEPT_NO ] = E.[DEPT_NO ]


