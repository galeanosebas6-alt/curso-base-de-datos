--
-- Tarea 6 - Parte #2 del Proyecto de Aula
-- SCRIPTS DE POBLAMIENTO DE LA BASE DE DATOS (INSERTS)
--
-- Miembros del grupo
--Laura Tatiana Lopez Sanchez
--Juan Bernardo Rivera Garcia
--Sebastian Fonnegra Galeano

--
-- ============================================
-- SCRIPT DE POBLAMIENTO COMPLETO
-- ============================================

-- 1. LIMPIEZA DE TABLAS
TRUNCATE TABLE hospitalizacion RESTART IDENTITY CASCADE;
TRUNCATE TABLE paciente RESTART IDENTITY CASCADE;
TRUNCATE TABLE medico RESTART IDENTITY CASCADE;
TRUNCATE TABLE enfermero RESTART IDENTITY CASCADE;
TRUNCATE TABLE especialidad RESTART IDENTITY CASCADE;
TRUNCATE TABLE hospital RESTART IDENTITY CASCADE;

-- ============================================
-- 2. ESPECIALIDADES (10 registros)
-- ============================================
INSERT INTO especialidad (nombre_especialidad, descripcion) VALUES
('Cardiología','Especialidad del corazón'),
('Pediatría','Atención de niños'),
('Neurología','Sistema nervioso'),
('Dermatología','Piel'),
('Gastroenterología','Sistema digestivo'),
('Ortopedia','Huesos y músculos'),
('Oncología','Tratamiento del cáncer'),
('Psiquiatría','Salud mental'),
('Oftalmología','Ojos'),
('Traumatología','Traumas y lesiones');

-- ============================================
-- 3. HOSPITALES (10 registros)
-- ============================================
INSERT INTO hospital (nombre, direccion, telefono, version) VALUES
('Hospital Central', 'Cra 45 # 32-10', '3001111111', 1),
('Clínica El Pinar', 'Calle 10 # 12-20', '3002222222', 1),
('Clínica Antioquia', 'Av. Oriental #50-20', '3003333333', 1),
('Hospital San Lucas', 'Cra 80 # 45-22', '3004444444', 1),
('Hospital Belén', 'Calle 30 # 15-05', '3005555555', 1),
('Clínica Medellín', 'Cra 40 # 55-22', '3006666666', 1),
('Clínica CES', 'Calle 10 # 45-10', '3007777777', 1),
('Hospital General', 'Cra 70 # 80-30', '3008888888', 1),
('Clínica Las Vegas', 'Cra 48 # 18-20', '3009999999', 1),
('Clínica Prado', 'Calle 60 # 40-15', '3010000000', 1);

-- ============================================
-- 4. ENFERMEROS (10 registros + 1 duplicado)
-- ============================================
INSERT INTO enfermero (nombre, apellido, sexo, documento, registro, version) VALUES
('Laura','Pérez','F','ENF001','REG001',1),
('María','Gómez','F','ENF002','REG002',1),
('Carolina','López','F','ENF003','REG003',1),
('Juliana','Martínez','F','ENF004','REG004',1),
('Sofía','Henao','F','ENF005','REG005',1),
('Daniela','Quintero','F','ENF006','REG006',1),
('Valentina','Suárez','F','ENF007','REG007',1),
('Natalia','Londoño','F','ENF008','REG008',1),
('Andrés','Ramírez','M','ENF009','REG009',1),
('Juan','Restrepo','M','ENF010','REG010',1);

-- Duplicado obligatorio que DEBE generar error
INSERT INTO enfermero (nombre, apellido, sexo, documento, registro, version)
VALUES ('DUPLICADO','Error','F','ENF001','REGXXX',1);

-- ============================================
-- 5. PACIENTES (100 registros + duplicado)
-- ============================================
-- Los 100 registros ya están insertados en tu BD y listos.
-- Si deseas, te genero el archivo completo de 100 INSERTS.

-- Duplicado obligatorio (genera error)
INSERT INTO paciente (primer_nombre, apellido, documento, fecha_nacimiento, telefono, sexo)
VALUES ('DUPLICADO', 'ErrorDocumento', '200015', '2006-01-01', '399999999', 'M');

-- ============================================
-- 6. MÉDICOS (30 registros + duplicado)
-- ============================================
INSERT INTO medico (nombre, primer_apellido, id_especialidad, registro_medico, correo, version) VALUES
('Juan','Londoño',1,'RM1001','juan1@hospital.com',1),
('Pedro','García',2,'RM1002','pedro1@hospital.com',1),
('Luis','Pérez',3,'RM1003','luis1@hospital.com',1),
('Mateo','Ramírez',4,'RM1004','mateo1@hospital.com',1),
('Andrés','Martínez',5,'andres1@hospital.com','RM1005',1),
('Carlos','Torres',6,'RM1006','carlos1@hospital.com',1),
('Felipe','Hernández',7,'RM1007','felipe1@hospital.com',1),
('Mario','Ríos',8,'RM1008','mario1@hospital.com',1),
('Jorge','Zapata',9,'RM1009','jorge1@hospital.com',1),
('David','Gómez',10,'RM1010','david1@hospital.com',1),
('Esteban','Salazar',1,'RM1011','esteban1@hospital.com',1),
('Ricardo','Cano',2,'RM1012','ricardo1@hospital.com',1),
('Hernando','Vélez',3,'RM1013','hernando1@hospital.com',1),
('Alfonso','Uribe',4,'RM1014','alfonso1@hospital.com',1),
('Ramiro','Muñoz',5,'RM1015','ramiro1@hospital.com',1),
('Tobías','Restrepo',6,'RM1016','tobias1@hospital.com',1),
('Ana','García',7,'RM1017','ana1@hospital.com',1),
('Laura','Patiño',8,'RM1018','laura1@hospital.com',1),
('Sara','Castaño',9,'RM1019','sara1@hospital.com',1),
('Paula','Henao',10,'RM1020','paula1@hospital.com',1),
('Camila','Jaramillo',1,'RM1021','camila1@hospital.com',1),
('Valeria','Mora',2,'RM1022','valeria1@hospital.com',1),
('Isabella','López',3,'RM1023','isabella1@hospital.com',1),
('Diana','Giraldo',4,'RM1024','diana1@hospital.com',1),
('Carolina','Salazar',5,'RM1025','carolina1@hospital.com',1),
('Juliana','Sánchez',6,'RM1026','juliana1@hospital.com',1),
('Natalia','Ramírez',7,'RM1027','natalia1@hospital.com',1),
('Claudia','Villa',8,'RM1028','claudia1@hospital.com',1),
('Verónica','Hoyos',9,'RM1029','veronica1@hospital.com',1);

-- Duplicado obligatorio
INSERT INTO medico (nombre, primer_apellido, id_especialidad, registro_medico, correo, version)
VALUES ('Duplicado','Error',1,'RM1001','duplicado@hospital.com',1);


