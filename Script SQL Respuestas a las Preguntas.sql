--Script SQL que responda las preguntas enumeradas.

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
