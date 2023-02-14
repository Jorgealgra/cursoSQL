-- CONSULTAS OPERADOR LIKE


/*Like utiliza los siguientes comodines para un determinado fin :

% Cualquier número de caracteres
_ Para un carácter individual
[ ] Para un conjunto de caracteres que esté dentro del corchete
[ ^ ] Que el carácter individual que no esté dentro del corchete

EJEMPLO: LIKE ‘%een’ Muestra todos los caracteres que acaben con een
EJEMPLO: LIKE ‘%een%’ Muestra todos los caracteres que contengan een en ese orden
EJEMPLO: LIKE ‘_en’ Muestra todos los caracteres que contenga tres letras y acaben en en
EJEMPLO: LIKE ‘[CK% ]’ Muestra todos los caracteres que empiecen por C o K
EJEMPLO: LIKE ‘[S-V]ing’ Nombre de 4 letras cuya primera letra estuviera entre S o V y acabe en ing
EJEMPLO: LIKE ‘M[^c]%’ Todos los que empiecen por M y segunda letra no sea una c. No hay limite de caracteres. */

-- EJERCICIOS

USE Hospital

--1. Seleccionar todos los empleados cuyo apellido comience por M 

SELECT E.[APELLIDO ]
FROM EMP E
WHERE E.[APELLIDO ] LIKE 'M%'

--2. Seleccionar todos los empleados cuyo apellido termine con la letra Z

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '%Z '

--3. Seleccionar todos los empleados que contengan en su apellido ER.

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '%ER%'

--4. Mostrar todos los empleados cuyo nombre sea de 4 letras y su apellido termine con la letra a

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '%___A '

--5. Mostrar todos los empleados cuyo apellido comience entre las letras E y F.

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '[E-F]%'

--6. Mostrar todos los empleados cuyo apellido comience por la letra A, 
--contenga dentro de su apellido de la letra A a la M y que terminen en O

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE 'A%[A-M]%O '

--7. Mostrar todos los empleados cuyo apellido comience por la letra M y la segunda letra no sea una A.

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE 'M[^A]%'

--8. Mostrar todos los empleados cuyo apellido sea de 5 letras y su tercera letra sea entra la A y la S terminando en Z.

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '__[A-S]_Z '


--9. Mostrar todos los empleados cuyo apellido sea de 6 letras y no comience entre la A y la D.

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE '[^A-D]_____'

--10. Mostrar todos los que empiecen por la A y cuya cuarta letra no esté comprendida entre A – G

SELECT *
FROM EMP
WHERE [APELLIDO ] LIKE 'A__[^A-G]%'
