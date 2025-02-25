
-- Crear la base de datos
CREATE DATABASE Extraordinario_Alexander;
USE Extraordinario_Alexander;

-- Tabla Lector
CREATE TABLE Lector (
    rut VARCHAR(12) NOT NULL,
    id_lector INT PRIMARY KEY AUTO_INCREMENT,
    nom_1 VARCHAR(50) NOT NULL,
    nom_2 VARCHAR(50),
    ape_1 VARCHAR(50) NOT NULL,
    ape_2 VARCHAR(50),
    curso VARCHAR(20),
    fecha_nac DATE,
    tipo VARCHAR(20),
    carnet VARCHAR(20),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla Autor
CREATE TABLE Autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nom_aut VARCHAR(100) NOT NULL
);

-- Tabla Materia
CREATE TABLE Materia (
    id_mat INT PRIMARY KEY AUTO_INCREMENT,
    nom_mat VARCHAR(50) NOT NULL
);

-- Tabla Editorial
CREATE TABLE Editorial (
    id_ed INT PRIMARY KEY AUTO_INCREMENT,
    nom_ed VARCHAR(100) NOT NULL
);

-- Tabla Libro
CREATE TABLE Libro (
    cod_top VARCHAR(20),
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    autor INT,
    materia INT,
    editorial INT,
    a_edicion INT,
    procedencia VARCHAR(100),
    fecha_ingreso DATE,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (materia) REFERENCES Materia(id_mat),
    FOREIGN KEY (editorial) REFERENCES Editorial(id_ed)
);

-- Tabla Prestamo
CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    pres_lect INT,
    fech_prest DATE,
    fech_dev DATE,
    estado VARCHAR(20),
    FOREIGN KEY (pres_lect) REFERENCES Lector(id_lector)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    usuario VARCHAR(50) PRIMARY KEY,
    pass VARCHAR(255) NOT NULL
);

INSERT INTO Autor (nom_aut) VALUES
('Gabriel García Márquez'),
('Isabel Allende');

INSERT INTO Materia (nom_mat) VALUES
('Literatura Latinoamericana'),
('Ciencia Ficción');

INSERT INTO Editorial (nom_ed) VALUES
('Planeta'),
('Penguin Random House');

INSERT INTO Lector (rut, nom_1, nom_2, ape_1, ape_2, curso, fecha_nac, tipo, carnet) VALUES
('12345678-9', 'Juan', 'Pablo', 'González', 'Pérez', '2°A', '2005-05-15', 'Estudiante', 'EST001'),
('98765432-1', 'María', 'José', 'Rodríguez', 'López', '3°B', '2004-08-22', 'Estudiante', 'EST002');

INSERT INTO Libro (cod_top, titulo, autor, materia, editorial, a_edicion, procedencia, fecha_ingreso, activo) VALUES
('LIT001', 'Cien años de soledad', 1, 1, 1, 2017, 'Compra', '2023-01-15', TRUE),
('LIT002', 'La casa de los espíritus', 2, 1, 2, 2019, 'Donación', '2023-02-20', TRUE);

INSERT INTO Prestamo (pres_lect, fech_prest, fech_dev, estado) VALUES
(1, '2024-03-01', '2024-03-15', 'Devuelto'),
(2, '2024-03-05', '2024-03-19', 'Prestado');

INSERT INTO Administrador (usuario, pass) VALUES
('admin1', 'password123'),
('admin2', 'password456');
