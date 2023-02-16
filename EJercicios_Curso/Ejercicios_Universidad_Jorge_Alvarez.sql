DROP DATABASE IF EXISTS universidad;


CREATE DATABASE universidad;


USE universidad;

CREATE TABLE departamento (
 id INT  PRIMARY KEY,
 nombre nVARCHAR(50) NOT NULL
);



CREATE TABLE persona (
 id INT  PRIMARY KEY,
 nif VARCHAR(9) UNIQUE,
 nombre VARCHAR(25) NOT NULL,
 apellido1 VARCHAR(50) NOT NULL,
 apellido2 VARCHAR(50),
 ciudad VARCHAR(25) NOT NULL,
 direccion VARCHAR(50) NOT NULL,
 telefono VARCHAR(9),
 fecha_nacimiento DATE NOT NULL,
 sexo nVARCHAR(10) NOT NULL,
 tipo nVARCHAR(10) NOT NULL
);


CREATE TABLE profesor (
 id_profesor INT PRIMARY KEY,
 id_departamento INT NOT NULL,
 FOREIGN KEY (id_profesor) REFERENCES persona(id),
 FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE grado (
 id INT  PRIMARY KEY,
 nombre NVARCHAR(100) NOT NULL
);



CREATE TABLE asignatura (
 id INT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 creditos DECIMAL  NOT NULL,
 tipo nVARCHAR(15) NOT NULL,
 curso TINYINT NOT NULL,
 cuatrimestre TINYINT NOT NULL,
 id_profesor INT,
 id_grado INT NOT NULL,
 FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
 FOREIGN KEY(id_grado) REFERENCES grado(id)
);

CREATE TABLE curso_escolar (
 id INT PRIMARY KEY,
 anyo_inicio INT NOT NULL,
 anyo_fin INT NOT NULL
);


CREATE TABLE alumno_se_matricula_asignatura (
 id_alumno INT NOT NULL,
 id_asignatura INT NOT NULL,
 id_curso_escolar INT NOT NULL,
 PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
 FOREIGN KEY (id_alumno) REFERENCES persona(id),
 FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
 FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);


--Datos
 /* Departamento */
INSERT INTO departamento VALUES (1, 'Inform�tica');
INSERT INTO departamento VALUES (2, 'Matem�ticas');
INSERT INTO departamento VALUES (3, 'Econom�a y Empresa');
INSERT INTO departamento VALUES (4, 'Educaci�n');
INSERT INTO departamento VALUES (5, 'Agronom�a');
INSERT INTO departamento VALUES (6, 'Qu�mica y F�sica');
INSERT INTO departamento VALUES (7, 'Filolog�a');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biolog�a y Geolog�a');
 
 /* Persona */
INSERT INTO persona VALUES (1, '26902806M', 'Salvador', 'S�nchez', 'P�rez', 'Almer�a', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO persona VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almer�a', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO persona VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almer�a', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor');
INSERT INTO persona VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almer�a', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO persona VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almer�a', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor');
INSERT INTO persona VALUES (6, '04233869Y', 'Jos�', 'Koss', 'Bayer', 'Almer�a', 'C/ J�piter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO persona VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almer�a', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO persona VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almer�a', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
INSERT INTO persona VALUES (9, '82842571K', 'Ram�n', 'Herzog', 'Tremblay', 'Almer�a', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almer�a', 'C/ Plut�n', NULL, '1977/05/19', 'M', 'profesor');
INSERT INTO persona VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almer�a', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almer�a', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almer�a', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almer�a', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almer�a', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almer�a', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almer�a', 'C/ Sierra de G�dor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almer�a', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almer�a', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
INSERT INTO persona VALUES (21, '79089577Y', 'Juan', 'Guti�rrez', 'L�pez', 'Almer�a', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (22, '41491230N', 'Antonio', 'Dom�nguez', 'Guerrero', 'Almer�a', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona VALUES (23, '64753215G', 'Irene', 'Hern�ndez', 'Mart�nez', 'Almer�a', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almer�a', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* Profesor */
INSERT INTO profesor VALUES (3, 1);
INSERT INTO profesor VALUES (5, 2);
INSERT INTO profesor VALUES (8, 3);
INSERT INTO profesor VALUES (10, 4);
INSERT INTO profesor VALUES (12, 4);
INSERT INTO profesor VALUES (13, 6);
INSERT INTO profesor VALUES (14, 1);
INSERT INTO profesor VALUES (15, 2);
INSERT INTO profesor VALUES (16, 3);
INSERT INTO profesor VALUES (17, 4);
INSERT INTO profesor VALUES (18, 5);
INSERT INTO profesor VALUES (20, 6);
 
 /* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingenier�a Agr�cola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingenier�a El�ctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingenier�a Electr�nica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingenier�a Inform�tica (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingenier�a Mec�nica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingenier�a Qu�mica Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnolog�a (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matem�ticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Qu�mica (Plan 2009)');
 
/* Asignatura */
INSERT INTO asignatura VALUES (1, '�lgegra lineal y matem�tica discreta', 6, 'b�sica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (2, 'C�lculo', 6, 'b�sica', 1, 1, 14, 4);
INSERT INTO asignatura VALUES (3, 'F�sica para inform�tica', 6, 'b�sica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (4, 'Introducci�n a la programaci�n', 6, 'b�sica', 1, 1, 14, 4);
INSERT INTO asignatura VALUES (5, 'Organizaci�n y gesti�n de empresas', 6, 'b�sica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (6, 'Estad�stica', 6, 'b�sica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnolog�a de computadores', 6, 'b�sica', 1, 2, 3, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electr�nica', 6, 'b�sica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (9, 'L�gica y algor�tmica', 6, 'b�sica', 1, 2, 3, 4);
INSERT INTO asignatura VALUES (10, 'Metodolog�a de la programaci�n', 6, 'b�sica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'b�sica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingenier�a del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'b�sica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificaci�n y Gesti�n de Proyectos Inform�ticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programaci�n de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingenier�a de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integraci�n de las Tecnolog�as de la Informaci�n en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Dise�o del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Informaci�n para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnolog�as web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teor�a de c�digos y criptograf�a', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administraci�n de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y M�todos de Ingenier�a del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Inform�tica industrial y rob�tica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingenier�a de Sistemas de Informaci�n', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Dise�o del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electr�nico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Perif�ricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnolog�as de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de im�genes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administraci�n de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gesti�n de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'L�neas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingenier�a del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnolog�as multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'An�lisis y planificaci�n de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo R�pido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gesti�n de la Calidad y de la Innovaci�n Tecnol�gica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingenier�a del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Inform�tica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'F�sica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matem�ticas I', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Qu�mica general', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Qu�mica org�nica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biolog�a vegetal y animal', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioqu�mica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Gen�tica', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matem�ticas II', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiolog�a', 6, 'b�sica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Bot�nica agr�cola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiolog�a vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Gen�tica molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingenier�a bioqu�mica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodin�mica y cin�tica qu�mica aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnolog�a microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingenier�a gen�tica', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virolog�a', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiolog�a animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y bios�ntesis de biomol�culas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separaci�n', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patolog�a molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'T�cnicas instrumentales b�sicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinform�tica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnolog�a de los productos hortofrut�culas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnolog�a vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Gen�mica y prote�mica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnol�gicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'T�cnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);
INSERT INTO curso_escolar VALUES (5, 2018, 2019);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 10, 5);


-- 7.3 Consultas sobre una tabla; 

--1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El 
--listado deber� estar ordenado alfab�ticamente de menor a mayor por el primer apellido, segundo 
--apellido y nombre.

SELECT P.apellido1
FROM PERSONA P

--2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su n�mero de 
--tel�fono en la base de datos.


--3. Devuelve el listado de los alumnos que nacieron en 1999.


--4. Devuelve el listado de profesores que no han dado de alta su n�mero de tel�fono en la base de 
--datos y adem�s su nif termina en K.


--5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso 
--del grado que tiene el identificador 7.




--7.4 Consultas multitabla (Composici�n interna); 


--1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en 
--el Grado en Ingenier�a Inform�tica (Plan 2015).

SELECT P.nombre
FROM persona P
JOIN alumno_se_matricula_asignatura A ON A.id_alumno = P.id
JOIN asignatura ASS ON ASS.id = A.id_asignatura
JOIN grado G ON G.id = ASS.id_grado
WHERE  G.nombre IN ('Grado en Ingenier�a Inform�tica (Plan 2015)') AND P.sexo IN ('M')


--2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingenier�a Inform�tica (Plan 
--2015).


SELECT ASS.nombre as ASIGNATURAS_INGIENERIA_INFORMATICA
FROM persona P
JOIN alumno_se_matricula_asignatura A ON A.id_alumno = P.id
JOIN asignatura ASS ON ASS.id = A.id_asignatura
JOIN grado G ON G.id = ASS.id_grado
WHERE  G.nombre IN ('Grado en Ingenier�a Inform�tica (Plan 2015)') 
GROUP BY  ASS.nombre



--3. Devuelve un listado de los profesores junto con el nombre del departamento al que est�n 
--vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre 
--y nombre del departamento. El resultado estar� ordenado alfab�ticamente de menor a mayor por 
--los apellidos y el nombre.

SELECT PE.apellido1, PE.apellido2, PE.nombre, D.nombre
FROM profesor P
JOIN departamento D ON D.id = P.id_departamento
JOIN persona PE ON P.id_profesor = PE.id
ORDER BY 1,2,3

--4. Devuelve un listado con el nombre de las asignaturas, a�o de inicio y a�o de fin del curso escolar 
--del alumno con nif 26902806M.


SELECT A.nombre, C.anyo_fin, C.anyo_fin
FROM asignatura a
JOIN alumno_se_matricula_asignatura AA ON AA.id_asignatura = A.id
JOIN curso_escolar C ON C.id = AA.id_curso_escolar
JOIN persona P ON P.id = AA.id_alumno
WHERE P.nif IN ('26902806M')



--5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que 
--imparten alguna asignatura en el Grado en Ingenier�a Inform�tica (Plan 2015).

SELECT D.nombre
FROM profesor P
JOIN departamento D ON D.id = P.id_departamento
JOIN persona PE ON P.id_profesor = PE.id
JOIN asignatura ASS ON ASS.id_profesor =P.id_profesor
JOIN grado G ON G.id = ASS.id_grado
WHERE ASS.nombre IN HERE  G.nombre IN ('Grado en Ingenier�a Inform�tica (Plan 2015)') 

--6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante 
--el curso escolar 2018/2019.--7.5 Consultas multitabla (Composici�n externa); 

--Resuelva todas las consultas utilizando las cl�usulas LEFT JOIN y RIGHT JOIN.

--1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen 
--vinculados. El listado tambi�n debe mostrar aquellos profesores que no tienen ning�n 
--departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, 
--primer apellido, segundo apellido y nombre del profesor. El resultado estar� ordenado 
--alfab�ticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

--2. Devuelve un listado con los profesores que no est�n asociados a un departamento.

--3. Devuelve un listado con los departamentos que no tienen profesores asociados.

--4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

--5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

--6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya 
--impartido en ning�n curso escolar. El resultado debe mostrar el nombre del departamento y el 
--nombre de la asignatura que no se haya impartido nunca.


--7.6 Consultas resumen; 
--1. Devuelve el n�mero total de alumnas que hay.
--2. Calcula cu�ntos alumnos nacieron en 1999.
--3. Calcula cu�ntos profesores hay en cada departamento. El resultado s�lo debe mostrar dos 
--columnas, una con el nombre del departamento y otra con el n�mero de profesores que hay en 
--ese departamento. El resultado s�lo debe incluir los departamentos que tienen profesores 
--asociados y deber� estar ordenado de mayor a menor por el n�mero de profesores.
--4. Devuelve un listado con todos los departamentos y el n�mero de profesores que hay en cada uno 
--de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
--Estos departamentos tambi�n tienen que aparecer en el listado.
--5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el n�mero 
--de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen 
--asignaturas asociadas. Estos grados tambi�n tienen que aparecer en el listado. El resultado deber� 
--estar ordenado de mayor a menor por el n�mero de asignaturas.
--6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el n�mero 
--de asignaturas que tiene cada uno, de los grados que tengan m�s de 40 asignaturas asociadas.
--7. Devuelve un listado que muestre el nombre de los grados y la suma del n�mero total de cr�ditos 
--que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, 
--tipo de asignatura y la suma de los cr�ditos de todas las asignaturas que hay de ese tipo. Ordene 
--el resultado de mayor a menor por el n�mero total de cr�ditos.
--8. Devuelve un listado que muestre cu�ntos alumnos se han matriculado de alguna asignatura en 
--cada uno de los cursos escolares. El resultado deber� mostrar dos columnas, una columna con el 
--a�o de inicio del curso escolar y otra con el n�mero de alumnos matriculados.
--9. Devuelve un listado con el n�mero de asignaturas que imparte cada profesor. El listado debe tener 
--en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrar� cinco 
--columnas: id, nombre, primer apellido, segundo apellido y n�mero de asignaturas. El resultado 
--estar� ordenado de mayor a menor por el n�mero de asignaturas.--7.7 Subconsultas; 

--1. Devuelve todos los datos del alumno m�s joven.

SELECT *
FROM persona P
WHERE p.fecha_nacimiento in ( SELECT MIN(p.fecha_nacimiento)
							  FROM persona p 
							  JOIN alumno_se_matricula_asignatura A ON A.id_alumno = P.id
							  )


--2. Devuelve un listado con los profesores que no est�n asociados a un departamento.








--3. Devuelve un listado con los departamentos que no tienen profesores asociados.







--4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten 
--ninguna asignatura.




--5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.





--6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ning�n 
--curso escolar