create database gestion_cursos;
drop database gestion_cursos;


--tabla alumno
create table alumno(
   matricula  int primary key auto_increment,
   nombre varchar(30) not null,
   apellidoP varchar(30) not null,
   apellidoM varchar(30) not null,
   foto varchar(100) not null,
   N_celular char(10) not null
);

--tabla maestro
create table maestro(
   codigo int  primary key auto_increment,
   nombre varchar(30) not null,
   apellidoP varchar(30) not null,
   apellidoM varchar(30) not null,
   foto varchar(100) not null,
   N_celular char(10) not null
);


--tabla cuenta
create table cuenta(
     codigo int primary key auto_increment,
     correo varchar(64) not null,
     contraseña varchar(20)  not null,
     maestro int,
     alumno int,
     foreign key(maestro) references maestro(codigo),
     foreign key(alumno)  references alumno(matricula) 
);
alter table  cuenta
modify column contraseña varchar(72) not null;

--tabla categoria
create table categoria(
    codigo varchar(2) primary key,
    nombre char(100) not null, 
    descripcion text(500) not null
);


--tabla cursos
create table curso(
    codigo varchar(2) primary key,
    nombre char(100) not null, 
    costo  decimal(4,2) not null, 
    imagen char(100) null, no_hrs integer, 
    descripcion text(500) not null, 
    categoria varchar(2), 
    constraint fk_curso foreign key(categoria) references
    categoria(codigo) on delete cascade on update cascade
);


create table temas(
   codigo integer primary key auto_increment, 
   titulo char(100) not null, descripcion text(500) not null,  
   curso varchar(2) not null,
   constraint fk_temas foreign key(curso) references 
   curso(codigo) on delete cascade on update cascade
);




