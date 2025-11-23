🔹 8.1 – Top 10 instituciones con mayor número de graduados
SELECT 
    i.institucion_ies AS institucion,
    SUM(gs.graduados) AS total_graduados
FROM graduados_semestre gs
JOIN programas p ON gs.codigo_snies_programa = p.codigo_snies_programa
JOIN programas_ies pi ON p.codigo_snies_programa = pi.codigo_snies_programa
JOIN instituciones i ON pi.codigo_institucion = i.codigo_institucion
GROUP BY i.institucion_ies
ORDER BY total_graduados DESC
LIMIT 10;

🔹 8.2 – Top 10 programas con mayor número de graduados
SELECT 
    p.programa_academico AS programa,
    SUM(gs.graduados) AS total_graduados
FROM graduados_semestre gs
JOIN programas p ON gs.codigo_snies_programa = p.codigo_snies_programa
GROUP BY p.programa_academico
ORDER BY total_graduados DESC
LIMIT 10;

🔹 8.3 – Posición del Pascual Bravo según número de graduados                       ---------------------------
WITH ranking AS (
    SELECT 
        i.institucion_ies AS institucion,
        SUM(gs.graduados) AS total_graduados,
        RANK() OVER (ORDER BY SUM(gs.graduados) DESC) AS posicion
    FROM graduados_semestre gs
    JOIN programas_ies pi ON gs.codigo_snies_programa = pi.codigo_snies_programa
    JOIN instituciones i ON pi.codigo_institucion = i.codigo_institucion
    GROUP BY i.institucion_ies
)
SELECT *
FROM ranking
WHERE institucion ILIKE '%Pascual Bravo%';


🔹 8.4 – Top 10 programas con más graduados hombres
SELECT 
    p.programa_academico AS programa,
    SUM(gs.graduados) AS total_graduados_hombres
FROM graduados_semestre gs
JOIN programas p ON gs.codigo_snies_programa = p.codigo_snies_programa
JOIN sexo s ON gs.id_sexo = s.id_sexo
WHERE s.sexo ILIKE 'HOMBRE%'
GROUP BY p.programa_academico
ORDER BY total_graduados_hombres DESC
LIMIT 10;

🔹 8.5 – Top 10 programas con más graduados mujeres
SELECT 
    p.programa_academico AS programa,
    SUM(gs.graduados) AS total_graduados_mujeres
FROM graduados_semestre gs
JOIN programas p ON gs.codigo_snies_programa = p.codigo_snies_programa
JOIN sexo s ON gs.id_sexo = s.id_sexo
WHERE s.sexo ILIKE 'MUJER%'
GROUP BY p.programa_academico
ORDER BY total_graduados_mujeres DESC
LIMIT 10;

8.6 – Top 3 departamentos con mayor número de graduados
SELECT 
    d.nombre_departamento AS departamento,
    SUM(gs.graduados) AS total_graduados
FROM graduados_semestre gs
JOIN programas_ies pi ON gs.codigo_snies_programa = pi.codigo_snies_programa
JOIN departamentos d ON pi.codigo_departamento_ies = d.codigo_departamento
GROUP BY d.nombre_departamento
ORDER BY total_graduados DESC
LIMIT 3;

8.7 – Top 3 municipios con mayor número de graduados (incluye departamento)
SELECT 
    m.nombre_municipio AS municipio,
    d.nombre_departamento AS departamento,
    SUM(gs.graduados) AS total_graduados
FROM graduados_semestre gs
JOIN programas_ies pi ON gs.codigo_snies_programa = pi.codigo_snies_programa
JOIN municipios m ON pi.codigo_municipio_ies = m.codigo_municipio
JOIN departamentos d ON m.codigo_departamento = d.codigo_departamento
GROUP BY m.nombre_municipio, d.nombre_departamento
ORDER BY total_graduados DESC
LIMIT 3;

8.8 – Listado completo de instituciones ordenado alfabéticamente, con departamento, municipio y total graduados
SELECT 
    i.institucion_ies AS institucion,
    d.nombre_departamento AS departamento,
    m.nombre_municipio AS municipio,
    SUM(gs.graduados) AS total_graduados
FROM instituciones i
JOIN programas_ies pi ON i.codigo_institucion = pi.codigo_institucion
JOIN departamentos d ON pi.codigo_departamento_ies = d.codigo_departamento
JOIN municipios m ON pi.codigo_municipio_ies = m.codigo_municipio
JOIN graduados_semestre gs ON pi.codigo_snies_programa = gs.codigo_snies_programa
GROUP BY i.institucion_ies, d.nombre_departamento, m.nombre_municipio
ORDER BY institucion ASC;

🔹 8.9 – Listado completo de programas con institución, departamento, municipio y graduados
SELECT 
    p.programa_academico AS programa,
    i.institucion_ies AS institucion,
    d.nombre_departamento AS departamento,
    m.nombre_municipio AS municipio,
    SUM(gs.graduados) AS total_graduados
FROM programas p
JOIN programas_ies pi ON p.codigo_snies_programa = pi.codigo_snies_programa
JOIN instituciones i ON pi.codigo_institucion = i.codigo_institucion
JOIN departamentos d ON pi.codigo_departamento_ies = d.codigo_departamento
JOIN municipios m ON pi.codigo_municipio_ies = m.codigo_municipio
JOIN graduados_semestre gs ON p.codigo_snies_programa = gs.codigo_snies_programa
GROUP BY p.programa_academico, i.institucion_ies, d.nombre_departamento, m.nombre_municipio
ORDER BY programa ASC;

8.10 – Listado de graduados por Departamento, Municipio y total graduados (mayor a menor)
SELECT 
    d.nombre_departamento AS departamento,
    m.nombre_municipio AS municipio,
    SUM(gs.graduados) AS total_graduados
FROM graduados_semestre gs
JOIN programas_ies pi ON gs.codigo_snies_programa = pi.codigo_snies_programa
JOIN departamentos d ON pi.codigo_departamento_ies = d.codigo_departamento
JOIN municipios m ON pi.codigo_municipio_ies = m.codigo_municipio
GROUP BY d.nombre_departamento, m.nombre_municipio
ORDER BY total_graduados DESC;