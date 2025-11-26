--
-- Tarea 6 - Parte #2 del Proyecto de Aula
-- SCRIPTS DE MODIFICACIÓN DE LA BASE DE DATOS (UPDATE, DELETES)
--
-- Miembros del grupo
--Laura Tatiana Lopez Sanchez
--Juan Bernardo Rivera Garcia
--Sebastian Fonnegra Galeano

-- ============================================================
-- SCRIPT DE MODIFICACIÓN DML – EQUIPO X
-- ============================================================

---------------------------------------------------------------
-- 5.1 CREACIÓN DE 5 ÍNDICES
---------------------------------------------------------------

-- Índice 1 – Paciente: index por documento
CREATE INDEX idx_paciente_documento ON paciente(documento);

-- Índice 2 – Médico: index por especialidad
CREATE INDEX idx_medico_especialidad ON medico(id_especialidad);

-- Índice 3 – Enfermero: index por sexo
CREATE INDEX idx_enfermero_sexo ON enfermero(sexo);

-- Índice 4 – Hospital: index por nombre
CREATE INDEX idx_hospital_nombre ON hospital(nombre);

-- Índice 5 – Hospitalización: index por fecha_ingreso
CREATE INDEX idx_hosp_fecha_ing ON hospitalizacion(fecha_ingreso);



---------------------------------------------------------------
-- 5.2 AGREGAR 5 CAMPOS EN 5 TABLAS DIFERENTES
---------------------------------------------------------------

-- Campo 1 – Paciente: correo electrónico
ALTER TABLE paciente
ADD COLUMN correo VARCHAR(100);

-- Campo 2 – Médico: telefono
ALTER TABLE medico
ADD COLUMN telefono VARCHAR(20);

-- Campo 3 – Enfermero: turno
ALTER TABLE enfermero
ADD COLUMN turno VARCHAR(20);

-- Campo 4 – Hospital: tipo (público/privado)
ALTER TABLE hospital
ADD COLUMN tipo VARCHAR(20);

-- Campo 5 – Hospitalización: estado del caso
ALTER TABLE hospitalizacion
ADD COLUMN estado VARCHAR(20);



---------------------------------------------------------------
-- 5.3 CHECK EN 5 TABLAS DIFERENTES
---------------------------------------------------------------

-- CHECK 1 – Paciente: sexo solo F o M
ALTER TABLE paciente
ADD CONSTRAINT chk_sexo CHECK (sexo IN ('F','M'));

-- CHECK 2 – Médico: registro debe empezar por 'RM'
ALTER TABLE medico
ADD CONSTRAINT chk_registro CHECK (registro_medico LIKE 'RM%');

-- CHECK 3 – Enfermero: turno solo Día / Noche
ALTER TABLE enfermero
ADD CONSTRAINT chk_turno CHECK (turno IN ('Dia','Noche'));

-- CHECK 4 – Hospital: tipo solo Público / Privado
ALTER TABLE hospital
ADD CONSTRAINT chk_tipo_hospital CHECK (tipo IN ('Publico','Privado'));

-- CHECK 5 – Hospitalización: estado solo ACTIVO / CERRADO
ALTER TABLE hospitalizacion
ADD CONSTRAINT chk_estado CHECK (estado IN ('Activo','Cerrado'));



---------------------------------------------------------------
-- 5.4 RENOMBRAR CAMPOS EN 5 TABLAS DIFERENTES
---------------------------------------------------------------

-- Rename 1 – Paciente: primer_nombre → nombre
ALTER TABLE paciente
RENAME COLUMN primer_nombre TO nombre;

-- Rename 2 – Médico: primer_apellido → apellido
ALTER TABLE medico
RENAME COLUMN primer_apellido TO apellido;

-- Rename 3 – Enfermero: registro → registro_profesional
ALTER TABLE enfermero
RENAME COLUMN registro TO registro_profesional;

-- Rename 4 – Hospital: telefono → telefono_contacto
ALTER TABLE hospital
RENAME COLUMN telefono TO telefono_contacto;

-- Rename 5 – Hospitalización: fecha_ingreso → fecha_entrada
ALTER TABLE hospitalizacion
RENAME COLUMN fecha_ingreso TO fecha_entrada;

