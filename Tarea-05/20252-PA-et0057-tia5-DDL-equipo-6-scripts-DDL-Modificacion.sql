-- ============================================================
-- DDL DE MODIFICACIÓN DE TABLAS - VERSION 2
-- ============================================================

-- 5.1 AGREGAR 5 ÍNDICES
CREATE INDEX idx_paciente_doc ON paciente(documento);
CREATE INDEX idx_ingreso_fecha ON ingreso_hospitalario(fecha_ingreso);
CREATE INDEX idx_medico_registro ON medico(registro_medico);
CREATE INDEX idx_cama_cod ON cama(codigo_cama);
CREATE INDEX idx_orden_fecha ON orden_medica(fecha_orden);

-- 5.2 AGREGAR 5 CAMPOS NUEVOS
ALTER TABLE paciente ADD COLUMN telefono VARCHAR(20);
ALTER TABLE medico ADD COLUMN correo VARCHAR(100);
ALTER TABLE habitacion ADD COLUMN capacidad INT;
ALTER TABLE signos_vitales ADD COLUMN saturacion INT;
ALTER TABLE procedimiento ADD COLUMN costo NUMERIC(10,2);

-- 5.3 AGREGAR 5 CHECKS
ALTER TABLE paciente ADD CONSTRAINT chk_doc CHECK (char_length(documento) >= 5);
ALTER TABLE signos_vitales ADD CONSTRAINT chk_temp CHECK (temperatura BETWEEN 30 AND 45);
ALTER TABLE habitacion ADD CONSTRAINT chk_piso CHECK (piso >= 0);
ALTER TABLE evolucion_medica ADD CONSTRAINT chk_fecha CHECK (fecha <= CURRENT_DATE);
ALTER TABLE procedimiento ADD CONSTRAINT chk_costo CHECK (costo >= 0);

-- 5.4 RENOMBRAR 5 CAMPOS
ALTER TABLE paciente RENAME COLUMN nombre TO primer_nombre;
ALTER TABLE medico RENAME COLUMN apellido TO primer_apellido;
ALTER TABLE cama RENAME COLUMN codigo_cama TO nro_cama;
ALTER TABLE habitacion RENAME COLUMN tipo TO tipo_habitacion;
ALTER TABLE orden_medica RENAME COLUMN fecha_orden TO fecha_generacion;