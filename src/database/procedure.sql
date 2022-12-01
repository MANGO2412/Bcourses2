--proceso almacenado 1
/*
1)mostrar informacion del curso con el id del curso
  nombre del curso
  id del curso y del grupo
  categoria del curso
  nombre del maestro
  precio del curso
  fecha de inicio y cierre del curso
  numero de horas
  descripcion
*/
delimiter$$
create procedure InfoCurso(
      in idcurso int
     )

begin

   
select 
   c.codigo as codigo_curso, c.nombre as nombre_curso,c.imagen as imagen_c, cat.nombre as categoria, c.no_hrs as duracion, c.descripcion as descripcion,c.imagen as foto_curso, g.codigo as  grupo, g.fecha_inicio as fechaIn, g.fecha_fin as fechaFn, g.disponibilidad as No_Estudiantes,
   c.costo as costo,concat(m.ApellidoM,' ',m.ApellidoP,' ',m.nombre) as maestro, m.foto as foto
from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where c.codigo=idcurso;

end $$

delimiter;



--proceso almacenado 2
DELIMITER $$
create PROCEDURE  infPago
 (
      IN idAlumno integer
)
begin
   select 
    c.nombre as curso,p.monto as pago,p.fecha as fecha
   from pago as p 
   inner join grupo as grup on p.grupo=grup.codigo
   inner join curso as c on grup.curso=c.codigo
  where p.alumno=idAlumno;      
end $$
DELIMITER;


--proceso almacenado 3
DELIMITER $$
create PROCEDURE  infogrupos
 (
      IN idAlumno integer
)
begin
  
    select 
      c.codigo as id,c.nombre as curso, c.descripcion as descripcion,
      concat(m.ApellidoP,m.ApellidoM,m.nombre) as maestro,
      m.foto as foto
    from alumno_grupo as lg
    inner join grupo as g on lg.grupo = g.codigo
    inner join curso as c on g.curso=c.codigo
    inner join maestro as m on g.maestro =m.codigo
    where  lg.alumno = idAlumno;
      
end $$
DELIMITER;


--procedure 4
 DELIMITER $$
create PROCEDURE InfoCursosMaster(
      IN idMaestro integer
     )

begin

select g.codigo as codigo_curso, c.nombre as Nombre_Curso, cat.nombre as Categoria, c.no_hrs as Duracion, c.descripcion as Descripcion
, g.nombre as Grupo, g.fecha_inicio as fechaIn, g.fecha_fin as fechaFn, g.disponibilidad as No_Estudiantes,m.foto as foto
 from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where m.codigo=idMaestro;


end $$
DELIMITER; 
drop procedure InfoCursosMaster;