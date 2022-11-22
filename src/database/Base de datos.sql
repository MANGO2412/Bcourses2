create database CursosOnline;

create table maestro(codigo integer auto_increment primary key,
nombre char(25) not null, ApellidoP char(20) not null,
ApellidoM char(20) null, foto char(100) null, 
n_celular char(10) not null, correo char(64) not null);

create table alumno(matricula integer primary key auto_increment,
nombre char(25) not null, ApellidoP char(20) not null, 
ApellidoM char(20) null, foto char(100) null,
n_celular char(10) not null, correo char(64) not null);

create table categoria(
    codigo varchar(2) primary key,
    nombre char(100) not null, 
    descripcion text(500) not null
);

create table curso(
    codigo varchar(2),
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
   curso integer not null,
   constraint fk_temas foreign key(curso) references 
   curso(codigo) on delete cascade on update cascade
);




create table cuenta(codigo integer primary key auto_increment, 
usuario char(20) not null, contraseña char(20) not null, 
fecha_creacion date not null, maestro integer null,alumno integer null,
constraint fk_cuenta1 foreign key(maestro) references 
maestro(codigo)on delete cascade on update cascade,
constraint fk_cuenta2 foreign key(alumno) references 
alumno(matricula)on delete cascade on update cascade);

create table grupo( codigo integer primary key auto_increment,
nombre char(15) not null, horario time not null, 
fecha_inicio date not null, maestro integer not null, 
curso integer not null,
constraint fk_grupo_maestro foreign key(maestro) references 
maestro(codigo)on delete cascade on update cascade,
constraint fk_grupo_curso foreign key(curso) references 
curso(codigo)on delete cascade on update cascade);

create table pago(codigo integer primary key auto_increment,
monto decimal(4,2) not null, fecha date not null, 
alumno integer not null, grupo integer not null,
constraint fk_pago_alumno foreign key(alumno) references 
alumno(matricula)on delete cascade on update cascade,
constraint fk_pago_grupo foreign key(grupo) references 
grupo(codigo)on delete cascade on update cascade);

create table alumno_grupo( codigo integer primary key auto_increment,
alumno integer not null, grupo integer not null,
constraint fk_alumnogrupo_alumno foreign key(alumno) references 
alumno(matricula)on delete cascade on update cascade,
constraint fk_alumnogrupo_grupo foreign key(grupo) references 
grupo(codigo)on delete cascade on update cascade);

create table certificado(codigo integer primary key auto_increment,
fecha_emision date not null, promedio decimal(2,2) not null, 
curso integer not null, alumno integer not null,
constraint fk_certificado_alumno foreign key(alumno) references 
alumno(matricula)on delete cascade on update cascade,
constraint fk_certificado_curso foreign key(curso) references 
curso(codigo)on delete cascade on update cascade);

create table calificacion(codigo integer primary key auto_increment,
calificacion integer not null, fecha date not null, alumno integer not null,
grupo integer not null, tema integer not null,
constraint fk_calificacion_alumno foreign key(alumno) references 
alumno(matricula)on delete cascade on update cascade,
constraint fk_calificacion_grupo foreign key(grupo) references 
grupo(codigo)on delete cascade on update cascade,
constraint fk_calificacion_tema foreign key(tema) references 
temas(codigo)on delete cascade on update cascade);

