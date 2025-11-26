--
-- Tarea 6 - Parte #2 del Proyecto de Aula
-- SCRIPTS DE CONSULTAS BÁSICAS (SELECT sin JOIN)
--
-- Miembros del grupo
--Laura Tatiana Lopez Sanchez
--Juan Bernardo Rivera Garcia
--Sebastian Fonnegra Galeano


--
-- ============================================================
-- CONSULTAS BÁSICAS (SIN JOIN) - SUBSISTEMA DE HOSPITALIZACIÓN
-- ============================================================

---------------------------------------------------------------
-- Consulta 1: Pacientes ordenados alfabéticamente por nombre
---------------------------------------------------------------
SELECT id_paciente, primer_nombre, apellido
FROM paciente
ORDER BY primer_nombre;


---------------------------------------------------------------
-- Consulta 2: Médicos ordenados por especialidad
---------------------------------------------------------------
SELECT id_medico, nombre, primer_apellido, id_especialidad
FROM medico
ORDER BY id_especialidad;


---------------------------------------------------------------
-- Consulta 3: Enfermeros ordenados por nombre
---------------------------------------------------------------
SELECT id_enfermero, nombre, apellido, sexo
FROM enfermero
ORDER BY nombre;


---------------------------------------------------------------
-- Consulta 4: Hospitales ordenados alfabéticamente
---------------------------------------------------------------
SELECT id_hospital, nombre, direccion
FROM hospital
ORDER BY nombre;


---------------------------------------------------------------
-- Consulta 5: Hospitalizaciones ordenadas por fecha de ingreso
---------------------------------------------------------------
SELECT id_hosp, id_paciente, fecha_ingreso, fecha_salida
FROM hospitalizacion
ORDER BY fecha_ingreso;


-- ============================================================
-- CONSULTAS CON FUNCIONES DE AGREGACIÓN (OBLIGATORIAS)
-- ============================================================

---------------------------------------------------------------
-- Consulta 6 (COUNT): Total de hospitalizaciones registradas
---------------------------------------------------------------
SELECT COUNT(*) AS total_hospitalizaciones
FROM hospitalizacion
ORDER BY total_hospitalizaciones;


---------------------------------------------------------------
-- Consulta 7 (MAX): Mayor ID de paciente registrado
---------------------------------------------------------------
SELECT MAX(id_paciente) AS mayor_id_paciente
FROM paciente
ORDER BY mayor_id_paciente;


---------------------------------------------------------------
-- Consulta 8 (MIN): Menor ID de médico registrado
---------------------------------------------------------------
SELECT MIN(id_medico) AS menor_id_medico
FROM medico
ORDER BY menor_id_medico;


---------------------------------------------------------------
-- Consulta 9 (AVG): Promedio del id_especialidad en médicos
---------------------------------------------------------------
SELECT AVG(id_especialidad) AS promedio_especialidad
FROM medico
ORDER BY promedio_especialidad;


---------------------------------------------------------------
-- Consulta 10 (SUM): Suma de los id_hospital utilizados en hospitalización
---------------------------------------------------------------
SELECT SUM(id_hospital) AS suma_ids_hospital
FROM hospitalizacion
ORDER BY suma_ids_hospital;
