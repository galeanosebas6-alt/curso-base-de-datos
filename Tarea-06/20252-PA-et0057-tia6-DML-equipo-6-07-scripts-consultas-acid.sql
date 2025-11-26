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
--            VALIDACIÓN DE PROPIEDADES ACID
--  Archivo: 20252-PA-et0057-tia6-DML-equipo-6-07-scripts-consultas-acid.sql
-- ============================================================


-- ============================================================
-- =====================  INSERTS (3)  =========================
-- ============================================================

-- INSERT 1
-- ATOMICIDAD: Se inserta un solo registro; la operación es indivisible.
-- CONSISTENCIA: Se respetan FK y tipos correctos.
-- AISLAMIENTO: No afecta transacciones concurrentes.
-- DURABILIDAD: Una vez hecho COMMIT, el dato persiste.

BEGIN;

INSERT INTO paciente (primer_nombre, apellido, documento, fecha_nacimiento, telefono, sexo)
VALUES ('ACID1', 'Prueba', '999001', '1990-01-01', '3001001000', 'M');

COMMIT;


-- INSERT 2
-- ATOMICIDAD: Si falla, no se inserta nada.
-- CONSISTENCIA: Campos obligatorios están completos.
BEGIN;

INSERT INTO medico (nombre, primer_apellido, id_especialidad, registro_medico)
VALUES ('ACID_Medico', 'Prueba', 1, 'REG-ACID-01');

COMMIT;


-- INSERT 3
-- DURABILIDAD: tras commit, el registro es permanente.
BEGIN;

INSERT INTO hospital (nombre, nivel)
VALUES ('Hospital ACID', 'Nivel 1');

COMMIT;



-- ============================================================
-- =====================  UPDATES (3)  ========================
-- ============================================================

-- UPDATE 1
-- ATOMICIDAD: Cambia solo un campo.
-- CONSISTENCIA: No rompe reglas del modelo.
-- AISLAMIENTO: No interfiere con otras transacciones.

BEGIN;

UPDATE paciente
SET telefono = '3120001111'
WHERE id_paciente = 1;

COMMIT;


-- UPDATE 2
-- Cambia apellido del médico.
BEGIN;

UPDATE medico
SET primer_apellido = 'ACID_Modificado'
WHERE id_medico = 17;

COMMIT;


-- UPDATE 3
-- Modifica el nombre del hospital.
BEGIN;

UPDATE hospital
SET nombre = 'Hospital ACID Actualizado'
WHERE id_hospital = 1;

COMMIT;



-- ============================================================
-- =====================   DELETES (3)  =======================
-- ============================================================

-- DELETE 1
-- ATOMICIDAD: Elimina un registro o ninguno.
-- CONSISTENCIA: Solo elimina si no rompe integridad.
BEGIN;

DELETE FROM paciente
WHERE id_paciente = 100;   -- se asume sin FK dependientes

COMMIT;


-- DELETE 2
-- Delete de un enfermero.
BEGIN;

DELETE FROM enfermero
WHERE id_enfermero = 10;

COMMIT;


-- DELETE 3
-- Delete de hospital SIN registros dependientes.
BEGIN;

DELETE FROM hospital
WHERE id_hospital = 10;

COMMIT;



-- ============================================================
-- ================= EXPLICACIÓN GENERAL ACID =================
-- ============================================================

-- ATOMICIDAD:
--   Cada operación se ejecuta completamente o no se ejecuta.
--   Si falla un INSERT/UPDATE/DELETE dentro del bloque, se hace ROLLBACK.

-- CONSISTENCIA:
--   Todos los datos insertados, modificados o eliminados mantienen
--   las reglas de claves primarias, foráneas y tipos.

-- AISLAMIENTO:
--   Las transacciones se ejecutan separadas; los cambios no afectan
--   ni son visibles para otras hasta el COMMIT.

-- DURABILIDAD:
--   Después del COMMIT, los datos permanecen guardados incluso si el
--   sistema se cierra o falla.

