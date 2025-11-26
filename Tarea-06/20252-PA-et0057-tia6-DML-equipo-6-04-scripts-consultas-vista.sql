--
-- Tarea 6 - Parte #2 del Proyecto de Aula
-- SCRIPTS DE CREACIÓN y CONSULTAS DE UNA VISTA 
--
-- Miembros del grupo
--Laura Tatiana Lopez Sanchez
--Juan Bernardo Rivera Garcia
--Sebastian Fonnegra Galeano


--
-- ============================================================
-- ===============  CREACIÓN DE SUPER VISTA  ===================
-- ================   6 JOIN OBLIGATORIOS   ====================
-- ============================================================

CREATE OR REPLACE VIEW vista_super_hospitalizacion AS
SELECT
    h.id_hosp,
    h.fecha_ingreso,
    h.fecha_salida,
    h.motivo,

    -- ---------------------- PACIENTE -------------------------
    p.id_paciente,
    p.primer_nombre AS paciente_nombre,
    p.apellido AS paciente_apellido,

    -- ----------------------- MÉDICO --------------------------
    m.id_medico,
    m.nombre AS medico_nombre,
    m.primer_apellido AS medico_apellido,

    -- -------------------- ESPECIALIDAD -----------------------
    esp.nombre_especialidad,

    -- ---------------------- ENFERMERO ------------------------
    e.id_enfermero,
    e.nombre AS enfermero_nombre,

    -- ----------------------- HOSPITAL ------------------------
    hosp.id_hospital,
    hosp.nombre AS hospital_nombre,
    hosp.nivel AS hospital_nivel

FROM hospitalizacion h
JOIN paciente p         ON h.id_paciente = p.id_paciente
JOIN medico m           ON h.id_medico = m.id_medico
JOIN especialidad esp   ON m.id_especialidad = esp.id_especialidad
JOIN enfermero e        ON h.id_enfermero = e.id_enfermero
JOIN hospital hosp      ON h.id_hospital = hosp.id_hospital;


-- ============================================================
-- ============ CONSULTAS USANDO LA SUPER VISTA ===============
-- ==================  (5 Consultas)  =========================
-- ============================================================


-- 1️⃣ Cantidad de hospitalizaciones por hospital (COUNT)
SELECT hospital_nombre, COUNT(*) AS total_hospitalizaciones
FROM vista_super_hospitalizacion
GROUP BY hospital_nombre
ORDER BY total_hospitalizaciones DESC;


-- 2️⃣ Promedio de días hospitalizados por paciente (AVG)
SELECT 
    paciente_nombre, 
    paciente_apellido,
    AVG(h.fecha_salida - h.fecha_ingreso) AS dias_promedio
FROM hospitalizacion h
JOIN vista_super_hospitalizacion v ON h.id_hosp = v.id_hosp
GROUP BY paciente_nombre, paciente_apellido
ORDER BY dias_promedio DESC;


-- 3️⃣ Médico con mayor cantidad de hospitalizaciones (MAX via ORDER)
SELECT 
    medico_nombre, 
    medico_apellido, 
    COUNT(*) AS total_atenciones
FROM vista_super_hospitalizacion
GROUP BY medico_nombre, medico_apellido
ORDER BY total_atenciones DESC;


-- 4️⃣ Número de hospitalizaciones por especialidad (SUM mediante COUNT)
SELECT 
    nombre_especialidad,
    COUNT(*) AS total_por_especialidad
FROM vista_super_hospitalizacion
GROUP BY nombre_especialidad
ORDER BY total_por_especialidad DESC;


-- 5️⃣ Pacientes más hospitalizados (MIN vía ORDER)
SELECT 
    paciente_nombre, 
    paciente_apellido,
    COUNT(*) AS veces_hospitalizado
FROM vista_super_hospitalizacion
GROUP BY paciente_nombre, paciente_apellido
ORDER BY veces_hospitalizado DESC;
