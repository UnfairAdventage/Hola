
CREATE DATABASE ClinicaMedica;
USE ClinicaMedica;


CREATE TABLE Tipo_usuario (
    id_tipo_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(50),
    estado_tipo BOOLEAN DEFAULT TRUE
);


CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usu VARCHAR(100),
    apellido_usu VARCHAR(100),
    cedula_usu VARCHAR(20),
    direccion_usu VARCHAR(200),
    telefono_usu VARCHAR(20),
    estado_usu BOOLEAN DEFAULT TRUE,
    id_tipo_usuario INT,
    FOREIGN KEY (id_tipo_usuario) REFERENCES Tipo_usuario(id_tipo_usuario)
);


CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cli VARCHAR(100),
    apellido_cli VARCHAR(100),
    direccion_cli VARCHAR(200),
    telefono_cli VARCHAR(20),
    email_cli VARCHAR(100),
    ocupacion_cli VARCHAR(100),
    estado_cli BOOLEAN DEFAULT TRUE
);


CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pac VARCHAR(100),
    area_pac VARCHAR(100),
    sexo_pac CHAR(1),
    especie_pac VARCHAR(50),
    fechanacimiento_pac DATE,
    esterilizacion_pac BOOLEAN,
    tipoalimentacion_pac VARCHAR(100),
    estado_pac BOOLEAN DEFAULT TRUE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE Ficha_medica (
    id_ficha INT PRIMARY KEY AUTO_INCREMENT,
    codigo_ficha VARCHAR(20),
    fecha_apertura DATE,
    estado_ficha BOOLEAN DEFAULT TRUE,
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);


CREATE TABLE Historia_clinica (
    id_historia INT PRIMARY KEY AUTO_INCREMENT,
    codigo_historia VARCHAR(20),
    fecha_historia DATE,
    diagnostico_diferen TEXT,
    diagnostico_defini TEXT,
    tratamiento TEXT,
    id_ficha INT,
    FOREIGN KEY (id_ficha) REFERENCES Ficha_medica(id_ficha)
);


CREATE TABLE Examen (
    id_examen INT PRIMARY KEY AUTO_INCREMENT,
    nombre_exa VARCHAR(100),
    estado_exa BOOLEAN DEFAULT TRUE,
    tipo_exa VARCHAR(50)
);


CREATE TABLE Cita (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cita DATETIME,
    codigo_cita VARCHAR(20),
    estado_cita BOOLEAN DEFAULT TRUE,
    id_paciente INT,
    id_usuario INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


CREATE TABLE Orden_examen (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_examen INT,
    id_historia INT,
    fecha_orden DATE,
    FOREIGN KEY (id_examen) REFERENCES Examen(id_examen),
    FOREIGN KEY (id_historia) REFERENCES Historia_clinica(id_historia)
);



INSERT INTO Tipo_usuario (nombre_tipo, estado_tipo) VALUES
('Veterinario', TRUE),
('Asistente', TRUE);


INSERT INTO Usuario (nombre_usu, apellido_usu, cedula_usu, direccion_usu, telefono_usu, estado_usu, id_tipo_usuario) VALUES
('Juan', 'Pérez', '12345678', 'Calle Principal 123', '555-0101', TRUE, 1),
('María', 'González', '87654321', 'Avenida Central 456', '555-0202', TRUE, 2);


INSERT INTO Clientes (nombre_cli, apellido_cli, direccion_cli, telefono_cli, email_cli, ocupacion_cli, estado_cli) VALUES
('Pedro', 'Rodríguez', 'Calle 1 #234', '555-1111', 'pedro@email.com', 'Ingeniero', TRUE),
('Ana', 'Martínez', 'Avenida 2 #567', '555-2222', 'ana@email.com', 'Profesora', TRUE);


INSERT INTO Paciente (nombre_pac, area_pac, sexo_pac, especie_pac, fechanacimiento_pac, esterilizacion_pac, tipoalimentacion_pac, estado_pac, id_cliente) VALUES
('Luna', 'Pequeños animales', 'H', 'Canino', '2020-05-15', TRUE, 'Alimento balanceado', TRUE, 1),
('Max', 'Pequeños animales', 'M', 'Felino', '2021-03-10', FALSE, 'Alimento húmedo', TRUE, 2);


INSERT INTO Ficha_medica (codigo_ficha, fecha_apertura, estado_ficha, id_paciente) VALUES
('FM001', '2024-03-01', TRUE, 1),
('FM002', '2024-03-02', TRUE, 2);


INSERT INTO Historia_clinica (codigo_historia, fecha_historia, diagnostico_diferen, diagnostico_defini, tratamiento, id_ficha) VALUES
('HC001', '2024-03-01', 'Posible gastritis', 'Gastritis aguda', 'Dieta blanda y medicamentos', 1),
('HC002', '2024-03-02', 'Posible resfriado', 'Gripe felina', 'Antibióticos y reposo', 2);


INSERT INTO Examen (nombre_exa, estado_exa, tipo_exa) VALUES
('Hemograma completo', TRUE, 'Laboratorio'),
('Rayos X', TRUE, 'Imagen');


INSERT INTO Cita (fecha_cita, codigo_cita, estado_cita, id_paciente, id_usuario) VALUES
('2024-03-15 09:00:00', 'CIT001', TRUE, 1, 1),
('2024-03-16 10:00:00', 'CIT002', TRUE, 2, 2);


INSERT INTO Orden_examen (id_examen, id_historia, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02');
