--
-- Tarea 6 - Parte #2 del Proyecto de Aula
-- SCRIPTS DE CONSULTAS AVANZADAS (SELECT con JOIN)
--
-- Miembros del grupo

--Laura Tatiana Lopez Sanchez
--Juan Bernardo Rivera Garcia
--Sebastian Fonnegra Galeano

--
-- ============================================================
-- CONSULTAS AVANZADAS (CON JOIN) – SUBSISTEMA DE HOSPITALIZACIÓN
-- ============================================================

---------------------------------------------------------------
-- 1. Consulta con 1 JOIN
-- Hospitalizaciones con nombre del paciente
---------------------------------------------------------------
SELECT h.id_hosp, p.primer_nombre, p.apellido, h.fecha_ingreso
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
ORDER BY h.id_hosp;


---------------------------------------------------------------
-- 2. Consulta con 1 JOIN
-- Hospitalizaciones con nombre del médico responsable
---------------------------------------------------------------
SELECT h.id_hosp, m.nombre AS medico, m.primer_apellido, h.fecha_ingreso
FROM hospitalizacion h
JOIN medico m ON h.id_medico = m.id_medico
ORDER BY m.nombre;


---------------------------------------------------------------
-- 3. Consulta con 1 JOIN
-- Hospitalizaciones con nombre del enfermero asignado
---------------------------------------------------------------
SELECT h.id_hosp, e.nombre AS enfermero, e.apellido
FROM hospitalizacion h
JOIN enfermero e ON h.id_enfermero = e.id_enfermero
ORDER BY e.nombre;


---------------------------------------------------------------
-- 4. Consulta con 2 JOIN
-- Paciente + Médico que lo atendió
---------------------------------------------------------------
SELECT h.id_hosp, p.primer_nombre AS paciente, m.nombre AS medico
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
JOIN medico m ON h.id_medico = m.id_medico
ORDER BY p.primer_nombre;


---------------------------------------------------------------
-- 5. Consulta con 2 JOIN
-- Paciente + Hospital donde estuvo internado
---------------------------------------------------------------
SELECT h.id_hosp, p.primer_nombre AS paciente, hosp.nombre AS hospital
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
JOIN hospital hosp ON h.id_hospital = hosp.id_hospital
ORDER BY hosp.nombre;


---------------------------------------------------------------
-- 6. Consulta con 2 JOIN
-- Médicos + Especialidad
---------------------------------------------------------------
SELECT m.id_medico, m.nombre, e.nombre_especialidad
FROM medico m
JOIN especialidad e ON m.id_especialidad = e.id_especialidad
ORDER BY e.nombre_especialidad;


---------------------------------------------------------------
-- 7. Consulta con 3 JOIN
-- Paciente + Médico + Enfermero
---------------------------------------------------------------
SELECT h.id_hosp, p.primer_nombre AS paciente, m.nombre AS medico, e.nombre AS enfermero
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
JOIN medico m ON h.id_medico = m.id_medico
JOIN enfermero e ON h.id_enfermero = e.id_enfermero
ORDER BY p.primer_nombre;


---------------------------------------------------------------
-- 8. Consulta con 3 JOIN
-- Hospitalización + Hospital + Médico + Especialidad
---------------------------------------------------------------
SELECT h.id_hosp, hosp.nombre AS hospital, m.nombre AS medico, esp.nombre_especialidad
FROM hospitalizacion h
JOIN hospital hosp ON h.id_hospital = hosp.id_hospital
JOIN medico m ON h.id_medico = m.id_medico
JOIN especialidad esp ON m.id_especialidad = esp.id_especialidad
ORDER BY hosp.nombre;


---------------------------------------------------------------
-- 9. Consulta con 4 JOIN
-- Paciente + Médico + Enfermero + Hospital + Especialidad
---------------------------------------------------------------
SELECT h.id_hosp, 
       p.primer_nombre AS paciente, 
       m.nombre AS medico, 
       esp.nombre_especialidad,
       e.nombre AS enfermero,
       hosp.nombre AS hospital
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
JOIN medico m ON h.id_medico = m.id_medico
JOIN especialidad esp ON m.id_especialidad = esp.id_especialidad
JOIN enfermero e ON h.id_enfermero = e.id_enfermero
JOIN hospital hosp ON h.id_hospital = hosp.id_hospital
ORDER BY p.primer_nombre;


---------------------------------------------------------------
-- 10. Consulta con 5 JOIN + función de agregados (SUM, COUNT, MAX, MIN, AVG)
-- Resumen de actividad médica por hospital
---------------------------------------------------------------
SELECT hosp.nombre AS hospital,
       COUNT(h.id_hosp) AS total_hospitalizaciones,
       MAX(h.fecha_ingreso) AS ultima_hospitalizacion,
       MIN(h.fecha_ingreso) AS primera_hospitalizacion,
       AVG(h.id_medico) AS promedio_id_medico,
       SUM(h.id_paciente) AS suma_ids_pacientes
FROM hospitalizacion h
JOIN paciente p ON h.id_paciente = p.id_paciente
JOIN medico m ON h.id_medico = m.id_medico
JOIN especialidad esp ON m.id_especialidad = esp.id_especialidad
JOIN hospital hosp ON h.id_hospital = hosp.id_hospital
GROUP BY hosp.nombre
ORDER BY hosp.nombre;
