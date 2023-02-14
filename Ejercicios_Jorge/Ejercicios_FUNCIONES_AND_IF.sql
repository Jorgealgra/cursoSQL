-- FUNCIONES Y IF

--1. Mostrar una lista de los empleados con el siguiente texto. 
--Si el empleado no tiene nombre o la consulta devuelve null poner el texto de EMPLEADO SIN NOMBRE.

SELECT ISNULL('EL SEÑOR ' + CAST(E.[APELLIDO ] AS NVARCHAR(15))
				+ ' CON CARGO DE '
				+ CAST(E.[OFICIO ] AS NVARCHAR(15))
				+ ' SE DIÓ DE ALTA EL '
				+ CAST(DAY(E.[FECHA_ALTA ]) AS CHAR(2)) + ' DE '
				+ CAST(DATENAME(MONTH,E.[FECHA_ALTA ]) AS NVARCHAR(14)) + ' DE '
				+ CAST(YEAR(E.[FECHA_ALTA ]) AS CHAR(4)),
	   'EMPLEADO SIN NOMBRE') AS [DATOS EMPLEADOS]
FROM EMP E
ORDER BY E.[FECHA_ALTA ]


--2. Modificación del ejercicio anterior, 
-- incluir también la diferencia de años que lleva en la empresa el empleado desde la fecha actual.

SELECT ISNULL('EL SEÑOR ' + LTRIM(CAST(E.[APELLIDO ] AS NVARCHAR(15)))
			+ ' CON CARGO DE '
			+ LTRIM(CAST(E.[OFICIO ] AS NVARCHAR(15)))
			+ ' SE DIÓ DE ALTA EL '
			+ CAST(DAY(E.[FECHA_ALTA ]) AS CHAR(2)) + ' DE '
			+ LTRIM(CAST(DATENAME(MONTH,E.[FECHA_ALTA ]) AS NVARCHAR(15)))
			+ ' DE '
			+ CAST(YEAR(E.[FECHA_ALTA ]) AS CHAR(4))
			+ ' Y LLEVA EN LA EMPRESA '
			+ LTRIM(CAST(DATEDIFF(YYYY,E.[FECHA_ALTA ],GETDATE()) AS NVARCHAR(5)))
			+ ' AÑOS','EMPLEADO SIN NOMBRE')
AS [DATOS EMPLEADOS]
FROM EMP E ORDER BY E.[FECHA_ALTA ]


--3. Subir el sueldo en 5000 pts a los empleados de la plantilla del 
--hospital La Paz en caso de que la suma de sus salarios no supere el millon de pesetas, 
--en caso contrario bajar el sueldo en 5000 pts.

-- Creamos variable con la suma total de los salarios
DECLARE @SUMASAL INT
SELECT @SUMASAL = SUM(P.[SALARIO ])
FROM PLANTILLA P
INNER JOIN HOSPITAL AS H
ON P.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]
WHERE H.[NOMBRE ]= 'LA PAZ'


PRINT @SUMASAL
IF (@SUMASAL) < 1000000
	BEGIN
		--SUBIMOS EL SUELDO
		UPDATE PLANTILLA SET [SALARIO ] = P.[SALARIO ] + 5000 --Actualizamos la columna
		FROM PLANTILLA AS P
		INNER JOIN HOSPITAL AS H
		ON P.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]
		WHERE H.[NOMBRE ] = 'LA PAZ'

		--NOTIFICAMOS LA SUBIDA
		SELECT 'AL EMPLEADO DEL HOSPITAL '
		+ H.[NOMBRE ]
		+ ', '
		+ P.[APELLIDO ]
		+ ' CON FUNCIÓN DE '
		+ P.[FUNCION ]
		+ ', SE LE HA SUBIDO EL SUELDO EN 5000 PTS'
		FROM PLANTILLA AS P
		INNER JOIN HOSPITAL AS H
		ON P.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]
		WHERE H.[NOMBRE ] = 'LA PAZ'
	END
ELSE

	BEGIN
			--BAJAMOS EL SUELDO
			UPDATE PLANTILLA SET [SALARIO ]  = P.[SALARIO ]  - 5000
			FROM PLANTILLA AS P
			INNER JOIN HOSPITAL AS H
			ON P.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]
			WHERE H.[NOMBRE ] = 'LA PAZ'
			--NOTIFICAMOS LA BAJADA
			SELECT 'AL EMPLEADO DEL HOSPITAL '
					+ H.[NOMBRE ]
					+ ', '
					+ P.[APELLIDO ]
					+ ' CON FUNCIÓN DE '
					+ P.[FUNCION ]
					+ ', SE LE HA REDUCIDO EL SUELDO EN 5000 PTS'
			FROM PLANTILLA AS P
			INNER JOIN HOSPITAL AS H
			ON P.[HOSPITAL-COD ] = H.[HOSPITAL-COD ]
			WHERE H.[NOMBRE ] = 'LA PAZ'
	END



--4. Calcular la media de años que llevan los empleados en la empresa. 
--Si la media supera los 15 años, subir el sueldo en 20000 pts a los empleados que esten en la primera decada desde la fundación de la empresa. 
--Si no se supera esta media, se les subirá el sueldo a los empleados que no estén en la primera decada de la empresa. 
--Mostrar los datos después de la actualización con formato de Fecha Completa: Martes 19 Octubre 1978.


-- Declaramos las variables
DECLARE @MEDIA INT,@MINFECHA SMALLDATETIME,@DIF SMALLDATETIME
SELECT @MINFECHA = MIN(E.[FECHA_ALTA ]) FROM EMP E
SELECT @MEDIA = AVG(DATEDIFF(YY,E.[FECHA_ALTA ],GETDATE())) FROM EMP E
SELECT @DIF = DATEADD(YY,10,@MINFECHA)

PRINT('MEDIA:' + CAST(@MEDIA AS VARCHAR))
PRINT('MINFECHA:' + CAST(@MINFECHA AS VARCHAR))
PRINT('DIF:' + CAST(@DIF AS VARCHAR))


IF (@MEDIA > 15)
	BEGIN
		UPDATE EMP SET [SALARIO ] = EMP.[SALARIO ] + 20000 WHERE EMP.[FECHA_ALTA ] BETWEEN @MINFECHA AND @DIF
		SELECT DATENAME(WEEKDAY,E.[FECHA_ALTA ]) + ' '
		+ CAST(DATEPART(DAY,E.[FECHA_ALTA ]) AS VARCHAR) + ' '
		+ DATENAME(MONTH,E.[FECHA_ALTA ]) + ' '
		+ DATENAME(YEAR,E.[FECHA_ALTA ]) AS [FECHA COMPLETA]
		,E.[APELLIDO ], E.[SALARIO ],'ACTUALIZACION COMPLETA' AS [ACTUALIZACION] 
		FROM EMP E
		WHERE  E.[FECHA_ALTA ] BETWEEN @MINFECHA AND @DIF
		ORDER BY E.[FECHA_ALTA ]
	END
ELSE
	BEGIN
		UPDATE EMP SET [SALARIO ] = EMP.[SALARIO ] + 10000 WHERE EMP.[FECHA_ALTA ] > @DIF
		SELECT DATENAME(WEEKDAY,E.[FECHA_ALTA ]) + ' '
		+ CAST(DATEPART(DAY,E.[FECHA_ALTA ]) AS VARCHAR) + ' '
		+ DATENAME(MONTH,E.[FECHA_ALTA ]) + ' '
		+ DATENAME(YEAR,E.[FECHA_ALTA ]) AS [FECHA COMPLETA]
		,E.[APELLIDO ]
		,E.[SALARIO ],'ACTUALIZACION COMPLETA' AS [ACTUALIZACION]
		FROM EMP E
		WHERE E.[FECHA_ALTA ] > @DIF
		ORDER BY E.[FECHA_ALTA ]
	END




--5. Mostrar los años de antigüedad de los empleados, la fecha de alta, 
--y otro campo donde introduciremos los trienios que lleva en la empresa el trabajador hasta 7 como máximo y cuatro como mínimo.
--Si está fuera de este intervalo escribiremos 'No Bonificable'.

SELECT E.[APELLIDO ], E.[FECHA_ALTA ],'ANTIGÜEDAD' = CONVERT(NVARCHAR(50) ,
	  DATEDIFF(YY,E.[FECHA_ALTA ], GETDATE())) + ' AÑOS',
	  'TRIENIOS' = CASE DATEDIFF(YY, E.[FECHA_ALTA ], GETDATE()) / 3
						WHEN '10' THEN '10'
						WHEN '11' THEN '11'
						WHEN '12' THEN '12'
						WHEN '13' THEN '13'
						WHEN '14' THEN '14'
						ELSE 'NO BONIFICABLE'
					END
FROM EMP E


--6. Calculando la suma de salarios de los directores, subir el sueldo a los que cobren entre el minimo salario y 250000 pts.
--Mantener el sueldo a los directores si la suma está entre 1200000 y 1300000.
--Bajar el sueldo a los que se encuentren entre 250000 y el máximo salario.
--Mostrar los datos actualizados antes y después de los empleados que se actualicen.

IF (SELECT SUM(E.[SALARIO ]) FROM EMP E WHERE E.[OFICIO ] = 'DIRECTOR') < 1200001
	BEGIN
		PRINT 'SUELDO SUBIDO A LOS DIRECTORES'
		DECLARE @MINSAL INT

		SELECT @MINSAL = MIN(SALARIO) FROM EMP 
		WHERE OFICIO = 'DIRECTOR'

		PRINT 'ANTES DE LA ACTUALIZACIÓN'
		SELECT TOP 3 WITH TIES SALARIO, APELLIDO 
		FROM EMP 
		WHERE OFICIO = 'DIRECTOR'
		GROUP BY SALARIO,APELLIDO
		HAVING SALARIO BETWEEN @MINSAL AND 250000
		ORDER BY SALARIO

		UPDATE EMP SET SALARIO = SALARIO * 1.1
		WHERE OFICIO = 'DIRECTOR'
		AND
		SALARIO BETWEEN @MINSAL AND 250000
		UPDATE EMP SET SALARIO = SALARIO * 1.1 WHERE OFICIO =
		'DIRECTOR'
		PRINT 'DESPUÉS DE LA ACTUALIZACIÓN'
		SELECT TOP 3 WITH TIES SALARIO,APELLIDO FROM EMP WHERE
		OFICIO = 'DIRECTOR'
		GROUP BY SALARIO,APELLIDO
		HAVING SALARIO BETWEEN @MINSAL AND 250000
		ORDER BY SALARIO
	END
ELSE
	IF (SELECT SUM(SALARIO) FROM EMP WHERE OFICIO = 'DIRECTOR') BETWEEN 1200001 AND 1300000
		BEGIN
			PRINT 'MISMO SUELDO A LOS DIRECTORES'
			SELECT SALARIO,APELLIDO FROM EMP WHERE OFICIO = 'DIRECTOR'
			ORDER BY SALARIO
			END
		ELSE
			IF (SELECT SUM(SALARIO) FROM EMP WHERE OFICIO = 'DIRECTOR')> 1300001
				BEGIN
					PRINT 'SUELDO BAJADO A LOS DIRECTORES'
					DECLARE @MAXSAL INT
					SELECT @MAXSAL = MAX(SALARIO) FROM EMP WHERE OFICIO =
					'DIRECTOR'
					PRINT 'ANTES DE LA ACTUALIZACIÓN'
					SELECT TOP 3 WITH TIES SALARIO,APELLIDO FROM EMP WHERE
					OFICIO = 'DIRECTOR'
					GROUP BY SALARIO,APELLIDO
					HAVING SALARIO BETWEEN 200000 AND @MAXSAL
					ORDER BY SALARIO DESC
					UPDATE EMP SET SALARIO = SALARIO / 1.1
					WHERE OFICIO = 'DIRECTOR'
					AND
					SALARIO BETWEEN 200000 AND @MAXSAL
					PRINT 'DESPUÉS DE LA ACTUALIZACIÓN'
					SELECT TOP 3 WITH TIES SALARIO,APELLIDO FROM EMP WHERE
					OFICIO = 'DIRECTOR'
					GROUP BY SALARIO,APELLIDO
					HAVING SALARIO BETWEEN 200000 AND @MAXSAL
					ORDER BY SALARIO DESC
				END