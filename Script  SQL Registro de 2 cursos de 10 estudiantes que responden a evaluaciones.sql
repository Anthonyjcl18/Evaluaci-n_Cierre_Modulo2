--Script  SQL  que  registre  al  menos  2  cursos  de  10  estudiantes  que  respondan  estas evaluaciones.

-- Creamos la tabla cursos
CREATE TABLE cursos (
    id_curso  INTEGER NOT NULL,
    nombre    VARCHAR2(100 CHAR),
    CONSTRAINT cursos_pk PRIMARY KEY ( id_curso )
);

-- Creamos la tabla alumnos
CREATE TABLE alumnos (
    rut_alumno  VARCHAR2(20 CHAR) NOT NULL,
    nombre      VARCHAR2(50 CHAR),
    apellido    VARCHAR2(50 CHAR),
    CONSTRAINT alumnos_pk PRIMARY KEY ( rut_alumno )
);

-- Creamos la tabla test
CREATE TABLE test (
    id_test         INTEGER NOT NULL,
    nombre          VARCHAR2(50 CHAR),
    descripcion     VARCHAR2(200 CHAR),
    programa        VARCHAR2(200 CHAR),
    unidad          VARCHAR2(50 CHAR),
    autor           VARCHAR2(100 CHAR),
    fecha_creacion  DATE,
    CONSTRAINT test_pk PRIMARY KEY ( id_test )
);

-- Creamos la tabla respuestas
CREATE TABLE respuestas (
    id_respuesta  INTEGER NOT NULL,
    test_id_test  INTEGER NOT NULL,
    CONSTRAINT respuestas_pkv1 PRIMARY KEY ( id_respuesta ),
    CONSTRAINT respuestas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test )
);

--Insertamos datos a la tabla CURSOS

insert all
into CURSOS (ID_CURSO,NOMBRE) values ('1','SALA 0023')
into CURSOS (ID_CURSO,NOMBRE) values ('2','SALA 0024')
select * from dual;

--Insertamos datos a la tabla ALUMNOS

insert all
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-1','Anthony','Campos')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-2','Isaac','Pizarro')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-3','Gabriel','Romero')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-4','Marcelo','Albornoz')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-5','Carla','Achury')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-6','Emanuel','Vergara')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-7','Juliet','Perez')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-8','Consuelo','Muñoz')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-9','Paula','Garcia')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-10','Andres','Becerra')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-11','Cristian','Jofre')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-12','Javiera','Dante')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-13','Pablo','Martinez')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-14','Patricio','Almeida')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-15','Alonso','Rodriguez')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-16','Rodrigo','Escalona')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-17','Constanza','Sepulveda')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-18','Diego','Ramirez')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-19','Carlos','Freitez')
into ALUMNOS (RUT_ALUMNO,NOMBRE,APELLIDO) values ('1-20','German','Alvarado')
select * from dual;

--Insertamos datos a la tabla TEST

insert all
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('1','Evaluacion 1','POO','JAVA FULL STACK','1','Awakers',to_date('28/02/20','DD/MM/RR'))
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('2','Evaluacion 2','BBDD','JAVA FULL STACK','2','Awakers',to_date('13/03/20','DD/MM/RR'))
select * from dual;

--Insertamos datos a la tabla RESPUESTAS

--Para las respuestas del test n°1
insert all
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('1','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('2','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('3','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('4','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('5','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('6','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('7','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('8','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('9','1')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('10','1')
select * from dual;

--Para las respuestas del test n°2
insert all
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('11','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('12','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('13','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('14','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('15','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('16','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('17','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('18','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('19','2')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('20','2')
select * from dual;



