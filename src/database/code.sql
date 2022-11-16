create database gestion_cursos;

create table student(
  matricula varchar(20) primary key,
  nombre varchar(20) not null,
  apellido varchar(20) not null,
  num_tel char(10) not null,
  email varchar(50) not null
);

create table user(
       code int primary key auto_increment,
       username varchar(30) not null,
       passw char(12) not null,
       student varchar(20) references student(matricula)
);




