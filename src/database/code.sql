create database gestion_cursos;
drop database gestion_cursos;

create table alumno(
   matricula  int primary key auto_increment,
   nombre varchar(30) not null,
   apellidoP varchar(30) not null,
   apellidoM varchar(30) not null,
   foto varchar(100) not null,
   N_celular char(10) not null,
   correo varchar(64) not null
);

create table maestro(
   codigo int  primary key auto_increment,
   nombre varchar(30) not null,
   apellidoP varchar(30) not null,
   apellidoM varchar(30) not null,
   foto varchar(100) not null,
   N_celular char(10) not null,
   correo varchar(64) not null
);


create table cuenta(
     codigo int primary key auto_increment,
     usuario varchar(20) not null,
     contraseña varchar(20)  not null,
     maestro int,
     alumno int,
     foreign key(maestro) references maestro(codigo),
     foreign key(alumno)  references alumno(matricula) 
);


insert into alumno(nombre,apellidoP,apellidoM,foto,N_celular,correo) values('manuel','gomez','perez',' ','6641644270','manuelgom3z22052003@gmail.com');
insert into cuenta(usuario,contraseña,alumno) values('mango','lalalslsl',1);



