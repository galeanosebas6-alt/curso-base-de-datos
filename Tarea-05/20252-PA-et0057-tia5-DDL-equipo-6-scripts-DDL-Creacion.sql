-- Tarea 5 - Parte #1 del Proyecto de Aula
-- SCRIPTS DE CREACIÓN DE LA BASE DE DATOS
--
-- Miembros del grupo
-- (Agregar integrantes aquí)
--
-- Base de datos: instituciones_educativas
--
-- Orden de creación:
-- 1. Tablas independientes
-- 2. Tablas dependientes
-- 3. Tabla principal
-- 4. Tabla de hechos
--

-- ============================================================
-- DDL DE CREACIÓN DE TABLAS - VERSION 1
-- ============================================================

-- 1. Tipo Documento
CREATE TABLE tipo_documento (
    id_tipo_doc SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    version INT DEFAULT 1
);

-- 2. EPS
CREATE TABLE eps (
    id_eps SERIAL PRIMARY KEY,
    nombre_eps VARCHAR(100) NOT NULL,
    version INT DEFAULT 1
);

-- 3. Especialidad
CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    version INT DEFAULT 1
);

-- 4. Habitacion
CREATE TABLE habitacion (
    id_habitacion SERIAL PRIMARY KEY,
    numero INT NOT NULL,
    piso INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    version INT DEFAULT 1
);

-- 5. Estado Cama
CREATE TABLE estado_cama (
    id_estado SERIAL PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL,
    version INT DEFAULT 1
);

-- 6. Tipo Orden
CREATE TABLE tipo_orden (
    id_tipo_orden SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(100) NOT NULL,
    version INT DEFAULT 1
);

-- 7. Paciente
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    tipo_doc INT NOT NULL,
    documento VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_eps INT NOT NULL,
    version INT DEFAULT 1,
    FOREIGN KEY (tipo_doc) REFERENCES tipo_documento(id_tipo_doc),
    FOREIGN KEY (id_eps) REFERENCES eps(id_eps)
);

-- 8. Medico
CREATE TABLE medico (
    id_medico SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    id_especialidad INT NOT NULL,
    registro_medico VARCHAR(50) NOT NULL UNIQUE,
    version INT DEFAULT 1,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- 9. Cama
CREATE TABLE cama (
    id_cama SERIAL PRIMARY KEY,
    id_habitacion INT NOT NULL,
    id_estado INT NOT NULL,
    codigo_cama VARCHAR(30) NOT NULL UNIQUE,
    version INT DEFAULT 1,
    FOREIGN KEY (id_habitacion) REFERENCES habitacion(id_habitacion),
    FOREIGN KEY (id_estado) REFERENCES estado_cama(id_estado)
);

-- 10. Ingreso Hospitalario
CREATE TABLE ingreso_hospitalario (
    id_ingreso SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_cama INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    version INT DEFAULT 1,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_cama) REFERENCES cama(id_cama)
);

-- 11. Signos Vitales
CREATE TABLE signos_vitales (
    id_signo SERIAL PRIMARY KEY,
    id_ingreso INT NOT NULL,
    temperatura NUMERIC(4,1),
    presion VARCHAR(20),
    frecuencia_resp INT,
    version INT DEFAULT 1,
    FOREIGN KEY (id_ingreso) REFERENCES ingreso_hospitalario(id_ingreso)
);

-- 12. Orden Médica
CREATE TABLE orden_medica (
    id_orden SERIAL PRIMARY KEY,
    id_ingreso INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_orden DATE NOT NULL,
    id_tipo_orden INT NOT NULL,
    version INT DEFAULT 1,
    FOREIGN KEY (id_ingreso) REFERENCES ingreso_hospitalario(id_ingreso),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_tipo_orden) REFERENCES tipo_orden(id_tipo_orden)
);

-- 13. Detalle Orden
CREATE TABLE detalle_orden (
    id_detalle SERIAL PRIMARY KEY,
    id_orden INT NOT NULL,
    descripcion TEXT NOT NULL,
    version INT DEFAULT 1,
    FOREIGN KEY (id_orden) REFERENCES orden_medica(id_orden)
);

-- 14. Procedimiento
CREATE TABLE procedimiento (
    id_procedimiento SERIAL PRIMARY KEY,
    nombre_proc VARCHAR(150) NOT NULL,
    descripcion TEXT,
    version INT DEFAULT 1
);

ALTER TABLE detalle_orden
ADD COLUMN id_procedimiento INT,
ADD FOREIGN KEY (id_procedimiento) REFERENCES procedimiento(id_procedimiento);

-- 15. Evolución Médica
CREATE TABLE evolucion_medica (
    id_evolucion SERIAL PRIMARY KEY,
    id_ingreso INT NOT NULL,
    id_medico INT NOT NULL,
    fecha DATE NOT NULL,
    nota TEXT NOT NULL,
    version INT DEFAULT 1,
    FOREIGN KEY (id_ingreso) REFERENCES ingreso_hospitalario(id_ingreso),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);
