--Script SQL que registre al menos 2 evaluaciones, con 10 preguntas y 4 alternativas.

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

--Insertamos datos a la tabla TEST

insert all
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('1','Evaluacion 1','POO','JAVA FULL STACK','1','Awakers',to_date('28/02/20','DD/MM/RR'))
into TEST (ID_TEST,NOMBRE,DESCRIPCION,PROGRAMA,UNIDAD,AUTOR,FECHA_CREACION) values ('2','Evaluacion 2','BBDD','JAVA FULL STACK','2','Awakers',to_date('13/03/20','DD/MM/RR'))
select * from dual;

--Insertamos datos a la tabla PREGUNTAS

--Para el test n�1
insert all
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('1','�Cu�l es la descripci�n que crees que define mejor el concepto CLASE en la programaci�n orientada a objetos?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('2','�Qu� elementos crees que definen a un OBJETO?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('3','�Qu� c�digo de los siguientes tiene que ver con la HERENCIA?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('4','�Qu� significa INSTANCIAR una clase?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('5','En Java, �a qu� nos estamos refiriendo si hablamos de SWING?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('6','�Qu� es ECLIPSE?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('7','�Cu�l de las siguientes propiedades presenta el paradigma POO?','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('8','Un programa en JAVA tiene:','1','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('9','�Qu� es una EXCEPCI�N?','0,5','1')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('10','�Qu� significa SOBRECARGAR (overload) un m�todo?','0,5','1')
select * from dual;

--Para el test n�2
insert all
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('11','�Campo particular dentro del registro, que permite la identificaci�n exclusiva y un�voca de cada registro?','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('12','La integridad en Base de datos hace referencia...','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('13','Una base de datos es...:','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('14','Garantizar la coherencia de los datos almacenados, en relaci�n con la realidad en un objetivo de un SMBD','1','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('15','Un SGBD es...:','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('16','El comando Alter table se utiliza para crear una nueva tabla en la base de datos','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('17','Una entidad es toda cosa u objeto significativo (real � imaginario) del cual se requiere conocer � almacenar informaci�n.','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('18','Uno de los principales objetivos de un sistema manejador de Base de datos SGBD es...','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('19','Escriba una query que regrese el nombre y salario del profesor con el salario m�s alto.','0,5','2')
into PREGUNTAS (ID_PREGUNTA,ENUNCIADO,PUNTAJE_ASOCIADO,TEST_ID_TEST) values ('20','Escriba un query que regrese todos los departamentos en la table (sin duplicados).','0,5','2')
select * from dual;

--Insertamos datos a la tabla ALTERNATIVAS

--Para las preguntas del test n�1
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
values ('6','Sus atributos y sus m�todos','V','100','2','1','2')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('7','La forma en que establece comunicaci�n e intercambia mensajes','F','0','2','1','2')
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
values ('16','Conectar dos clases entre s�','F','0','4','1','4')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('17','Una funci�n utilizada para intercambiar valores','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('18','Es el sobrenombre de la versi�n 1.3 del JDK','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('19','Un framework espec�fico para Android','F','0','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('20','Una librer�a para construir interfaces gr�ficas','V','100','5','1','5')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('21','Una libreria de Java','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('22','Una versi�n de Java especial para servidores','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('23','Un IDE para desarrollar aplicaciones','V','100','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('24','Ninguna de las anteriores','F','0','6','1','6')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('25','Herencia','V','50','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('26','Polimorfismo','V','50','7','1','7')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('27','Ampliaci�n de cupo autom�tico','F','0','7','1','7')
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
values ('33','Un error que lanza un m�todo cuando algo va mal','V','100','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('34','Un objeto que no puede ser instanciado','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('35','Un bucle que no finaliza','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('36','Un tipo de evento muy utilizado al crear interfaces','F','0','9','1','9')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('37','Editarlo para modificar su comportamiento','F','0','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('38','Cambiarle el nombre dej�ndolo con la misma funcionalidad','F','0','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('39','Crear un m�todo con el mismo nombre pero diferentes argumentos','V','100','10','1','10')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('40','A�adirle funcionalidades a un m�todo','F','0','10','1','10')
select * from dual;

--Para las preguntas del test n�2
insert all
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('41','Primary Key','V','100','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('42','Clave for�nea','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('43','Relaci�n','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('44','Dato','F','0','11','2','11')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('45','La informaci�n almacenada en la base de datos est� libre de errores','V','100','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('46','Solo las personas autorizadas accedan a la informaci�n.','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('47','Los datos sean numericos','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('48','Las tablas tengan llaves primarias.','F','0','12','2','12')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('49','Representaci�n simb�lica (num�rica, alfab�tica, algor�tmica etc.) de un atributo o una caracter�stica de una entidad','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('50','Colecci�n de datos y objetos estructurados e interrelacionados, sobre un tema o prop�sito espec�fico.','V','100','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('51','Conjunto de programas para acceder a datos.','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('52','Aplicaci�n utilizada para capturar informaci�n.','F','0','13','2','13')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('53','Verdadero','V','100','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('54','Falso','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('55','Todas las anteriores','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('56','Ninguna de las anteriores','F','0','14','2','14')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('57','Es una relaci�n de datos relacionados interrelacionados y un conjunto de programas para acceder a dichos datos','V','100','15','2','15')
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
values ('69','Realizar la Representaci�n simb�lica (num�rica, alfab�tica, algor�tmica etc.) de un atributo o una caracter�stica de una entidad','F','0','18','2','18')
into ALTERNATIVAS(ID_ALTERNATIVA,DESCRIPCION,VALOR_LOGICO,PORCENTAJE_PTP,PREGUNTAS_ID_PREGUNTA,PREGUNTAS_TEST_ID_TEST,RESPUESTAS_ID_RESPUESTA) 
values ('70','Acceder a toda la informaci�n de la base de datos','F','0','18','2','18')
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
