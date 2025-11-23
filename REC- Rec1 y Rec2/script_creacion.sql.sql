-- =========================================
--   CREACIÓN DE BASE DE DATOS
-- =========================================
CREATE DATABASE instituciones_educativas;
\c instituciones_educativas;

-- =========================================
--   TABLA PRINCIPAL
-- =========================================
CREATE TABLE programas_ies (
    id SERIAL PRIMARY KEY,

    codigo_institucion                INTEGER,
    ies_padre                         VARCHAR(200),
    institucion_ies                   VARCHAR(300),
    principal_seccional               VARCHAR(100),
    id_sector_ies                     INTEGER,
    sector_ies                        VARCHAR(200),
    ies_acreditada                    VARCHAR(10),
    id_caracter                       INTEGER,
    caracter_ies                      VARCHAR(200),

    codigo_departamento_ies           INTEGER,
    departamento_domicilio_ies        VARCHAR(200),
    codigo_municipio_ies              INTEGER,
    municipio_domicilio_ies           VARCHAR(200),

    codigo_snies_programa             INTEGER,
    programa_academico                VARCHAR(300),
    programa_acreditado               VARCHAR(10),

    id_nivel_academico                INTEGER,
    nivel_academico                   VARCHAR(200),

    id_nivel_formacion                INTEGER,
    nivel_formacion                   VARCHAR(200),

    id_metodologia                    INTEGER,
    metodologia                       VARCHAR(200),

    id_area_conocimiento              INTEGER,
    area_conocimiento                 VARCHAR(300),

    id_nucleo                         INTEGER,
    nucleo_basico_conocimiento        VARCHAR(300),

    id_cine_campo_amplio              INTEGER,
    desc_cine_campo_amplio            VARCHAR(300),

    id_cine_campo_especifico          INTEGER,
    desc_cine_campo_especifico        VARCHAR(300),

    id_cine_codigo_detallado          INTEGER,
    desc_cine_codigo_detallado        VARCHAR(300),

    codigo_departamento_programa      INTEGER,
    departamento_oferta_programa      VARCHAR(200),
    codigo_municipio_programa         INTEGER,
    municipio_oferta_programa         VARCHAR(200),

    id_sexo                           INTEGER,
    sexo                              VARCHAR(50),

    semestre                           VARCHAR(20),
    graduados                          INTEGER
);

-- =========================================
--   TABLAS NORMALIZADAS
-- =========================================

CREATE TABLE instituciones (
    id SERIAL PRIMARY KEY,
    codigo_institucion INTEGER UNIQUE,
    ies_padre VARCHAR(200),
    institucion_ies VARCHAR(300),
    principal_seccional VARCHAR(100),
    id_sector_ies INTEGER,
    sector_ies VARCHAR(200),
    ies_acreditada VARCHAR(10),
    id_caracter INTEGER,
    caracter_ies VARCHAR(200)
);

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    codigo_departamento INTEGER UNIQUE,
    nombre_departamento VARCHAR(200)
);

CREATE TABLE municipios (
    id SERIAL PRIMARY KEY,
    codigo_municipio INTEGER UNIQUE,
    nombre_municipio VARCHAR(200),
    codigo_departamento INTEGER
);

CREATE TABLE programas (
    codigo_snies_programa INTEGER PRIMARY KEY,
    programa_academico VARCHAR(300),
    programa_acreditado VARCHAR(10)
);

CREATE TABLE niveles_academicos (
    id_nivel_academico INTEGER PRIMARY KEY,
    nivel_academico VARCHAR(200)
);

CREATE TABLE niveles_formacion (
    id_nivel_formacion INTEGER PRIMARY KEY,
    nivel_formacion VARCHAR(200)
);

CREATE TABLE metodologias (
    id_metodologia INTEGER PRIMARY KEY,
    metodologia VARCHAR(200)
);

CREATE TABLE areas_conocimiento (
    id_area_conocimiento INTEGER PRIMARY KEY,
    area_conocimiento VARCHAR(300)
);

CREATE TABLE nucleos (
    id_nucleo INTEGER PRIMARY KEY,
    nucleo_basico_conocimiento VARCHAR(300)
);

CREATE TABLE cine_campo_amplio (
    id_cine_campo_amplio INTEGER PRIMARY KEY,
    desc_cine_campo_amplio VARCHAR(300)
);

CREATE TABLE cine_campo_especifico (
    id_cine_campo_especifico INTEGER PRIMARY KEY,
    desc_cine_campo_especifico VARCHAR(300)
);

CREATE TABLE cine_codigo_detallado (
    id_cine_codigo_detallado INTEGER PRIMARY KEY,
    desc_cine_codigo_detallado VARCHAR(300)
);

CREATE TABLE sexo (
    id_sexo INTEGER PRIMARY KEY,
    sexo VARCHAR(50)
);

CREATE TABLE graduados_semestre (
    id SERIAL PRIMARY KEY,
    codigo_snies_programa INTEGER,
    semestre VARCHAR(20),
    graduados INTEGER,
    id_sexo INTEGER
);

-- =========================================
--   LLAVES FORÁNEAS
-- =========================================

ALTER TABLE municipios
ADD CONSTRAINT fk_municipio_departamento
FOREIGN KEY (codigo_departamento)
REFERENCES departamentos (codigo_departamento);

ALTER TABLE graduados_semestre
ADD CONSTRAINT fk_graduados_programa
FOREIGN KEY (codigo_snies_programa)
REFERENCES programas (codigo_snies_programa);

ALTER TABLE graduados_semestre
ADD CONSTRAINT fk_graduados_sexo
FOREIGN KEY (id_sexo)
REFERENCES sexo (id_sexo);

