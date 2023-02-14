--FUNCIONES DE FECHA

USE Hospital


--GETDATE - obtener la fecha de hoy

SELECT GETDATE() as HOY


DECLARE @NOMBRE NVARCHAR (100)
SET @NOMBRE = 'jorge'
print(@NOMBRE)


--DATENAME
--Devuelve una cadena de caracteres que representa la parte de la fecha especificada de la fecha especificada
--Los calculos para las horas no son exactos cuando se trata de SmallDateTime, por lo que devuelve 0.

SELECT DATENAME(MONTH,E.[FECHA_ALTA ]) AS 'NOMBRE MES SIN ABREVIATURA'
FROM EMP E

SELECT DATENAME(WEEK,E.[FECHA_ALTA ]) AS 'NUMERO DE LA SEMANA'
FROM EMP E


SELECT DATENAME(WEEKDAY,E.[FECHA_ALTA ]) AS 'DIA DE LA SEMANA'
FROM EMP E

--...Se puede obtener cualquier valor que deseemos, hasta minutos, horas, etc


--DATAPART
--Devuelve la parte de la fecha u hora indicada.
--Sintaxis: Datepart(Valoradevolver, fecha)


SELECT DATEPART(MM,E.[FECHA_ALTA ]) AS 'MES',E.[APELLIDO ] FROM EMP E

SELECT DATEPART(HH,GETDATE()) AS 'HORA'

SELECT DATEPART(MI,GETDATE()) AS 'MINUTOS'


--Nombres de Fechas:
--DAY(fecha)
--Devuelve un INT, equivale a datepart

SELECT DAY(GETDATE()) AS DIA

SELECT DATEPART(DD,GETDATE()) AS DIA

SELECT MONTH(GETDATE()) AS MES

SELECT DATEPART(MM,GETDATE()) AS MES

SELECT YEAR(GETDATE()) AS AÑO

SELECT YEAR(E.[FECHA_ALTA ]) AS AÑO
FROM EMP E
WHERE E.[EMP_NO ] = 7876


--DATEADD

--Añade un número a la fecha puesta
--DateAdd( datepart , number, date )
--DatePart es el formato de lo que queremos añadir.
--Number es el número que queremos incrementar la fecha expuesta.

SELECT DATEADD(DD,7,'16/05/2015') AS 'FECHA CON 7 DIAS DE MAS'

SELECT DATEADD(MM,1,'16/05/2015') AS 'FECHA CON 1 MES DE MAS'

SELECT DATEADD(YY,3,'16/05/2015') AS 'FECHA CON 3 AÑOS DE MAS'


--DATEDIFF

--Devuelve la diferencia entre dos fechas en el intervalo que le indiquemos. 

--Sintaxis: DateDiff (DatoqueDevuelve, Fecha1, Fecha2)
 --Datoquedevuelve: Indicamos como queremos que haga la comparación y el tipo de dato que nos devolverá, años, días, minutos etc.

SELECT DATEDIFF(YYYY,E.[FECHA_ALTA ],GETDATE())
AS 'DIFERENCIA DE AÑOS ENTRE LA FECHA DE ALTA Y LA FECHA ACTUAL'
FROM EMP E
WHERE E.[EMP_NO ] = 7876
