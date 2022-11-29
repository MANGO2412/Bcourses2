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
   from alumno_grupo where grupo=new.grupo;

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


insert into pago(monto,fecha,alumno,grupo) values(850,now(),1,1);


insert into pago(monto,fecha,alumno,grupo) values(850,now(),3,3);
insert into alumno_grupo(alumno,grupo) values(3,3);
insert into alumno_grupo(alumno,grupo) values(1,3);

drop trigger verifyIns;




DELIMITER $$
create PROCEDURE PagoPROCEDUR
E (
      IN idGrupo integer,
      IN idAlumno integer
)

begin
      Declare cantDisponible integer;
      Declare NombreCurso char (100);
      Declare msg varchar (255);
      Declare import integer;
      Declare cantDisponible2 integer;
      Declare existalumno integer;

Select disponibilidad into CantDisponible
from grupo where codigo=idGrupo;


select c.nombre into NombreCurso
from curso as c
where c.codigo=any(select g.codigo 
                  from grupo as g
                  inner join pago as p on p.grupo=g.codigo
                  where p.grupo=idGrupo);


select c.costo into import
from curso as c
where c.codigo=any(select g.codigo 
                  from grupo as g
                  inner join pago as p on p.grupo=g.codigo
                  where p.grupo=idGrupo); 

select alumno into existalumno 
   from alumno_grupo where grupo=idGrupo;

if(cantDisponible >30)
then
set msg=concat('No hay espacios suficiente para el curso', NombreCurso);
signal sqlstate '45000' set message_text =msg;
else
 if(existalumno=idAlumno)
   then
     set msg=concat('no puedes pagar all curso ', NombreCurso,'por ya esta inscrito');
     signal sqlstate '45000' set message_text =msg;
   else
   set CantDisponible2= cantDisponible+1;

    update grupo set disponibilidad= cantDisponible2 where
   codigo=idGrupo;

    insert into pago( alumno,grupo,monto) values(idAlumno,idGrupo, import);
    insert into alumno_grupo(alumno,grupo) values (idAlumno,idGrupo);
  end if;

end if;
end $$
DELIMITER;

delimiter
call  PagoPROCEDURE(1,1);


drop procedure PagoPROCEDURE;