-- ==========================================================
--   VISTA: vw_detalle_graduados
--   Descripción:
--   Esta vista consolida la información de instituciones,
--   programas, departamentos, municipios, sexo y graduados
--   por semestre, integrando múltiples tablas normalizadas
--   mediante más de 6 JOINs.
-- ==========================================================

CREATE OR REPLACE VIEW vw_detalle_graduados AS
SELECT DISTINCT
    i.institucion_ies AS institucion,
    p.programa_academico AS programa,
    d.nombre_departamento AS departamento,
    m.nombre_municipio AS municipio,
    s.sexo,
    gs.semestre,
    gs.graduados
FROM graduados_semestre gs
JOIN programas p ON gs.codigo_snies_programa = p.codigo_snies_programa
JOIN programas_ies pi ON p.codigo_snies_programa = pi.codigo_snies_programa
JOIN instituciones i ON pi.codigo_institucion = i.codigo_institucion
JOIN departamentos d ON pi.codigo_departamento_ies = d.codigo_departamento
JOIN municipios m ON pi.codigo_municipio_ies = m.codigo_municipio
JOIN sexo s ON gs.id_sexo = s.id_sexo;
