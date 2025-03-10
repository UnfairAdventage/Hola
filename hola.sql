CREATE DATABASE PARCIAL_2_ALEXANDER;
USE PARCIAL_2_ALEXANDER;

DELIMITER $$

CREATE TABLE Departamento (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
)$$

CREATE TABLE Profesor (
    id INT PRIMARY KEY,
    nit VARCHAR(9) UNIQUE,
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    ciudad VARCHAR(50),
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo ENUM('M', 'F'),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id)
)$$

CREATE TABLE Grado (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
)$$

CREATE TABLE Asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(1000),
    creditos FLOAT,
    tipo ENUM('Obligatoria', 'Optativa'),
    curso TINYINT(3),
    cuatrimestre TINYINT(3),
    id_profesor INT,
    id_grado INT,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id),
    FOREIGN KEY (id_grado) REFERENCES Grado(id)
)$$

CREATE TABLE Curso_Escolar (
    id_curso INT PRIMARY KEY,
    anyo_inicio YEAR(4),
    anyo_fin YEAR(4)
)$$

CREATE TABLE Alumno (
    id INT PRIMARY KEY,
    nit VARCHAR(9) UNIQUE,
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    ciudad VARCHAR(50),
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo ENUM('M', 'F')
)$$

CREATE TABLE Alumno_se_matricula_Asignatura (
    id_alumno INT,
    id_asignatura INT,
    id_escolar INT,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id),
    FOREIGN KEY (id_escolar) REFERENCES Curso_Escolar(id_curso)
)$$

DELIMITER ;

INSERT INTO Departamento (id, nombre) VALUES
(10, 'Departamento 1'), (20, 'Departamento 2'), (30, 'Departamento 3'), (40, 'Departamento 4'),
(50, 'Departamento 5'), (60, 'Departamento 6'), (70, 'Departamento 7'), (80, 'Departamento 8'),
(90, 'Departamento 9'), (100, 'Departamento 10'), (110, 'Departamento 11'), (120, 'Departamento 12'),
(130, 'Departamento 13'), (140, 'Departamento 14'), (150, 'Departamento 15'), (160, 'Departamento 16'),
(170, 'Departamento 17'), (180, 'Departamento 18'), (190, 'Departamento 19'), (200, 'Departamento 20');

DELIMITER $$
CREATE PROCEDURE InsertProfesores()
BEGIN
    DECLARE i INT DEFAULT 100;
    WHILE i <= 10000 DO
        INSERT INTO Profesor (id, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento)
        VALUES (i, CONCAT('NIT', i), CONCAT('Nombre', i), CONCAT('Apellido1-', i), CONCAT('Apellido2-', i), CONCAT('Ciudad-', i),
                CONCAT('Direccion-', i), CONCAT('Tel-', i), '1975-01-01', IF(i % 2 = 0, 'F', 'M'), (i % 200) + 10);
        SET i = i + 100;
    END WHILE;
END$$
DELIMITER ;
CALL InsertProfesores();

INSERT INTO Grado (id, nombre) VALUES
(30, 'Grado 1'), (60, 'Grado 2'), (90, 'Grado 3'), (120, 'Grado 4'), (150, 'Grado 5'),
(180, 'Grado 6'), (210, 'Grado 7'), (240, 'Grado 8'), (270, 'Grado 9'), (300, 'Grado 10'),
(330, 'Grado 11'), (360, 'Grado 12'), (390, 'Grado 13'), (420, 'Grado 14');

INSERT INTO Curso_Escolar (id_curso, anyo_inicio, anyo_fin) VALUES
(50, 2001, 2002), (100, 2002, 2003), (150, 2003, 2004), (200, 2004, 2005),
(250, 2005, 2006), (300, 2006, 2007), (350, 2007, 2008), (400, 2008, 2009),
(450, 2009, 2010), (500, 2010, 2011);

DELIMITER $$
CREATE PROCEDURE InsertAlumnos()
BEGIN
    DECLARE i INT DEFAULT 1000;
    WHILE i < 1150 DO
        INSERT INTO Alumno (id, nit, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo)
        VALUES (i, CONCAT('NIT', i), CONCAT('Alumno', i), CONCAT('Apellido1-', i), CONCAT('Apellido2-', i), CONCAT('Ciudad-', i),
                CONCAT('Direccion-', i), CONCAT('Tel-', i), '2005-01-01', IF(i % 2 = 0, 'F', 'M'));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL InsertAlumnos();

DELIMITER $$
CREATE PROCEDURE InsertAsignaturas()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 40 DO
        INSERT INTO Asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
        VALUES (i, CONCAT('Asignatura ', i), 
               ROUND(RAND() * 3 + 3, 1), 
               IF(i % 2 = 0, 'Obligatoria', 'Optativa'),
               (i % 4) + 1,
               (i % 3) + 1,
               100 + ((i-1) * 100),
               30 + ((i % 14) * 30));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL InsertAsignaturas();

DELETE FROM Curso_Escolar;
DELIMITER $$
CREATE PROCEDURE InsertCursoEscolar()
BEGIN
    DECLARE i INT DEFAULT 50;
    WHILE i <= 2500 DO
        INSERT INTO Curso_Escolar (id_curso, anyo_inicio, anyo_fin)
        VALUES (i, 2000 + (i/50), 2001 + (i/50));
        SET i = i + 50;
    END WHILE;
END$$
DELIMITER ;
CALL InsertCursoEscolar();

DELIMITER $$
CREATE PROCEDURE InsertMatriculas()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 60 DO
        INSERT INTO Alumno_se_matricula_Asignatura (id_alumno, id_asignatura, id_escolar)
        VALUES (1000 + (i % 150), 
               (i % 40) + 1,
               50 + ((i % 50) * 50));
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL InsertMatriculas();

DESC Departamento;
DESC Profesor;
DESC Asignatura;
DESC Grado;
DESC Alumno_se_matricula_Asignatura;
DESC Curso_Escolar;
DESC Alumno;
SELECT * FROM Departamento;
SELECT * FROM Profesor;
SELECT * FROM Asignatura;
SELECT * FROM Grado;
SELECT * FROM Alumno_se_matricula_Asignatura;
SELECT * FROM Curso_Escolar;
SELECT * FROM Alumno;
SHOW TABLES;
