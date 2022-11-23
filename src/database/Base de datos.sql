create database CursosOnline;
drop database CursosOnline;


--tabla de maestro
create table maestro(
    codigo integer auto_increment primary key,
    nombre char(25) not null, 
    ApellidoP char(20) not null,
    ApellidoM char(20) null, 
    foto char(100) null, 
    n_celular char(10) not null
);


--tabla de alumno
create table alumno(
 matricula integer primary key auto_increment,
 nombre char(25) not null, 
 ApellidoP char(20) not null, 
 ApellidoM char(20) null, 
 foto char(100) null,
 n_celular char(10) not null
 );


--tabla de categoria
create table categoria(
    codigo integer primary key auto_increment,
    nombre char(100) not null, 
    descripcion text(500) not null
);


--tabla de curso
create table curso(
    codigo integer primary key auto_increment,
    nombre char(100) not null, 
    costo  decimal(4,2) not null, 
    imagen char(100) null, no_hrs integer, 
    descripcion text(500) not null, 
    categoria integer, 
    constraint fk_curso foreign key(categoria) references
    categoria(codigo) on delete cascade on update cascade
);



--tabla de temas
create table temas(
   codigo integer primary key auto_increment, 
   titulo char(100) not null, descripcion text(500) not null,  
   curso integer not null,
   constraint fk_temas foreign key(curso) references 
   curso(codigo) on delete cascade on update cascade
);




--tabla de cuentas
create table cuenta(
    codigo integer primary key auto_increment, 
    correo char(64) not null,
    contraseña char(20) not null, 
    fecha_creacion date not null,
    maestro integer null,alumno integer null,
    constraint fk_cuenta1 foreign key(maestro) references 
    maestro(codigo)on delete cascade on update cascade,
    constraint fk_cuenta2 foreign key(alumno) references 
    alumno(matricula)on delete cascade on update cascade
);



--table de grupo
create table grupo( 
    codigo integer primary key auto_increment,
    nombre char(15) not null, horario time not null, 
    fecha_inicio date not null, maestro integer not null, 
    curso integer not null,
    constraint fk_grupo_maestro foreign key(maestro) references 
    maestro(codigo)on delete cascade on update cascade,
    constraint fk_grupo_curso foreign key(curso) references 
    curso(codigo)on delete cascade on update cascade
);


--tabla 
create table pago(
  codigo integer primary key auto_increment,
  monto decimal(4,2) not null, fecha date not null, 
  alumno integer not null, grupo integer not null,
  constraint fk_pago_alumno foreign key(alumno) references 
  alumno(matricula)on delete cascade on update cascade,
  constraint fk_pago_grupo foreign key(grupo) references 
  grupo(codigo)on delete cascade on update cascade
);


--tabla de alumno grupo
create table alumno_grupo( 
    codigo integer primary key auto_increment,
    alumno integer not null, 
    grupo integer not null,
    constraint fk_alumnogrupo_alumno foreign key(alumno) references 
    alumno(matricula)on delete cascade on update cascade,
    constraint fk_alumnogrupo_grupo foreign key(grupo) references 
    grupo(codigo)on delete cascade on update cascade
);

--tabla de certificado
create table certificado(
    codigo integer primary key auto_increment,
    fecha_emision date not null, 
    promedio decimal(2,2) not null, 
    curso integer not null, 
    alumno integer not null,
    constraint fk_certificado_alumno foreign key(alumno) references 
    alumno(matricula)on delete cascade on update cascade,
    constraint fk_certificado_curso foreign key(curso) references 
    curso(codigo)on delete cascade on update cascade
);


--tabla de calificacion
create table calificacion(
    codigo integer primary key auto_increment,
    calificacion integer not null, 
    fecha date not null, 
    alumno integer not null,
    grupo integer not null, 
    tema integer not null,
    constraint fk_calificacion_alumno foreign key(alumno) references 
    alumno(matricula)on delete cascade on update cascade,
    constraint fk_calificacion_grupo foreign key(grupo) references 
    grupo(codigo)on delete cascade on update cascade,
    constraint fk_calificacion_tema foreign key(tema) references 
    temas(codigo)on delete cascade on update cascade
);




--inserts de los datos
insert into maestro(nombre,ApellidoP,ApellidoM,foto,n_celular) values
('Manuel De Jesus','Gomez','','',6631734688),
('Gael','Breton','Breton','',6641138711),
('Cristian','Novoa','Pizano','',6657762617),
('Luis','Lopez','Dominguez','',6641132862),
('Carlos','Hernandez','Guzman','',6657066347);

select * from maestro;


--inserts del alumno
insert into alumno(nombre,ApellidoP,ApellidoM,foto,n_celular) values
('Hugo','Rodriguez','Muñoz','','6659900207'),
('Martin','Gonzalez','Blanco','','6658738337'),
('Lucas','Fernandez','Gil','','6655696227'),
('Mateo','Lopez','Aguirre','','6658277062'),
('Leo','Martinez','Diez','','6633316390'),
('Daniel','Sanchez','Salazar','','6644550911'),
('Alejandro','Perez','Ramos','','6652327129'),
('Pablo','Gomez','Ortiz','','6654725386'),
('Manuel Martin','Dominguez','','','6639666507');



insert into alumno(nombre,ApellidoP,ApellidoM,foto,n_celular) values
('Alvaro','Jimenez','Ramirez','','6648933390');

insert into alumno(nombre,ApellidoP,ApellidoM,foto,n_celular) values
('Adrian','Hernandez','Romero','','6639385408'),
('David','Ruiz','Ibañez','','6638142512'),
('Mario','Diaz','Saez','','6659856689'),
('Enzo','Moreno','Santos','','6636825266'),
('Diego','Muñoz','Delgado','','6647102981'),
('Marcos','Alvarez','Ortega','','6652673273'),
('Izan','Romero','Uriarte','','6639394758'),
('Javier','Gutierrez','Sanz','','6635862986'),
('Bruno Alonso','Santamaria','','','6643552568'),
('Oliver','Hernandez','Garcia','','6646928422'),
('Miguel','Cortes','Gonzalez','','6635450746'),
('Thiago','Moreno','Sanchez','','6637125424'),
('Antonio','Jimenez','Rodriguez','','6651064697'),
('Marcos','Torres','Fernandez','','6637282391'),
('Carlos','Navarro','Gomez','','6639029791'),
('Angel	Santiago','Lopez','','','6632523953'),
('Juan','Muñoz','Perez','','6637087145'),
('Gonzalo','Diaz','Diaz','','6651926963'),
('Gael','Morales','Moreno','','6646980046'),
('Sergio','Molina','Martinez','','6651122261'),
('Nicolas Alonso','Martin','','','6642334485'),
('Jorge','Parra','Romero','','6646091020'),
('Jose','Vargas','Hernandez','','6632808271'),
('Adam','Ramos','Muñoz','','6657921077'),
('Liam','Segura','Alvarez','','6646325385'),
('Eric','Gutierrez','Jimenez','','6646086530'),
('Samuel','Maldonado','Ruiz','','6647525758'),
('Daio','Ortega','Dominguez','','6636892947'),
('Hector','Romero','Vazquez','','6654655325'),
('Lucas','Castillo','Ramos','','6655090917'),
('Iker','Gimenez','Guerrero','','6636997249'),
('Amir','Cruz','Gutierrez','','6642302244'),
('Rodrigo','Rubio','Duran','','6638602376'),
('Saul','Fuentes','Gallardo','','6638825980'),
('Victor','Alvarez','Delgado','','6656515496'),
('Francisco','Ortiz','Nuñez','','6653595534'),
('Ivan','Montoya','Marquez','','6656913708'),
('Jesus','Villegas','Gil','','6638543512'),
('Aron','Amador','Blanco','','6643574130'),
('Ruben Marin','Flores','','','6633397486'),
('Ian','Flores','Gallego','','6643870481'),
('Gullermo','Cano','Lozano','','6632977780'),
('Erik','Carmona','Ortiz','','6643061482'),
('Mohamed','Ramirez','Benitez','','6649397456'),
('Julan','Manzano','Cortes','','6656978773'),
('Luis','Soler','Caballero','','6654175010'),
('Paul','Salmeron','Alvarez','','6632348033'),
('Unal','Heredia','Mas','','6634161926'),
('Rafael','serrano','Ribas','','6639884193'),
('Joel','serrano','Navarro','','6631360057'),
('Alberto','ruiz','Rossello','','6651990118'),
('Erik','herrera','ruiz','','6646157929'),
('Mohamed','herraez','Cortes','','6649357861'),
('Jlian','delgado','Tur','','6643250388'),
('Luis','GALLEGO','Sastre','','6631022574'),
('Pau','HERRANZ','Perello','','6652522639'),
('Alberto','ARROYO','Amengual','','6637451376');

/*
('Pedro',vazquez	Roig		6652477557
('Raul	PRIETO	Ramis		6641062963
('Nil	NUÑEZ	Ramirez		6633364265
('Noah	RAMOS	Cardona		6636168464
('Jan	PASCUAL	Bauza		6645026314
('Asier	VELAYOS	Sastre		6649700042
('Fernand	ESTEBAN	Perello		6651629415
('Alonso	PINDADO	Rodriguez		6654250930
('Maias	CALVO	Gonzalez		6648851511
('Biel	VAQUERO	Fernandez		6638889121
('Andres	IZQUIERDO	Lopez		6652822085
('Fernanda	MENDEZ	Martinez		6637926592
('Ismael 	YUSTE	Sanchez		6657082961
('Axel	MENDOZA	Perez		6659326986
('Ismael 	Cano	Gomez		6653109426
('Martin	Cuenca	Martin		6646716849
('Arnau	Ortiz	Jimenez		6633478402
('Imran	Torres	Hernandez		6648029024
('Mauro	Gil	Ruiz		6633599443
('Oscar	Corcoles	Diaz		6632651531
('Cristian	Garrido	Moreno		6633034730
('Leonardo	Rodenas	Muñoz		6641581213
('Abel	Cebrian	Alvarez		6636825800
('Adrián	Nuñez	Romero		6633488695
('Alejandro	Calero	Gutierrez		6645917645
('Ángel	Marin	Alonso		6632789638
('Carlos	Tebar	Hernandez		6656724854
('César	Moya'	Cortes		6659787024),
('Bruno','Ramirez','Moreno','','6638119884'),
('Daniel','Requena','Jimenez','','6651700182'),
('Darío	Alarcon','Torres','','','6643640110');
*/




select * from maestro; 
select * from alumno;



--insert en la tabla cuenta
insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values
('M8Manuel@outlook.com','H9Gomez','2020-5-10',1,null);

insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values
('L9Gael@outlook.com','M8Breton','2020-2-28',2,null),
('M5Cristian@hotmail.con','L9Pizano','2020-1-25',3,null),
('L8Luis@outlook.com','M5Dominguez','2020-5-9',4,null),
('D7Carlos@hotmail.con','L8Guzman','2020-2-19',5,null),
('D4Hugo@hotmail.con','D7Muñoz','2020-3-1',null,1),
('M4Martin@hotmail.con','A5Blanco','2020-5-28',null	,2),
('E6Lucas@outlook.com','P5Gil','2020-2-3',null,3),
('D5Mateo@outlook.com','M6Aguirre','2020-2-14',null,4),
('M7Leo@gmail.com','A7Diez','2020-5-24',null,5),
('I6Daniel@gmail.com','A9Salazar','2020-5-19',null,6),
('J9Alejandro@gmail.com','D4Ramos','2020-6-23',null,7),
('B6Pablo@outlook.com','M4Ortiz','2020-3-21',null,8),
('O9Manuel@hotmail.con','E6Dominguez','2020-5-18',null,9),
('M6Alvaro@gmail.com',  'D5Ramirez','2020-2-25',null,10),
('T6Adrian@outlook.com', 'M7Romero','2020-6-29',null,11),
('A7David@hotmail.con', 'I6Ibañez','2020-2-12',	null,12),
('M6Mario@outlook.com','J9Saez','2020-2-4',null,13),
('C7Enzo@outlook.com', 'B6Santos','2020-3-20',null,14),
('A8Diego@outlook.com', 'O9Delgado','2020-2-11',null,15),
('J5Marcos@gmail.com', 'M6Ortega','2020-5-25',null,16),
('G4Izan@gmail.com','T6Uriarte','2020-4-10',null,17),
('G7Javier@outlook.com','A7Sanz','2020-5-25',null,18),
('S6Brunoo@hotmail.con','M6Santamaria','2020-4-3',null,19),
('N6Oliver@hotmail.con','C7Garcia','2020-5-29',null,20),
('J5Miguel@gmail.com','A8Gonzalez','2020-1-2',null,21),
('J6Thiago@hotmail.con','J5Sanchez','2020-6-29',null,22),
('A5Antonio@outlook.com','G4Rodriguez','2020-4-13',null,23),
('L6Marcos@outlook.com','G7Fernandez','2020-1-18',null,24),
('E9Carlos@outlook.com','S6Gomez','2020-6-29',null,25),
('S9Angel@outlook.com','N6Lopez','2020-1-22',null,26),
('D6Juan@gmail.com','J5Perez','2020-4-27',null,27),
('H6Gonzalo@outlook.com','J6Diaz','2020-2-6',null,28),
('L8Gael@outlook.com','A5Moreno','2020-4-17',null,29),
('I7Sergio@gmail.com','L6Martinez','2020-1-8',null,30),
('A4Nicolas@gmail.com','E9Martin','2020-1-20',null,31),
('R5Jorge@outlook.com','S9Romero','2020-3-11',null,32),
('S7Jose@gmail.com','D6Hernandez','2020-5-20',null,33),
('V7Adam@gmail.com','H6Muñoz','2020-3-4',null,34),
('F5Liam@hotmail.con','L8Alvarez','2020-4-24',null,35),
('I7Eric@gmail.com','I7Jimenez','2020-6-12',null,36),
('J8Samuel@hotmail.con','A4Ruiz','2020-6-13',null,37),
('A6Daio@outlook.com','R5Dominguez','2020-6-15',null,38),
('R5Hector@outlook.com','S7Vazquez','2020-6-2',null,39),
('I6Lucas@outlook.com','V7Ramos','2020-1-16',null,40),
('G4Iker@gmail.com','F5Guerrero','2020-6-19',null,41),
('E7Amir@hotmail.con','I7Gutierrez','2020-1-20',null,42),
('M7Rodrigo@outlook.com','J8Duran','2020-2-5',null,43),
('J7Saul@outlook.com','A6Gallardo',	'2020-2-11',null,44),
('L5Victor@gmail.com','R5Delgado','2020-5-15',null,45),
('P8Francisco@gmail.com','I6Nuñez','2020-1-30',null,46),
('U7Ivan@hotmail.con','G4Marquez','2020-3-18',null,47),
('R7Jesus@gmail.com','E7Gil','2020-5-12',null,48),
('J11Aron@outlook.com','M7Blanco','2020-3-6',null,49),
('A4Ruben@gmail.com','J7Flores','2020-3-24',null,50),
('E7Ian@outlook.com','L5Gallego','2020-2-17',null,51),
('M7Gullermo@gmail.com','P8Lozano','2020-6-15',null,52),
('J7Erik@gmail.com','U7Ortiz','2020-2-17',null,53),
('L7Mohamed@hotmail.con','R7Benitez','2020-2-26',null,54),
('P7Julan@outlook.com','J11Cortes','2020-2-29',null,55),
('A6Luis@outlook.com','A4Caballero','2020-3-23',null,56),
('P7Pau@gmail.com','E7Alvarez','2020-4-6',null,57),
('R6Unal@outlook.com','M7Mas','2020-4-17',null,58),
('N5Rafael@outlook.com','J7Ribas','2020-4-11',null,59),
('N5Joel@outlook.com','L7Navarro','2020-4-23',null,60),
('J7Alberto@gmail.com','P7Rossello','2020-3-23',null,61),
('A7Erik@hotmail.con','A6Juan','2020-1-19',null,62),
('F7Mohamed@outlook.com','P7Cortes','2020-4-27',null,63),
('A7Jlian@gmail.com','R6Tur','2020-6-4',null,64),
('M5Luis@gmail.com','N5Sastre','2020-6-9',null,65),
('B7Pau@hotmail.con','N5Perello','2020-5-11',null,66),
('A9Alberto@outlook.com','J7Amengual','2020-3-14',null,67),
('F6Pedro@outlook.com','A7Roig','2020-5-22',null,68),
('I5Raul@outlook.com','F7Ramis','2020-4-18',null,69),
('A7Nil@hotmail.com','A7Ramirez','2020-1-19',null,70),
('I4Noah@hotmail.com','M5Cardona','2020-6-21',null,71),
('M6Jan@outlook.com','B7Bauza','2020-1-19',null,72);



