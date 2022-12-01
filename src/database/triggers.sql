 delimiter $$
 create  trigger  verifyIns
 before insert on pago
 for each row 
 begin
   declare  msg varchar(255);
   declare  grup integer;
   declare  existalumno integer;
   declare  lugar integer;
   declare  fecha_in date; 
   declare  fecha_fn date;


   select disponibilidad into lugar 
   from grupo where codigo= new.grupo;

   select alumno into existalumno 
   from alumno_grupo where grupo=new.grupo and  alumno=new.alumno;

   select fecha_inicio into fecha_in 
   from grupo where  codigo=new.grupo;

     
   select fecha_fin into fecha_fn 
   from grupo where codigo=new.grupo;
    
    if(existalumno=new.alumno)
       then
          set msg =concat('ya esta inscrito al curso');
          signal sqlstate '45000' set  message_text=msg;
      else
        if(lugar > 30)
           then
              set msg =concat('ya no hay espacios');
              signal sqlstate '45000' set  message_text=msg;
           else
             if(new.fecha between fecha_in and fecha_fn)
              then
               set msg =concat('el curso cerrado');
               signal sqlstate '45000' set  message_text=msg;
              else
                set lugar= lugar+1;
                update grupo set disponibilidad=lugar where codigo=new.grupo;
              end if;
           end if;
    end if;
 end$$
delimiter;


drop trigger  verifyIns;



insert into pago(monto,fecha,alumno,grupo) values(850,now(),1,1);


insert into pago(monto,fecha,alumno,grupo) values(850,now(),3,3);
insert into alumno_grupo(alumno,grupo) values(3,3);
insert into alumno_grupo(alumno,grupo) values(1,3);

drop trigger verifyIns;


select 
from 






/* obtiene tiene todo los datos */
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

/* obtiene los datos  del curso */
DELIMITER $$
create PROCEDURE  cursoiInfo
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



delimiter
call  PagoPROCEDURE(1,1);

delimiter;
call infPago(1);

drop procedure PagoPROCEDURE;




---triger para no inserta email
 delimiter $$
 create  trigger  verifyEmail
 before insert on correo
 for each row 
 begin
       declare  msg varchar(255);
       declare  email varchar(64);



       select correo into email from cuenta where  correo=new.correo;

       if(email=0)
         then
           set msg ='ya existe el correo hay espacios';
            signal sqlstate '45000' set  message_text=msg;
       end if;

 end$$
delimiter;


drop trigger verifyEmail


