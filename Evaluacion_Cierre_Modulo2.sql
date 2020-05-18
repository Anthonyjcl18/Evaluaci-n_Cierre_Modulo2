-- Creamos la tabla alumnos
CREATE TABLE alumnos (
    rut_alumno  VARCHAR2(20 CHAR) NOT NULL,
    nombre      VARCHAR2(50 CHAR),
    apellido    VARCHAR2(50 CHAR),
    CONSTRAINT alumnos_pk PRIMARY KEY ( rut_alumno )
);

-- Creamos la tabla cursos
CREATE TABLE cursos (
    id_curso  INTEGER NOT NULL,
    nombre    VARCHAR2(100 CHAR),
    CONSTRAINT cursos_pk PRIMARY KEY ( id_curso )
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

-- Creamos la tabla notas
CREATE TABLE notas (
    id_nota             INTEGER NOT NULL,
    calificacion        FLOAT(2),
    alumnos_rut_alumno  VARCHAR2(20 CHAR) NOT NULL,
    CONSTRAINT notas_pk PRIMARY KEY ( id_nota ),
    CONSTRAINT notas_alumnos_fk FOREIGN KEY ( alumnos_rut_alumno )
        REFERENCES alumnos ( rut_alumno )
);

-- Creamos la tabla alumnos_cursos
CREATE TABLE alumnos_cursos (
    cursos_id_curso     INTEGER NOT NULL,
    alumnos_rut_alumno  VARCHAR2(20 CHAR) NOT NULL,
    CONSTRAINT alumnos_cursos_pk PRIMARY KEY ( cursos_id_curso,alumnos_rut_alumno ),
    CONSTRAINT alumnos_cursos_alumnos_fk FOREIGN KEY ( alumnos_rut_alumno )
        REFERENCES alumnos ( rut_alumno ),
    CONSTRAINT alumnos_cursos_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso )
);

-- Creamos la tabla cursos_test
CREATE TABLE cursos_test (
    cursos_id_curso  INTEGER NOT NULL,
    test_id_test     INTEGER NOT NULL,
    CONSTRAINT cursos_test_pk PRIMARY KEY ( cursos_id_curso, test_id_test ),
    CONSTRAINT cursos_test_cursos_fk FOREIGN KEY ( cursos_id_curso )
        REFERENCES cursos ( id_curso ),
    CONSTRAINT cursos_test_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test )
);

-- Creamos la tabla preguntas
CREATE TABLE preguntas (
    id_pregunta       INTEGER NOT NULL,
    enunciado         VARCHAR2(200 CHAR),
    puntaje_asociado  FLOAT(3),
    test_id_test      INTEGER NOT NULL,
    CONSTRAINT preguntas_pk PRIMARY KEY ( id_pregunta,test_id_test ),
    CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test )
);

-- Creamos la tabla respuestas
CREATE TABLE respuestas (
    id_respuesta  INTEGER NOT NULL,
    test_id_test  INTEGER NOT NULL,
    CONSTRAINT respuestas_pkv1 PRIMARY KEY ( id_respuesta ),
    CONSTRAINT respuestas_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test )
);

-- Creamos la tabla alternativas

CREATE TABLE alternativas (
    id_alternativa           INTEGER NOT NULL,
    descripcion              VARCHAR2(200 CHAR),
    valor_logico             CHAR(1),
    porcentaje_ptp           INTEGER,
    preguntas_id_pregunta    INTEGER NOT NULL,
    preguntas_test_id_test   INTEGER NOT NULL,
    respuestas_id_respuesta  INTEGER NOT NULL,
    CONSTRAINT alternativas_pk PRIMARY KEY ( id_alternativa ),
    CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_id_pregunta, preguntas_test_id_test )
        REFERENCES preguntas ( id_pregunta, test_id_test ),
    CONSTRAINT alternativas_respuestas_fk FOREIGN KEY ( respuestas_id_respuesta )
        REFERENCES respuestas ( id_respuesta )    
);

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

--Insertamos datos a la tabla CURSOS

insert all
into CURSOS (ID_CURSO,NOMBRE) values ('1','SALA 0023')
into CURSOS (ID_CURSO,NOMBRE) values ('2','SALA 0024')
into CURSOS (ID_CURSO,NOMBRE) values ('3','SALA 0025')
select * from dual;

insert all
into CURSOS (ID_CURSO,NOMBRE) values ('4','SALA 0026')
into CURSOS (ID_CURSO,NOMBRE) values ('5','SALA 0027')
select * from dual;

--Insertamos datos a la tabla TEST

insert all
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('3','Evaluacion 3','Fundamentos de Desarrollo Web','JAVA FULL STACK','3','Awakers',to_date('03/04/20','DD/MM/RR'))
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('4','Evaluacion 4','Test psicosocial','JAVA FULL STACK','4','Servicio social',to_date('24/04/20','DD/MM/RR'))
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('1','Evaluacion 1','POO','JAVA FULL STACK','1','Awakers',to_date('28/02/20','DD/MM/RR'))
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('2','Evaluacion 2','BBDD','JAVA FULL STACK','2','Awakers',to_date('13/03/20','DD/MM/RR'))
select * from dual;

--Insertamos datos a la tabla CURSOS_TEST

insert all
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('1','1')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('1','2')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('1','3')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('1','4')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('2','1')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('2','2')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('2','3')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('3','1')
into CURSOS_TEST (CURSOS_ID_CURSO,TEST_ID_TEST) values ('3','2')
select * from dual;

--Insertamos datos a la tabla ALUMNOS_CURSOS

insert all
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-1')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-2')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-3')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-4')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-5')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-6')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-7')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-8')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-9')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-10')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-11')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('1','1-12')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-10')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-11')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-12')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-13')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-14')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-15')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-16')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-17')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-18')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-19')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('2','1-20')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-1')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-2')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-3')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-4')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-5')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-6')
into ALUMNOS_CURSOS (CURSOS_ID_CURSO,ALUMNOS_RUT_ALUMNO) values ('3','1-7')
select * from dual;

--Insertamos datos a la tabla PREGUNTAS

--Para el test n°1
insert all
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('1','¿Cuál es la descripción que crees que define mejor el concepto CLASE en la programación orientada a objetos?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('2','¿Qué elementos crees que definen a un OBJETO?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('3','¿Qué código de los siguientes tiene que ver con la HERENCIA?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('4','¿Qué significa INSTANCIAR una clase?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('5','En Java, ¿a qué nos estamos refiriendo si hablamos de SWING?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('6','¿Qué es ECLIPSE?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('7','¿Cuál de las siguientes propiedades presenta el paradigma POO?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('8','Un programa en JAVA tiene:','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('9','¿Qué es una EXCEPCIÓN?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('10','¿Qué significa SOBRECARGAR (overload) un método?','0,5','1')
select * from dual;

--Para el test n°2
insert all
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('11','¿Campo particular dentro del registro, que permite la identificación exclusiva y unívoca de cada registro?','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('12','La integridad en Base de datos hace referencia...','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('13','Una base de datos es...:','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('14','Garantizar la coherencia de los datos almacenados, en relación con la realidad en un objetivo de un SMBD','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('15','Un SGBD es...:','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('16','El comando Alter table se utiliza para crear una nueva tabla en la base de datos','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('17','Una entidad es toda cosa u objeto significativo (real ó imaginario) del cual se requiere conocer ó almacenar información.','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('18','Uno de los principales objetivos de un sistema manejador de Base de datos SGBD es...','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('19','Escriba una query que regrese el nombre y salario del profesor con el salario más alto.','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('20','Escriba un query que regrese todos los departamentos en la table (sin duplicados).','0,5','2')
select * from dual;

--Para el test n°4
insert all
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('21','¿Cómo te sientes hoy?','2','4')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('22','¿Consideras que estas capacitado para este curso?','2','4')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('23','¿Cúal es tu vision respecto al curso?','2','4')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('24','¿Cree que lograras terminar el curso?','1','4')
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

--Para las respuestas del test n°4
insert all
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('21','4')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('22','4')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('23','4')
into RESPUESTAS (ID_RESPUESTA,TEST_ID_TEST) values ('24','4')
select * from dual;

--Insertamos datos a la tabla ALTERNATIVAS

--Para las preguntas del test n°1
insert all
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('1','Es un concepto similar al de array','F','0','1','1','1')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('2','Es un tipo particular de variable','F','0','1','1','1')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('3','Es un modelo o plantilla a partir de la cual creamos objetos','V','100','1','1','1')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA)
values ('4','Es una categoria de datos ordenada secuencialmente','F','0','1','1','1')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('5','Su cardinalidad y su tipo','F','0','2','1','2')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('6','Sus atributos y sus métodos','V','100','2','1','2')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('7','La forma en que establece comunicación e intercambia mensajes','F','0','2','1','2')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('8','Su interfaz y los eventos asociados','F','0','2','1','2')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('9','public class Componente extends Producto','V','100','3','1','3')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('10','public class Componente inherit Producto','F','0','3','1','3')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('11','public class Componente implements Producto','F','0','3','1','3')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('12','public class Componente belong to Producto','F','0','3','1','3')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('13','Duplicar una clase','F','0','4','1','4')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('14','Eliminar una clase','F','0','4','1','4')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('15','Crear un objeto a partir de la clase','V','100','4','1','4')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('16','Conectar dos clases entre sí','F','0','4','1','4')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('17','Una función utilizada para intercambiar valores','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('18','Es el sobrenombre de la versión 1.3 del JDK','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('19','Un framework específico para Android','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('20','Una librería para construir interfaces gráficas','V','100','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('21','Una libreria de Java','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('22','Una versión de Java especial para servidores','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('23','Un IDE para desarrollar aplicaciones','V','100','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('24','Ninguna de las anteriores','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('25','Herencia','V','50','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('26','Polimorfismo','V','50','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('27','Ampliación de cupo automático','F','0','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('28','Reduccion de cupo automatico','F','0','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('29','Nada','F','0','8','1','8')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('30','Clases','V','50','8','1','8')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('31','Objetos','V','50','8','1','8')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('32','Todas las anteriores','F','0','8','1','8')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('33','Un error que lanza un método cuando algo va mal','V','100','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('34','Un objeto que no puede ser instanciado','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('35','Un bucle que no finaliza','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('36','Un tipo de evento muy utilizado al crear interfaces','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('37','Editarlo para modificar su comportamiento','F','0','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('38','Cambiarle el nombre dejándolo con la misma funcionalidad','F','0','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('39','Crear un método con el mismo nombre pero diferentes argumentos','V','100','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('40','Añadirle funcionalidades a un método','F','0','10','1','10')
select * from dual;

--Para las preguntas del test n°2
insert all
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('41','Primary Key','V','100','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('42','Clave foránea','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('43','Relación','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('44','Dato','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('45','La información almacenada en la base de datos esté libre de errores','V','100','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('46','Solo las personas autorizadas accedan a la información.','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('47','Los datos sean numericos','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('48','Las tablas tengan llaves primarias.','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('49','Representación simbólica (numérica, alfabética, algorítmica etc.) de un atributo o una característica de una entidad','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('50','Colección de datos y objetos estructurados e interrelacionados, sobre un tema o propósito específico.','V','100','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('51','Conjunto de programas para acceder a datos.','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('52','Aplicación utilizada para capturar información.','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('53','Verdadero','V','100','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('54','Falso','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('55','Todas las anteriores','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('56','Ninguna de las anteriores','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('57','Es una relación de datos relacionados interrelacionados y un conjunto de programas para acceder a dichos datos','V','100','15','2','15')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('58','Es aquel que permite tener acceso a los usuarios de datos organizados mediante el modelo de datos','F','0','15','2','15')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('59','Una serie Datos no relacionados que se pueden modificar','F','0','15','2','15')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('60','Es un programa de Software que no se puede modificar,ni eliminar.','F','0','15','2','15')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('61','Verdadero','F','0','16','2','16')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('62','Falso','V','100','16','2','16')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('63','Todas las anteriores','F','0','16','2','16')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('64','Ninguna de las anteriores','F','0','16','2','16')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('65','Verdadero','V','100','17','2','17')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('66','Falso','F','0','17','2','17')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('67','Todas las anteriores','F','0','17','2','17')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('68','Ninguna de las anteriores','F','0','17','2','17')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('69','Realizar la Representación simbólica (numérica, alfabética, algorítmica etc.) de un atributo o una característica de una entidad','F','0','18','2','18')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('70','Acceder a toda la información de la base de datos','F','0','18','2','18')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('71','Disponer de datos para ser compartidos por diferentes usuarios y aplicaciones','V','100','18','2','18')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('72','Generar redundancia de los datos','F','0','18','2','18')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('73','SELECT Professor_Name, MAX(Salary) FROM SALARIES;','V','100','19','2','19')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('74','SELECT Professor_Name, avg(Salary) FROM SALARIES;','F','0','19','2','19')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('75','SELECT Professor_Name, avg(Salary) FROM Department;','F','0','19','2','19')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('76','SELECT Professor_Name, MAX(Salary) FROM DEPARTMENTS;','F','0','19','2','19')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('77','Select department from salaries where salary=0;','F','0','20','2','20')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('78','SELECT DISTINCT Department FROM SALARIES;','V','100','20','2','20')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('79','SELECT all Department FROM SALARIES;','F','0','20','2','20')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('80','SELECT DISTINC Department FROM SALARIES;','F','0','20','2','20')
select * from dual;

--Para las preguntas del test n°4
insert all
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('81','Bien','V','50','21','4','21')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('82','Mal','V','50','21','4','21')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('83','Si','V','25','22','4','22')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('84','No','V','25','22','4','22')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('85','Por mucho','V','25','22','4','22')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('86','Por poco','V','25','22','4','22')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('87','Malo','F','0','23','4','23')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('88','Pesimo','F','0','23','4','23')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('89','Terrible','F','0','23','4','23')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('90','Catastrofico','F','0','23','4','23')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('91','Si','V','25','24','4','24')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('92','Obvio','V','25','24','4','24')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('93','Claro','V','25','24','4','24')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('94','Por supuesto','V','25','24','4','24')
select * from dual;

--Pregunta 1: Consulta para conocer el número de evaluaciones por curso.
select cursos_id_curso, count(test_id_test) as cantidad_evaluaciones
from cursos_test 
group by cursos_id_curso;

--Pregunta 2: Consulta para conocer los cursos sin evaluaciones.
select id_curso,nombre, count(id_curso) as curso_sin_evaluaciones 
from cursos
where id_curso not in (select cursos_id_curso
                       from cursos_test) group by id_curso, nombre;
                       
--Pregunta 3: Determinar las evaluaciones con deficiencia. Una evaluación es deficiente:

--Parte a: Si no tiene preguntas.
select id_test,descripcion, count(id_test) as evaluaciones_sin_preguntas
from test
where id_test not in (select test_id_test   
                      from preguntas) group by id_test, descripcion;

--Parte b: Si hay preguntas con 2 ó menos alternativas.

select id_test, count(id_test) as evaluaciones_deficientes
from test,alternativas
where test.id_test = alternativas.preguntas_test_id_test
group by preguntas_id_pregunta, id_test having count(id_alternativa)<=2;

--Parte c: Si todas las alternativas son correctas o si todas las alternativas son incorrectas.

select id_test
from test,alternativas
where test.id_test = alternativas.preguntas_test_id_test
group by valor_logico, id_test having count(DISTINCT valor_logico)=1;

select id_test
from test,alternativas
where test.id_test = alternativas.preguntas_test_id_test
group by valor_logico, id_test having count(DISTINCT valor_logico)=0;

--Pregunta 4: Consulta para determinar cuántos alumnos hay en cada curso.
select cursos_id_curso, count(alumnos_rut_alumno) as cantidad_alumnos
from alumnos_cursos
group by cursos_id_curso;                       
