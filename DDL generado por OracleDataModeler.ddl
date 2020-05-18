-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-05-16 17:58:40 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativas (
    id_alternativa           INTEGER NOT NULL,
    descripcion              VARCHAR2(200 CHAR),
    valor_logico             CHAR(1),
    porcentaje_ptp           INTEGER,
    preguntas_id_pregunta    INTEGER NOT NULL,
    preguntas_test_id_test   INTEGER NOT NULL,
    respuestas_id_respuesta  INTEGER NOT NULL
);

CREATE TABLE alumnos (
    rut_alumno  VARCHAR2(20 CHAR) NOT NULL,
    nombre      VARCHAR2(50 CHAR),
    apellido    VARCHAR2(50 CHAR)
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( rut_alumno );

CREATE TABLE alumnos_cursos (
    cursos_id_curso     INTEGER NOT NULL,
    alumnos_rut_alumno  VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE alumnos_cursos ADD CONSTRAINT alumnos_cursos_pk PRIMARY KEY ( cursos_id_curso,
                                                                          alumnos_rut_alumno );

CREATE TABLE cursos (
    id_curso  INTEGER NOT NULL,
    nombre    VARCHAR2(100 CHAR)
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_curso );

CREATE TABLE cursos_test (
    cursos_id_curso  INTEGER NOT NULL,
    test_id_test     INTEGER NOT NULL
);

ALTER TABLE cursos_test ADD CONSTRAINT cursos_test_pk PRIMARY KEY ( cursos_id_curso,
                                                                    test_id_test );

CREATE TABLE notas (
    id_nota             INTEGER NOT NULL,
    calificacion        FLOAT(2),
    alumnos_rut_alumno  VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE notas ADD CONSTRAINT notas_pk PRIMARY KEY ( id_nota );

CREATE TABLE preguntas (
    id_pregunta       INTEGER NOT NULL,
    enunciado         VARCHAR2(200 CHAR),
    puntaje_asociado  FLOAT(3),
    test_id_test      INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta,
                                                                test_id_test );

CREATE TABLE respuestas (
    id_respuesta  INTEGER NOT NULL,
    test_id_test  INTEGER NOT NULL
);

ALTER TABLE respuestas ADD CONSTRAINT respuestas_pkv1 PRIMARY KEY ( id_respuesta );

CREATE TABLE test (
    id_test         INTEGER NOT NULL,
    nombre          VARCHAR2(50 CHAR),
    descripcion     VARCHAR2(200 CHAR),
    programa        VARCHAR2(200 CHAR),
    unidad          VARCHAR2(50 CHAR),
    autor           VARCHAR2(100 CHAR),
    fecha_creacion  DATE
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta,
                                                           preguntas_test_id_test )
        REFERENCES preguntas ( id_pregunta,
                               test_id_test );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_respuestas_fk FOREIGN KEY ( respuestas_id_respuesta )
        REFERENCES respuestas ( id_respuesta );

ALTER TABLE alumnos_cursos
    ADD CONSTRAINT alumnos_cursos_alumnos_fk FOREIGN KEY ( alumnos_rut_alumno )
        REFERENCES alumnos ( rut_alumno );

ALTER TABLE alumnos_cursos
    ADD CONSTRAINT alumnos_cursos_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso );

ALTER TABLE cursos_test
    ADD CONSTRAINT cursos_test_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso );

ALTER TABLE cursos_test
    ADD CONSTRAINT cursos_test_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE notas
    ADD CONSTRAINT notas_alumnos_fk FOREIGN KEY ( alumnos_rut_alumno )
        REFERENCES alumnos ( rut_alumno );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE respuestas
    ADD CONSTRAINT respuestas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
