create database CursosOnline;
drop database CursosOnline;

--tabla de maestro
create table maestro(
    	codigo integer auto_increment primary key,
    	nombre varchar(25) not null, 
    	ApellidoP varchar(20) not null,
    	ApellidoM varchar(20) null, 
    	foto varchar(100) null, 
    	n_celular varchar(10) not null
);


--tabla de alumno
create table alumno(
 	matricula integer primary key auto_increment,
 	nombre varchar(25) not null, 
 	ApellidoP varchar(20) not null, 
 	ApellidoM varchar(20) null, 
 	foto  varchar(100) null,
 	n_celular varchar(10) not null
 );


--tabla de categoria
create table categoria(
    	codigo integer primary key auto_increment,
    	nombre varchar(100) not null, 
    	descripcion text(500) not null
);


--tabla de curso
create table curso(
    	codigo integer primary key auto_increment,
	    nombre varchar(100) not null, 
    	costo  decimal(10,2) not null, 
    	imagen varchar(100) null, 
	    no_hrs integer not null, 
    	descripcion text(500) not null,
    	categoria integer, 
    	constraint fk_curso foreign key(categoria) references categoria(codigo) on delete cascade on update cascade
);



--tabla de temas
create table temas(
   	codigo integer primary key auto_increment, 
   	titulo varchar(100) not null, 
	descripcion text(500) not null,  
   	curso integer not null,
   	constraint fk_temas foreign key(curso) references curso(codigo) on delete cascade on update cascade
);




--tabla de cuentas
create table cuenta(
    	codigo integer primary key auto_increment, 
    	correo varchar(64) not null,
    	password varchar(72) not null, 
    	fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    	maestro integer null,
	    alumno integer null,
    	constraint fk_cuenta1 foreign key(maestro) references maestro(codigo)on delete cascade on update cascade,
    	constraint fk_cuenta2 foreign key(alumno) references alumno(matricula)on delete cascade on update cascade
);




--table de grupo
create table grupo( 
    	codigo integer primary key auto_increment,
    	nombre varchar(60) not null, 
	    horario time null, 
    	fecha_inicio date not null, 
	    fecha_fin date not null,
	    maestro integer not null,
	    disponibilidad integer, 
    	curso integer not null,
    	constraint fk_grupo_maestro foreign key(maestro) references maestro(codigo)on delete cascade on update cascade,
    	constraint fk_grupo_curso foreign key(curso) references curso(codigo)on delete cascade on update cascade
);


--tabla de pago
create table pago(
  	codigo integer primary key auto_increment,
  	monto decimal(10,2) not null, 
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	alumno integer not null, 
	grupo integer not null,
  	constraint fk_pago_alumno foreign key(alumno) references alumno(matricula)on delete cascade on update cascade,
  	constraint fk_pago_grupo foreign key(grupo) references grupo(codigo)on delete cascade on update cascade
);


--tabla de alumno grupo
create table alumno_grupo( 
    	codigo integer primary key auto_increment,
    	alumno integer not null, 
    	grupo integer not null,
    	constraint fk_alumnogrupo_alumno foreign key(alumno) references alumno(matricula)on delete cascade on update cascade,
    	constraint fk_alumnogrupo_grupo foreign key(grupo) references grupo(codigo)on delete cascade on update cascade
);

--tabla de certificado
create table certificado(
    	codigo integer primary key auto_increment,
    	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    	promedio decimal(3,2) not null, 
    	curso integer not null, 
    	alumno integer not null,
    	constraint fk_certificado_alumno foreign key(alumno) references alumno(matricula)on delete cascade on update cascade,
    	constraint fk_certificado_curso foreign key(curso) references curso(codigo)on delete cascade on update cascade
);


--tabla de calificacion
create table calificacion(
    	codigo integer primary key auto_increment,
   	    calificacion integer not null, 
    	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
   	    alumno integer not null,
    	grupo integer not null, 
    	tema integer not null,
    	constraint fk_calificacion_alumno foreign key(alumno) references alumno(matricula)on delete cascade on update cascade,
   	    constraint fk_calificacion_grupo foreign key(grupo) references grupo(codigo)on delete cascade on update cascade,
    	constraint fk_calificacion_tema foreign key(tema) references temas(codigo)on delete cascade on update cascade
);


-- Inserts Maestros

Insert into maestro(nombre,apellidoP,apellidoM,foto,N_Celular) values('Manuel', 'De Jesus', 'Gomez', null, '6638283780');
Insert into maestro(nombre,apellidoP,apellidoM,foto,N_Celular) values('Gael', 'Breton', 'Breton', null, '6659602046');
Insert into maestro(nombre,apellidoP,apellidoM,foto,N_Celular) values('Cristian', 'Novoa', 'Pizano', null, '6637987060');
Insert into maestro(nombre,apellidoP,apellidoM,foto,N_Celular) values('Luis', 'Lopez', 'Dominguez', null, '6657307956');
Insert into maestro(nombre,apellidoP,apellidoM,foto,N_Celular) values('Carlos', 'Hernandez', 'Guzman', null, '6635211378');

-- Inserts Alumnos
-- Inserts Alumnos
-- Inserts Alumnos


Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Hugo', 'Rodriguez', 'Muñoz', null, '6638283780');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Martin', 'Gonzalez', 'Blanco', null, '6659602046');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lucas', 'Fernandez', 'Gil', null, '6637987060');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mateo', 'Lopez', 'Aguirre', null, '6657307956');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Leo', 'Martinez', 'Diez', null, '6635211378');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Daniel', 'Sanchez', 'Salazar', null, '6652001262');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alejandro', 'Perez', 'Ramos', null, '6635249573');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pablo', 'Gomez', 'Ortiz', null, '6644793107');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Manuel', 'Martin', 'Dominguez', null, '6645371685');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alvaro', 'Jimenez', 'Ramirez', null, '6633288860');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Adrian', 'Hernandez', 'Romero', null, '6646519008');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('David', 'Ruiz', 'Ibañez', null, '6653051760');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mario', 'Diaz', 'Saez', null, '6646628942');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Enzo', 'Moreno', 'Santos', null, '6659578965');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Diego', 'Muñoz', 'Delgado', null, '6639143170');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Marcos', 'Alvarez', 'Ortega', null, '6632487548');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Izan', 'Romero', 'Uriarte', null, '6649737020');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Javier', 'Gutierrez', 'Sanz', null, '6633608956');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Brunoo', 'Alonso', 'Santamaria', null, '6637074497');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Oliver', 'Hernandez', 'Garcia', null, '6648472678');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Miguel', 'Cortes', 'Gonzalez', null, '6644441309');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Thiago', 'Moreno', 'Sanchez', null, '6636223335');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Antonio', 'Jimenez', 'Rodriguez', null, '6647437307');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Marcos', 'Torres', 'Fernandez', null, '6648360149');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Carlos', 'Navarro', 'Gomez', null, '6637520126');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Angel', 'Santiago', 'Lopez', null, '6643813704');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Juan', 'Muñoz', 'Perez', null, '6657083401');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gonzalo', 'Diaz', 'Diaz', null, '6642782157');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gael', 'Morales', 'Moreno', null, '6639925791');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Sergio', 'Molina', 'Martinez', null, '6645437518');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Nicolas', 'Alonso', 'Martin', null, '6633421151');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jorge', 'Parra', 'Romero', null, '6654082359');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jose', 'Vargas', 'Hernandez', null, '6657435525');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Adam', 'Ramos', 'Muñoz', null, '6648588271');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Liam', 'Segura', 'Alvarez', null, '6658053256');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Eric', 'Gutierrez', 'Jimenez', null, '6646979637');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Samuel', 'Maldonado', 'Ruiz', null, '6643472344');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Daio', 'Ortega', 'Dominguez', null, '6635839751');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Hector', 'Romero', 'Vazquez', null, '6637008299');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lucas', 'Castillo', 'Ramos', null, '6651811027');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Iker', 'Gimenez', 'Guerrero', null, '6641006076');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Amir', 'Cruz', 'Gutierrez', null, '6634837057');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Rodrigo', 'Rubio', 'Duran', null, '6652601277');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Saul', 'Fuentes', 'Gallardo', null, '6643951464');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Victor', 'Alvarez', 'Delgado', null, '6652694684');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Francisco', 'Ortiz', 'Nuñez', null, '6639356993');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ivan', 'Montoya', 'Marquez', null, '6634208248');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jesus', 'Villegas', 'Gil', null, '6633258008');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Aron', 'Amador', 'Blanco', null, '6644676041');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ruben', 'Marin', 'Flores', null, '6651410530');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ian', 'Flores', 'Gallego', null, '6658490271');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gullermo', 'Cano', 'Lozano', null, '6649636196');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Erik', 'Carmona', 'Ortiz', null, '6647670306');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mohamed', 'Ramirez', 'Benitez', null, '6632609969');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Julan', 'Manzano', 'Cortes', null, '6632851764');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Luis', 'Soler', 'Caballero', null, '6644076183');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pau', 'Salmeron', 'Alvarez', null, '6648303067');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Unal', 'Heredia', 'Mas', null, '6657273470');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Rafael', 'SERRANO', 'Ribas', null, '6631168469');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Joel', 'SAN SEGUNDO', 'Navarro', null, '6632756329');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alberto', 'RUIZ', 'Rossello', null, '6647809410');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Erik', 'ARRIBAS', 'Juan', null, '6644989612');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mohamed', 'HERRAEZ', 'Cortes', null, '6646070161');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jlian', 'DELGADO', 'Tur', null, '6643061882');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Luis', 'GALLEGO', 'Sastre', null, '6635529057');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pau', 'HERRANZ', 'Perello', null, '6656614616');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alberto', 'ARROYO', 'Amengual', null, '6651313255');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pedro', 'VAZQUEZ', 'Roig', null, '6655616420');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Raul', 'PRIETO', 'Ramis', null, '6649852740');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Nil', 'NUÑEZ', 'Ramirez', null, '6657924920');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Noah', 'RAMOS', 'Cardona', null, '6638028487');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jan', 'PASCUAL', 'Bauza', null, '6642673709');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Asier', 'VELAYOS', 'Sastre', null, '6652529963');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Fernand', 'ESTEBAN', 'Perello', null, '6657397726');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alonso', 'PINDADO', 'Rodriguez', null, '6656878802');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Maias', 'CALVO', 'Gonzalez', null, '6655467622');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Biel', 'VAQUERO', 'Fernandez', null, '6641498315');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Andres', 'IZQUIERDO', 'Lopez', null, '6657842213');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Fernanda', 'MENDEZ', 'Martinez', null, '6657412617');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ismael', 'YUSTE', 'Sanchez', null, '6655367786');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Axel', 'MENDOZA', 'Perez', null, '6659644475');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ismael', 'Cano', 'Gomez', null, '6645854036');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Martin', 'Cuenca', 'Martin', null, '6658147619');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Arnau', 'Ortiz', 'Jimenez', null, '6638938618');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Imran', 'Torres', 'Hernandez', null, '6658157083');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mauro', 'Gil', 'Ruiz', null, '6642315798');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Oscar', 'Corcoles', 'Diaz', null, '6657170245');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Cristian', 'Garrido', 'Moreno', null, '6641249386');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Leonardo', 'Rodenas', 'Muñoz', null, '6642381620');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Abel', 'Cebrian', 'Alvarez', null, '6656416130');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Adrián', 'Nuñez', 'Romero', null, '6639286002');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alejandro', 'Calero', 'Gutierrez', null, '6659032973');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ángel', 'Marin', 'Alonso', null, '6634337465');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Carlos', 'Tebar', 'Hernandez', null, '6647910044');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('César', 'Moya', 'Cortes', null, '6655005792');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Bruno', 'Ramirez', 'Moreno', null, '6645540987');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Daniel', 'Requena', 'Jimenez', null, '6639307270');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Darío', 'Alarcon', 'Torres', null, '6632593215');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('David', 'Collado', 'Navarro', null, '6646903387');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Diego', 'Blazquez', 'Santiago', null, '6644192879');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Emilio', 'Valero', 'Muñoz', null, '6638158822');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Fabián', 'Pardo', 'Diaz', null, '6655212852');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Felipe', 'Ballesteros', 'Morales', null, '6646129214');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gabriel', 'Escribano', 'Molina', null, '6656366723');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Héctor', 'Serrano', 'Alonso', null, '6657309549');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Hugo', 'San Segundo', 'Parra', null, '6654287800');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jacobo', 'Ruiz', 'Vargas', null, '6642115615');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Jaime', 'Arribas', 'Ramos', null, '6651929315');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Joaquín', 'Herraez', 'Segura', null, '6633493812');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Juan', 'Delgado', 'Gutierrez', null, '6654560547');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Leonardo', 'Gallego', 'Maldonado', null, '6658758719');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Leo', 'Herranz', 'Ortega', null, '6647353247');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lucas', 'Arroyo', 'Romero', null, '6656743156');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Marcos', 'Vazquez', 'Castillo', null, '6648053784');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Martín', 'Prieto', 'Gimenez', null, '6645612103');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mateo', 'Nuñez', 'Cruz', null, '6642518612');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Matías', 'Ramos', 'Rubio', null, '6659239665');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Miguel', 'Pascual', 'Fuentes', null, '6642954166');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Nicolás', 'Garcia', 'Alvarez', null, '6632877387');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pablo', 'Fernandez', 'Ortiz', null, '6637546997');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Raúl', 'Gonzalez', 'Montoya', null, '6646952583');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Samuel', 'Martinez', 'Villegas', null, '6644795951');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Santiago', 'Perez', 'Amador', null, '6634226917');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Sebastián', 'Lopez', 'Marin', null, '6643265420');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Tomás', 'Rodriguez', 'Flores', null, '6653218357');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Tristán', 'Sanchez', 'Cano', null, '6657667152');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Joan', 'Jimenez', 'Carmona', null, '6654743703');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Andrés', 'Martin', 'Ramirez', null, '6644147867');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ricardo', 'Gomez', 'Manzano', null, '6646674251');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Manuel', 'Ruiz', 'Soler', null, '6652410869');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ezequiel', 'Alonso', 'Salmeron', null, '6631513755');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Francisco', 'Hernandez', 'Heredia', null, '6649832086');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Elías', 'Diaz', 'SERRANO', null, '6632205698');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Blas', 'Gutierrez', 'SAN SEGUNDO', null, '6655044459');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alfonso', 'Alvarez', 'RUIZ', null, '6645655987');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ulises', 'Moreno', 'ARRIBAS', null, '6654559291');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gerardo', 'Muñoz', 'HERRAEZ', null, '6631817540');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Alfredo', 'Blanco', 'DELGADO', null, '6644869192');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Álvaro', 'Gil', 'GALLEGO', null, '6631824832');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Amadeo', 'Aguirre', 'HERRANZ', null, '6645134437');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Amancio', 'Diez', 'ARROYO', null, '6645589314');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Antonio', 'Salazar', 'VAZQUEZ', null, '6644993060');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Baltasar', 'Ramos', 'PRIETO', null, '6651470737');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Beltrán', 'Ortiz', 'NUÑEZ', null, '6647254723');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Benito', 'Dominguez', 'RAMOS', null, '6632124738');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Rufino', 'Ramirez', 'PASCUAL', null, '6646239380');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Boris', 'Romero', 'VELAYOS', null, '6655393680');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Florentino', 'Ibañez', 'Garcia', null, '6636303968');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Saturnino', 'Saez', 'Martinez', null, '6635155553');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Segundo', 'Santos', 'Lopez', null, '6653663865');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Anastasio', 'Delgado', 'Sanchez', null, '6658374879');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Cipriano', 'Ortega', 'Fernandez', null, '6649960534');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Teófilo', 'Uriarte', 'Moreno', null, '6648209885');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Casimiro', 'Sanz', 'Ruiz', null, '6654152808');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Bonifacio', 'Santamaria', 'Rodriguez', null, '6649921842');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Victorino', 'Garcia', 'Jimenez', null, '6647216436');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Eleuterio', 'Gonzalez', 'Perez', null, '6632505276');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Urbano', 'Sanchez', 'Gonzalez', null, '6643825037');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Severino', 'Rodriguez', 'Muñoz', null, '6636411915');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Inocencio', 'Fernandez', 'Gomez', null, '6634655306');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Primitivo', 'Gomez', 'Torres', null, '6647476532');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Bautista', 'Lopez', 'Molina', null, '6641210300');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Agapito', 'Perez', 'Ortega', null, '6645169484');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Benedicto', 'Diaz', 'Romero', null, '6639086863');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Enrique', 'Moreno', 'Diaz', null, '6652598572');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Eugenio', 'Martinez', 'Garrido', null, '6657426728');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Estanislao', 'Martin', 'Serrano', null, '6654261988');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Fausto', 'Romero', 'Gutierrez', null, '6638885540');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Faustino', 'Hernandez', 'Martos', null, '6652414399');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Felipe', 'Muñoz', 'Cano', null, '6657830052');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Félix', 'Alvarez', 'Cruz', null, '6641049903');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Fermín', 'Jimenez', 'Cortes', null, '6648630941');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Francisco', 'Ruiz', 'Exposito', null, '6635928374');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Gaspar', 'Dominguez', 'Ramirez', null, '6642857203');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Genaro', 'Vazquez', 'Castillo', null, '6654775845');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Hilario', 'Ramos', 'Marin', null, '6652897763');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Hugo', 'Guerrero', 'Quesada', null, '6643774943');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ignacio', 'Gutierrez', 'Lara', null, '6636036974');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ireneo', 'Duran', 'Medina', null, '6633727953');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ismael', 'Gallardo', 'Moral', null, '6652292851');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Joaquín', 'Delgado', 'Delgado', null, '6643822972');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('José', 'Nuñez', 'Fuentes', null, '6635390389');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Juan', 'Marquez', 'Castro', null, '6651762711');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Julián', 'Gil', 'Morales', null, '6632087047');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Justo', 'Blanco', 'Navarro', null, '6642125837');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Leopoldo', 'Flores', 'Hernandez', null, '6644693433');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('León', 'Gallego', 'Herrera', null, '6637222362');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lisandro', 'Lozano', 'Cabrera', null, '6642039475');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lorenzo', 'Ortiz', 'Cobo', null, '6638377447');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Lucas', 'Benitez', 'Martin', null, '6652324816');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Manuel', 'Cortes', 'Moya', null, '6653532066');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Mateo', 'Caballero', 'Ortiz', null, '6638261931');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pedro', 'Alvarez', 'Hidalgo', null, '6643284340');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Pío', 'Mas', 'Campos', null, '6631671400');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Romeo', 'Ribas', 'Contreras', null, '6645011970');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Roque', 'Navarro', 'Padilla', null, '6634221029');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Rufino', 'Rossello', 'Carrillo', null, '6634514004');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Santiago', 'Juan', 'Muñoz', null, '6635313974');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Salvador', 'Cortes', 'Macias', null, '6656689331');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Simón', 'Tur', 'Cruz', null, '6646225753');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Valentín', 'Sastre', 'Suarez', null, '6656129596');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Valentino', 'Perello', 'Gutierrez', null, '6651466008');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Vicente', 'Amengual', 'Santos', null, '6648145864');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Víctor', 'Roig', 'Nuñez', null, '6645998092');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Abundio', 'Ramis', 'Flores', null, '6658671205');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Ambrosio', 'Ramirez', 'Gil', null, '6637388067');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Aniceto', 'Cardona', 'Ortega', null, '6645685458');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Anselmo', 'Bauza', 'Cordero', null, '6631174383');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Apolonio', 'Sastre', 'Ponce', null, '6658293814');
Insert into alumno (nombre,ApellidoP,ApellidoM,foto,N_Celular) values('Aquilino', 'Perello', 'Reyes', null, '6652750515');

--inserts category
Insert into categoria(nombre,descripcion) values('Programacion', 'son cursos relacionados a los temas mas interesantes del mundo de progamacion');
Insert into categoria(nombre,descripcion) values('IdIomas', 'Son cursos relacionados al aprendizaje de los idiomas de english y frances');
Insert into categoria(nombre,descripcion) values('Diseño Grafico', 'Son cursos relacionas al aprendizaje de herrmainets, tecnica o conceptos en el mundo del diseño grafico.');
Insert into categoria(nombre,descripcion) values('Ciencia de datos', 'Son cursos estudio de datos con el fin de extraer información significativa para empresas. Es un enfoque multidisciplinario que combina principios y prácticas del campo de las matemáticas, la estadística, la inteligencia artificial y la ingeniería de computación');
Insert into categoria(nombre,descripcion) values('Negocios', 'Son cursos relacionados al ambito empresarial');

--inserts cursos
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Ingles', 850, 'Course-English.jpg', 200, 'Es un curso de 200 horas lectivas a lo largo del cual se trabajan las cinco destrezas principales de la lengua: la expresión oral, la interacción oral, la comprensión auditiva, la comprensión lectora, la expresión escrita. El curso es muy práctico y se exige la participación activa del alumno.',2);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Curso online de Adobe Photoshop', 299, 'adobephotoshop.jpg', 12, 'En este curso online aprenderás a usar Photoshop: efectos, filtros y más del programa más conocido de diseño. ḂConoce todas las herramientas hoy!',3);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Curso De Desarrollador - Python', 799, 'Course-Python.png', 200, 'En este curso de Python aprenderás de forma práctica los conceptos básicos, las mejores técnicas, así como las librerías más populares y herramientas necesarias para programar de forma eficiente con este lenguaje de programación.',1);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Curso Desarrollo Web - Aprende HTML y CSS', 299, 'Course-HTMLxCSS', 45, 'Aprende HTML y CSS desde cero, sin conocimientos previos. Conoce todo sobre etiquetas HTML, semántica, CSS, como dar estilos a los elementos de tu sitio web, medidas EM/REM, modelo de caja y mucho más. Aprenderás todo lo que necesitas para empezar en el desarrollo web online y a construir sitios para internet de manera eficiente.',1);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Curso Programación - Java', 249, '', 15, 'En este curso de Java aprenderás a dominar este lenguaje de programación desde cero a experto, lo cual te permitirá crear aplicaciones de escritorio siguiendo las buenas prácticas de programación en Java.',1);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Introducción a las finanzas', 500, 'finanza.jpg', 14, 'Este curso en línea te enseñará conceptos claves y herramientas de valor del dinero en el tiempo que te ayudarán a entender las diferentes tasas de interés y a evaluar, comparar y elegir proyectos de inversión y financiamiento en los mercados financieros.',5);
Insert into curso(nombre,costo,imagen,No_Hrs,descripcion,categoria) values('Curso online de Manejo fundamental de Adobe Illustrator CC2020', 300, 'illustratorcurso.jpg', 6, 'En este curso de Illustrator online conocerás las posibilidades creativas y de diseño que te ofrece el programa, aprenderás cómo usar Illustrator desde lo más básico hasta los tips y maneras para hacer tu proceso creativo más eficiente.
El curso de Illustrator te enseñará para qué sirve Illustrator, tips útiles para trabajar de manera eficiente y acercarte a sus herramientas para que conozcas su funcionamiento y puedas ver las posibilidades creativas que este programa ofrece. ',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curso online de Introducción a Adobe Photoshop CC2020', 450, 'adobephotoshop1.jpg', 8, 'El curso de introducción a Photoshop nos enseñará cómo personalizar los paneles y la caja de herramientas básicas de Photoshop para optimizar tu espacio de trabajo. Aprenderás a usar shortcuts, cómo usar las herramientas de retoque, selección y recorte, así como el manejo de capas y la herramienta más importante y útil de Photoshop, la herramienta pluma. El camino del diseño y el retoque fotográfico es largo pero divertido y este es un gran lugar para iniciar.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Introducción a Matemáticas para Finanzas y Negocios', 500, '', 8, 'El objetivo del curso es entender como ciertos conceptos matemáticos se utilizan de forma recurrente para analizar problemas financieros y de negocios.',5);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curso online de Diseño de logotipos desde cero', 185, 'diseñoiconoscurso.jpg', 5, 'En éste curso aprenderás el proceso completo de cómo construir un logotipo, desde la definición del significado y valor de la marca, hasta el proceso creativo y práctico para desarrollarlo en Adobe Illustrator. Desarrollarás una identidad gráfica y aplicaciones que expresen la personalidad de la marca.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Herramientas para el Análisis de Big Data', 200, 'cursos11.png', 4, 'Conoce las herramientas para el procesamiento, modelación, análisis, almacenamiento y acceso de los datos. Aprende en este curso online los beneficios del cómputo en la nube para los proyectos de ciencia de datos en las organizaciones y conoce las herramientas más populares.',4);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Ciencia de datos con Python', 200, 'curso12.pgn', 6, 'Comprender los conceptos básicos del lenguaje Python y cómo se aplican a la ciencia de datos',4);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Cuso basico de c++', 1000, 'cpp.jpg', 40, 'Aprende como programar en c++ de forma basica, te enseñara conceptos basicos como funciones, condicionales, ciclos, funciones.',1);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curso basico de assemby', 1500, 'asm.png', 500, 'Aprende conceptor basicos de assembly asi como el manejo de memoria',1);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curso basico de Arduino', 1000, 'arduino.png', 500, 'Arduino aprenderás los fundamentos y las aplicaciones con referente a electrónica, robótica y programación de este programa, además de sus características y funciones generales Todo esto, con el fin de llevar a cabo el desarrollo de proyectos.',1);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Ingles avanzado', 1200, 'inglesav.jpeg', 100, 'El curso para usuarios avanzados, para los que quieren perfeccionar su inglés. Al finalizar este curso, el usuario será capaz de comunicarse efectivamente en inglés.',2);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Ingles Intermedio', 700, 'inglesint.jpeg', 200, 'El curso intermedio es para los que dominan los conceptos básicos del lenguaje. Al finalizar este curso, el estudiante será capaz de entender y formar oraciones más complejas y comunicarse en inglés con mayor confianza.',2);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Chino mandarin basico', 900, 'cihnoman.jpg', 500, 'En el curso encontrarás desde la introducción a la fonética como expresiones cotidianas para tener conocimientos básicos y realizar conversaciones de la vida diaria, tales como el intercambio de información personal, hablando de acuerdos diarios o comida, preguntar sobre los precios, desenvolverse en la ciudad, etc.',2);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Aprende a usar adobe Ilustrator', 500, 'AdobeI.png', 80, 'Con este curso completo para principiantes podrás convertirte en un experto en imágenes vectoriales aunque no tengas conocimientos previos. Con ejercicios prácticos aprenderás las herramientas básicas del espacio de trabajo, como la selección directa, la pintura interactiva, el uso de la paleta de colores y mesas de trabajo; la herramienta pluma, las formas básicas y todos los atajos de teclado para que tu trabajo sea mucho más rápido y eficiente.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curos de fusion 360', 500, 'Fusion360.jpeg', 100, 'En este curso aprederas conceptos basicos sobre Fusion para que puedas plasmar tus ideas sin niguna dificultad.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Curso de solid works', 3000, 'solidw.jpeg', 500, 'Este curso permite a los diseñadores croquizar ideas con rapidez, experimentar con operaciones y cotas, así como también producir modelos y dibujos detallados. Durante la capacitación se analizan los conceptos y la terminología utilizados en toda la aplicación SOLIDWORKS, permitiendo al usuario familiarizarse con las funciones que se emplean habitualmente en este software de diseño.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, descripcion, Categoria) values('Aprende a plasmar tus ideas con blender', 500, 'blender.jpeg', 300, 'Domina el modelado 3D con Blender, el software de código abierto compatible con todos los sistemas operativos. Acércate a los conceptos de geometría que necesitas para empezar a modelar. Conoce la interfaz a fondo y empieza a crear tus primeros diseños. Aprende a usar modificadores, a aplicar materiales y a finalizar proyectos increíbles.',3);


-- Inserts temas

Insert into temas(titulo,descripcion,curso) values('La caja de herramientas', 'Aprenderas todo acerca las herramientas que se encuentran en adobe photoshop.',2);
Insert into temas(titulo,descripcion,curso) values('Herramientas de retoque', 'Aprenderas todo sobre las herrmaientas de retoque, el como utilizarlas hasta el como usarlas de una maner eficaz',2);
Insert into temas(titulo,descripcion,curso) values('Proyecto Final', 'Diseñaras con todo lo aprendido una foto de tu gusto y tendras que editarla con todas las herramientas aprendidas durante el curso.',2);
Insert into temas(titulo,descripcion,curso) values('Jugando con formas', 'Empezaras haciendo formas con distintos diseños diferentes y opciones con las que te podras desenvolver mejor.',7);
Insert into temas(titulo,descripcion,curso) values('Herramientas de color', 'Aprenderas los distintos tipos de color asi como el como poder crear capaz con estos mismos.',7);
Insert into temas(titulo,descripcion,curso) values('Herramientas de Texto', 'Aprenderas a como poder crear texto y el como poder editarlo de una manera sorprendente y mas original y estetica.',7);
Insert into temas(titulo,descripcion,curso) values('Trabajando con tasas', 'Tasas efectivas, periódicas y nominales. Tasas vencidas y anticipadas. Conversión y equivalencia de tasas. Función TASA NOMINAL',6);
Insert into temas(titulo,descripcion,curso) values('Valor del dinero en el tiempo', 'Introducción a conceptos básicos de interés simple, compuesto. Línea de tiempo y diagramas de flujo. Cálculos de valor futuro, valor presente, factor de acumulación y de descuento para uno y varios periodos. Cálculos de tasas de interés y número de periodos. Funciones de Excel VF, VA, NPER y TASA.',6);
Insert into temas(titulo,descripcion,curso) values('Trabajando con tasas', 'Tasas efectivas, periódicas y nominales. Tasas vencidas y anticipadas. Conversión y equivalencia de tasas. Función TASA NOMINAL',6);
Insert into temas(titulo,descripcion,curso) values('Valoraciones', 'Cálculos de valor presente y futuro con tasas variables, valoración descontada de flujos de efectivo, ecuaciones de valor equivalente y cálculo de fechas desconocidas. Cálculo de valor futuro y valor presente en series de pagos constantes.',6);
Insert into temas(titulo,descripcion,curso) values('Abriendo Photoshop por primera vez', 'Conocer el área de trabajo de photoshop, desde la apertura de un archivo hasta la personalización del programa para que se adapte a tus necesidades.',8);
Insert into temas(titulo,descripcion,curso) values('Primeras herramientas de retoque', 'Retoque simple: utilizarás el parche, pincel corrector puntual, tampón de clonar y borrador en photoshop, para retocar sutilmente una imagen.',8);
Insert into temas(titulo,descripcion,curso) values('Herramienta de trazado', 'Doble exposición en Photoshop: para llegar a una doble exposición aprenderás a usar las herramientas de selección, recorte y trazado. De esta manera podrás tomar las áreas que te interesen de una imagen y evolucionar a una completamente diferente.',8);
Insert into temas(titulo,descripcion,curso) values('Métodos y criterios', 'Métodos básicos de evaluación de proyectos: Valor Presente Neto y Tasa interna de retorno (TIR). Cálculo de VPN y TIR usando funciones de Excel. Evaluación y comparación de proyectos y flujos de efectivo usando VPN y TIR.',6);
Insert into temas(titulo,descripcion,curso) values('Funciones Lineales', 'Modelos lineales. Representación geométrica de una ecuación lineal. Aplicación al cálculo del rendimiento con composición simple. Concepto de pendiente y elasticidad',9);
Insert into temas(titulo,descripcion,curso) values('Matrices y Vectores', 'Matrices y Vectores. Operaciones con matrices: suma multiplicación, solución de modelos por inversión de matrices. Aplicaciones a la determinación de equilibrio macroeconómico y multiplicador fiscal',9);
Insert into temas(titulo,descripcion,curso) values('Funciones no lineales', 'Polinomios. Características de un polinomio, interpretación geométrica. determinación de raíces. Aplicaciones a la toma de decisiones de proyectos: Valor Presente y Tasa Interna de Retorno.',6);
Insert into temas(titulo,descripcion,curso) values('Matemáticas Financieras', 'Instrumentos de Mercado de Dinero. Tipos de instrumentos, tasa de rendimiento y tasas de descuento, frecuencia de composición y Day Count. Aplicación al cálculo del precio de un Cete y comparación entre los rendimientos mediante la Tasa Efectiva',6);
Insert into temas(titulo,descripcion,curso) values('Cálculo Infinitesimal', 'Derivadas: Máximos y Mínimos. Reglas de derivación de una función, determinación condiciones de primer y segundo orden. Aplicación a la determinación del monto óptimo de producción de una empresa.',6);
Insert into temas(titulo,descripcion,curso) values('Sitio Freelancer: Creando un proyecto paso a paso: HTML', 'Introduccion a HTML, crear los textos con html y aprender a estructurar el contenido, crear enlaces y navegacion entre paginas, añadir imagenes con html, asi como la creacion de formularios con HTML.',4);
Insert into temas(titulo,descripcion,curso) values('Sitio Freelancer: Creando un proyecto paso a paso: CSS', 'Introduccion a CSS, primeros pasos con CSS. Crear un archivo externo para el CSS , crear un archivo externo para el  CSS y dar estilos a nuestros proyectos.',4);
Insert into temas(titulo,descripcion,curso) values('Frontend store: Creando un segundo proyecto paso a paso: HTML', 'Aprendiendo a añadir los Globales al CSS, añadir el logotipo de navegacion, introduccion a BEM, creacion de enlaces, parender a añadir los productos, CSS a los productos, y posicionamiento de elementos.',4);
Insert into temas(titulo,descripcion,curso) values('Patrones de Diseño Responsive web Design con CSS Grid y Flexbox', 'Aprendiendo dos columnas Iguales, CSS grid, FlexBox, y Tres Columnas iguales- CSS Grid, FlexBox.',4);
Insert into temas(titulo,descripcion,curso) values('Blog Cafe- Creando un proyecto  con HTML Y CSS', 'AṀremdoemdp a añadir CSS global, crear el header, CSS al header, crear un blog y finalizar el blog, creando una barra lateral, crear un footer y crear un footer.',4);
Insert into temas(titulo,descripcion,curso) values('Los logotipos, en teoría 1', 'Vas a aprender como estan estructurados los logotipos y los tipos de de logotipos que existen asi como su significado.',10);
Insert into temas(titulo,descripcion,curso) values('Nuestro logotipo, desde el principio', 'Aprenderas como crear un logotipo y como hacer que ese tenga un significado.',10);
Insert into temas(titulo,descripcion,curso) values('Gridding & Refining', 'Una vez que ya sabemos la estructura de los logos podemos empezar el grid y el refining',10);
Insert into temas(titulo,descripcion,curso) values('Básicos del Lenguaje', 'Guia de instalacion y conceptos basicos, operadores matematicos, variables y expresiones, y introduccion de funciones.',3);
Insert into temas(titulo,descripcion,curso) values('Uso de strings y ciclos', 'operaciones con string en python, operaciones con string y el comando update y delete, operaciones con string: slices en python y for loops.',3);
Insert into temas(titulo,descripcion,curso) values('Estructura de datos', 'Uso de listas, operaciones con listas, agregando listas a nuestro proyecto, diccionarios a nuestros proyecto, tuplas y conjuntos.',3);
Insert into temas(titulo,descripcion,curso) values('Uso de objetos y modulos', 'Decoradores, introduccion a programacion orientada a objetos, scopes y namespace, introduccion a Click, definicion a API publica, clients. Introduccion a inteface de create.',3);
Insert into temas(titulo,descripcion,curso) values('Programacion Fundamental', 'Introduccion a Java, Funciones puras, funciones de orden mayor, y funciones lamba.',5);
Insert into temas(titulo,descripcion,curso) values('Functional Programming en Java', 'Configuracion del entorno de trabajo, Revision de paquetes java.util.function: (Function, Predicare, Costumer y Supplier, Operator y BiFunction.',5);
Insert into temas(titulo,descripcion,curso) values('Optional y Streams', 'Introduccion a clase Optional y Streams, operadores de collectors, operaciones terminales, operaciones intermedias, y collectors.',5);
Insert into temas(titulo,descripcion,curso) values('Gramatica Inglesa:los verbos y tiempos verbales', 'Introducción al Curso de Inglés Básico, Los Sustantivos, su plural y ejemplos en el idioma inglés, Los Artículos básicos en inglés,Adjetivos, concepto y lista de los más comunes en inglés, verbos en inglés, uso del infinitivo y ejemplos comunes, las preposiciones esenciales en la lengua inglesa. Pronombres personales, objetivos y reflexivos en inglés, posesivos: Adjetivos, pronombres e indicar propiedad. Los demostrativos en inglés: Pronombres y adjetivos El alfabeto y los colores en el idioma Inglés, los Números en Inglés: Cardinales y Ordinales, días de la semana, Meses y estaciones del año en inglés, uso de Much, Many y a Lot of, Ejemplos, el uso de Little y Few, donde utilizarlos Vocabulario.',1);
Insert into temas (titulo,descripcion,curso) values('Estructuras Gramaticales y Oraciones', 'Presente Simple: Oraciones afirmativas y negativas Preguntas personales en presente simple usando ḋdoṠ y ḋdoesṠ Adverbios de frecuencia: always, usually, sometimes & never El presente continuo y reglas del verbo en gerundio ḋ-ingṠ Pasado simple de ḋbeṠ: Oraciones con Was / Were Comparativos en inglés: Reglas de adjetivos y oraciones Preguntas de Personalidad / Apariencia ḋBe likeṠ & ḋLook likeṠ',1);
Insert into temas(titulo,descripcion,curso) values('Inglés Alto: Enfoque Práctico', 'Expresar acuerdo y desacuerdo con otras personas en inglés Uso de adjetivos -ing y -ed para describir emociones y sus causas Presente Perfecto, usos y ejemplos en oraciones / preguntas Reglas para formar adjetivos superlativos y cómo comparar con ellos Ejemplos con las clausulas adverbiales: before, after y when Diferencia entre el uso de las palabras should y have to en inglés Como usar too / not enough y too many / too much Clausulas relativas de sujeto. ',1);
Insert into temas(titulo,descripcion,curso) values('Inglés Avanzado: Enfoque Conversacional', 'El presente perfecto continuo; diferencia entre ḋSinceṠ y ḋForṠ Preguntas Indirectas en Inglés ṡCómo se forman y para qué se usan? La voz pasiva en inglés, estructuración de oraciones y ejemplos Clausulas relativas de sujeto y objeto. Usos comunes. Infinitivos y Gerundios para expresar un propósito o intención El Pasado Perfecto. Estructura, usos y ejemplos básicos Causativos en inglés con las palabras ḋHaveṠ y ḋGetṠ. Ejemplos Segundo condicional en inglés (Tipo II).',1);
Insert into temas(titulo,descripcion,curso) values('conceptos basicos de python para data science', 'Este curso de Python proporciona una introducción para principiantes a Python a la ciencia de datos. Practica a través de ejercicios de laboratorio, Ḃy estarás listo para crear tus primeros scripts de Python por tu cuenta!',12);
Insert into temas(titulo,descripcion,curso) values('analizando datos con python', 'En este curso aprenderás cómo analizar datos en Python usando matrices multidimensionales en numpy, a manipular DataFrames en pandas, a usar la biblioteca SciPy de rutinas matemáticas y a realizar aprendizaje automático usando scikit-learn.',12);
Insert into temas(titulo,descripcion,curso) values('visuslizando datos con python', 'La visualización de datos es la representación gráfica de los datos para transmitir de manera interactiva y eficiente las ideas a los clientes y partes interesadas en general.',12);
Insert into temas(titulo,descripcion,curso) values('Meachine Learning con python', 'El Machine Learning puede ser una herramienta increíblemente beneficiosa para descubrir información y predecir tendencias futuras. Este curso de aprendizaje automático con Python te brindará todas las herramientas que necesitas para comenzar con el aprendizaje supervisado y autónomo.',12);


--insert cuenta

Insert into Cuenta (correo,password, fecha_creacion,maestro, alumno) values('M8Manuel@outlook.com', 'H9Gomez', '2020-2-7', 1, null);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L9Gael@hotmail.con', 'M8Breton', '2020-3-6', 2, null);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M5Cristian@outlook.com', 'L9Pizano', '2020-4-10', 3, null);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L8Luis@hotmail.con', 'M5Dominguez', '2020-4-11', 4, null);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D7Carlos@outlook.com', 'L8Guzman', '2020-3-12', 5, null);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D4Hugo@hotmail.con', 'D7Muñoz', '2020-6-8', null, 1);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M4Martin@outlook.com', 'A5Blanco', '2020-1-24', null, 2);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E6Lucas@hotmail.con', 'P5Gil', '2020-4-2', null, 3);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D5Mateo@gmail.com', 'M6Aguirre', '2020-1-15', null, 4);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M7Leo@gmail.com', 'A7Diez', '2020-3-27', null, 5);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I6Daniel@outlook.com', 'A9Salazar', '2020-2-1', null, 6);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J9Alejandro@hotmail.con', 'D4Ramos', '2020-2-13', null, 7);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B6Pablo@gmail.com', 'M4Ortiz', '2020-1-26', null, 8);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('O9Manuel@gmail.com', 'E6Dominguez', '2020-6-21', null, 9);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M6Alvaro@gmail.com', 'D5Ramirez', '2020-6-6', null, 10);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('T6Adrian@hotmail.con', 'M7Romero', '2020-1-23', null, 11);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7David@hotmail.con', 'I6Ibañez', '2020-6-24', null, 12);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M6Mario@outlook.com', 'J9Saez', '2020-2-31', null, 13);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C7Enzo@gmail.com', 'B6Santos', '2020-3-17', null, 14);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A8Diego@gmail.com', 'O9Delgado', '2020-4-4', null, 15);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J5Marcos@gmail.com', 'M6Ortega', '2020-1-5', null, 16);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G4Izan@hotmail.con', 'T6Uriarte', '2020-4-10', null, 17);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G7Javier@gmail.com', 'A7Sanz', '2020-3-18', null, 18);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S6Brunoo@outlook.com', 'M6Santamaria', '2020-2-28', null, 19);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N6Oliver@hotmail.con', 'C7Garcia', '2020-3-9', null, 20);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J5Miguel@hotmail.con', 'A8Gonzalez', '2020-2-31', null, 21);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J6Thiago@gmail.com', 'J5Sanchez', '2020-3-22', null, 22);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Antonio@gmail.com', 'G4Rodriguez', '2020-6-5', null, 23);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L6Marcos@hotmail.con', 'G7Fernandez', '2020-4-14', null, 24);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E9Carlos@gmail.com', 'S6Gomez', '2020-5-23', null, 25);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S9Angel@hotmail.con', 'N6Lopez', '2020-3-19', null, 26);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D6Juan@hotmail.con', 'J5Perez', '2020-4-16', null, 27);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('H6Gonzalo@outlook.com', 'J6Diaz', '2020-4-18', null, 28);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L8Gael@outlook.com', 'A5Moreno', '2020-2-29', null, 29);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I7Sergio@outlook.com', 'L6Martinez', '2020-5-4', null, 30);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A4Nicolas@gmail.com', 'E9Martin', '2020-5-25', null, 31);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R5Jorge@outlook.com', 'S9Romero', '2020-4-7', null, 32);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S7Jose@gmail.com', 'D6Hernandez', '2020-2-8', null, 33);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V7Adam@gmail.com', 'H6Muñoz', '2020-4-28', null, 34);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F5Liam@gmail.com', 'L8Alvarez', '2020-2-22', null, 35);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I7Eric@outlook.com', 'I7Jimenez', '2020-1-26', null, 36);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J8Samuel@hotmail.con', 'A4Ruiz', '2020-2-12', null, 37);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Daio@gmail.com', 'R5Dominguez', '2020-4-20', null, 38);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R5Hector@hotmail.con', 'S7Vazquez', '2020-2-9', null, 39);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I6Lucas@outlook.com', 'V7Ramos', '2020-1-2', null, 40);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G4Iker@hotmail.con', 'F5Guerrero', '2020-4-29', null, 41);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E7Amir@outlook.com', 'I7Gutierrez', '2020-4-21', null, 42);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M7Rodrigo@hotmail.con', 'J8Duran', '2020-3-23', null, 43);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Saul@gmail.com', 'A6Gallardo', '2020-1-6', null, 44);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L5Victor@gmail.com', 'R5Delgado', '2020-1-25', null, 45);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P8Francisco@gmail.com', 'I6Nuñez', '2020-4-19', null, 46);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('U7Ivan@outlook.com', 'G4Marquez', '2020-4-8', null, 47);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R7Jesus@gmail.com', 'E7Gil', '2020-5-25', null, 48);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J11Aron@gmail.com', 'M7Blanco', '2020-3-28', null, 49);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A4Ruben@gmail.com', 'J7Flores', '2020-3-1', null, 50);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E7Ian@outlook.com', 'L5Gallego', '2020-1-21', null, 51);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M7Gullermo@gmail.com', 'P8Lozano', '2020-2-25', null, 52);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Erik@hotmail.con', 'U7Ortiz', '2020-1-14', null, 53);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Mohamed@gmail.com', 'R7Benitez', '2020-5-4', null, 54);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P7Julan@outlook.com', 'J11Cortes', '2020-4-6', null, 55);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Luis@outlook.com', 'A4Caballero', '2020-1-14', null, 56);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P7Pau@outlook.com', 'E7Alvarez', '2020-6-19', null, 57);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R6Unal@hotmail.con', 'M7Mas', '2020-3-12', null, 58);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N5Rafael@outlook.com', 'J7Ribas', '2020-5-3', null, 59);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N5Joel@outlook.com', 'L7Navarro', '2020-3-26', null, 60);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Alberto@gmail.com', 'P7Rossello', '2020-1-21', null, 61);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Erik@hotmail.con', 'A6Juan', '2020-1-21', null, 62);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F7Mohamed@outlook.com', 'P7Cortes', '2020-5-31', null, 63);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Jlian@hotmail.con', 'R6Tur', '2020-4-22', null, 64);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M5Luis@gmail.com', 'N5Sastre', '2020-4-18', null, 65);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B7Pau@gmail.com', 'N5Perello', '2020-1-8', null, 66);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A9Alberto@outlook.com', 'J7Amengual', '2020-3-15', null, 67);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F6Pedro@hotmail.con', 'A7Roig', '2020-6-13', null, 68);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I5Raul@hotmail.con', 'F7Ramis', '2020-5-25', null, 69);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Nil@outlook.com', 'A7Ramirez', '2020-2-11', null, 70);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I4Noah@outlook.com', 'M5Cardona', '2020-1-28', null, 71);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M6Jan@gmail.com', 'B7Bauza', '2020-2-8', null, 72);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Asier@gmail.com', 'A9Sastre', '2020-6-5', null, 73);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I6Fernand@gmail.com', 'F6Perello', '2020-5-4', null, 74);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M3Alonso@outlook.com', 'I5Rodriguez', '2020-6-17', null, 75);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('O8Maias@hotmail.con', 'A7Gonzalez', '2020-3-20', null, 76);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C7Biel@hotmail.con', 'I4Fernandez', '2020-4-11', null, 77);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Andres@gmail.com', 'M6Lopez', '2020-1-18', null, 78);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Fernanda@gmail.com', 'A5Martinez', '2020-6-27', null, 79);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Ismael @gmail.com', 'I6Sanchez', '2020-5-19', null, 80);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Axel@hotmail.con', 'M3Perez', '2020-1-23', null, 81);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('Á5Ismael @hotmail.con', 'O8Gomez', '2020-1-28', null, 82);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C5Martin@hotmail.con', 'C7Martin', '2020-5-13', null, 83);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C4Arnau@outlook.com', 'L7Jimenez', '2020-2-3', null, 84);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B7Imran@outlook.com', 'A7Hernandez', '2020-4-26', null, 85);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D7Mauro@gmail.com', 'A5Ruiz', '2020-6-9', null, 86);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D7Oscar@outlook.com', 'A6Diaz', '2020-2-29', null, 87);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D7Cristian@gmail.com', 'Á5Moreno', '2020-3-16', null, 88);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D8Leonardo@hotmail.con', 'C5Muñoz', '2020-4-31', null, 89);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E6Abel@gmail.com', 'C4Alvarez', '2020-1-14', null, 90);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F5Adrián@outlook.com', 'B7Romero', '2020-1-20', null, 91);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F11Alejandro@hotmail.con', 'D7Gutierrez', '2020-6-22', null, 92);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G9Ángel@outlook.com', 'D7Alonso', '2020-4-28', null, 93);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('H7Carlos@gmail.com', 'D7Hernandez', '2020-2-24', null, 94);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('H11César@hotmail.con', 'D8Cortes', '2020-1-25', null, 95);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J4Bruno@outlook.com', 'E6Moreno', '2020-5-11', null, 96);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Daniel@gmail.com', 'F5Jimenez', '2020-2-10', null, 97);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Darío@hotmail.con', 'F11Torres', '2020-1-13', null, 98);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7David@outlook.com', 'G9Navarro', '2020-5-30', null, 99);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Diego@gmail.com', 'H7Santiago', '2020-3-9', null, 100);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Emilio@outlook.com', 'H11Muñoz', '2020-3-7', null, 101);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L6Fabián@outlook.com', 'J4Diaz', '2020-3-1', null, 102);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M7Felipe@gmail.com', 'J7Morales', '2020-6-8', null, 103);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M6Gabriel@outlook.com', 'J7Molina', '2020-6-26', null, 104);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M5Héctor@outlook.com', 'J7Alonso', '2020-4-25', null, 105);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M5Hugo@outlook.com', 'L7Parra', '2020-2-16', null, 106);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M7Jacobo@hotmail.con', 'L7Vargas', '2020-1-3', null, 107);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N6Jaime@hotmail.con', 'L6Ramos', '2020-2-2', null, 108);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P9Joaquín@gmail.com', 'M7Segura', '2020-5-15', null, 109);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R8Juan@outlook.com', 'M6Gutierrez', '2020-6-18', null, 110);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S8Leonardo@outlook.com', 'M5Maldonado', '2020-1-2', null, 111);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S5Leo@outlook.com', 'M5Ortega', '2020-5-18', null, 112);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S5Lucas@hotmail.con', 'M7Romero', '2020-4-30', null, 113);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('T9Marcos@outlook.com', 'N6Castillo', '2020-5-25', null, 114);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('T7Martín@hotmail.con', 'P9Gimenez', '2020-6-9', null, 115);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Mateo@gmail.com', 'R8Cruz', '2020-2-29', null, 116);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Matías@gmail.com', 'S8Rubio', '2020-1-3', null, 117);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R5Miguel@gmail.com', 'S5Fuentes', '2020-1-30', null, 118);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M4Nicolás@outlook.com', 'S5Alvarez', '2020-3-14', null, 119);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E6Pablo@outlook.com', 'T9Ortiz', '2020-3-10', null, 120);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F9Raúl@gmail.com', 'T7Montoya', '2020-3-4', null, 121);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E4Samuel@gmail.com', 'J7Villegas', '2020-6-18', null, 122);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B9Santiago@outlook.com', 'A6Amador', '2020-6-19', null, 123);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Sebastián@gmail.com', 'R5Marin', '2020-6-30', null, 124);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('U6Tomás@hotmail.con', 'M4Flores', '2020-3-12', null, 125);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G5Tristán@hotmail.con', 'E6Cano', '2020-5-16', null, 126);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Joan@outlook.com', 'F9Carmona', '2020-1-14', null, 127);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('Á3Andrés@gmail.com', 'E4Ramirez', '2020-4-20', null, 128);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Ricardo@outlook.com', 'B9Manzano', '2020-3-23', null, 129);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A4Manuel@hotmail.con', 'A7Soler', '2020-2-8', null, 130);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Ezequiel@outlook.com', 'U6Salmeron', '2020-3-9', null, 131);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B5Francisco@outlook.com', 'G5Heredia', '2020-6-17', null, 132);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B5Elías@gmail.com', 'A6SERRANO', '2020-2-2', null, 133);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B9Blas@hotmail.con', 'Á3SAN SEGUNDO', '2020-2-30', null, 134);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R7Alfonso@gmail.com', 'A7RUIZ', '2020-1-9', null, 135);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B6Ulises@hotmail.con', 'A4ARRIBAS', '2020-6-18', null, 136);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F6Gerardo@gmail.com', 'A7HERRAEZ', '2020-4-2', null, 137);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S4Alfredo@hotmail.con', 'B5DELGADO', '2020-5-23', null, 138);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S6Álvaro@hotmail.con', 'B5GALLEGO', '2020-5-24', null, 139);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Amadeo@gmail.com', 'B9HERRANZ', '2020-1-17', null, 140);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C6Amancio@hotmail.con', 'R7ARROYO', '2020-3-14', null, 141);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('T7Antonio@gmail.com', 'B6VAZQUEZ', '2020-1-13', null, 142);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C4Baltasar@outlook.com', 'F6PRIETO', '2020-3-2', null, 143);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B10Beltrán@hotmail.con', 'S4NUÑEZ', '2020-6-22', null, 144);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V6Benito@hotmail.con', 'S6RAMOS', '2020-2-31', null, 145);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E8Rufino@gmail.com', 'A7PASCUAL', '2020-6-2', null, 146);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('U7Boris@gmail.com', 'C6VELAYOS', '2020-5-22', null, 147);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S9Florentino@hotmail.con', 'T7Garcia', '2020-6-7', null, 148);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I9Saturnino@outlook.com', 'C4Martinez', '2020-2-25', null, 149);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P5Segundo@outlook.com', 'B10Lopez', '2020-2-27', null, 150);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B5Anastasio@hotmail.con', 'V6Sanchez', '2020-6-11', null, 151);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Cipriano@gmail.com', 'E8Fernandez', '2020-4-29', null, 152);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('B4Teófilo@gmail.com', 'U7Moreno', '2020-1-9', null, 153);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E6Casimiro@hotmail.con', 'S9Ruiz', '2020-2-3', null, 154);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E8Bonifacio@gmail.com', 'I9Rodriguez', '2020-2-18', null, 155);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('E6Victorino@outlook.com', 'P5Jimenez', '2020-1-15', null, 156);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F6Eleuterio@outlook.com', 'B5Perez', '2020-3-18', null, 157);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F9Urbano@outlook.com', 'A5Gonzalez', '2020-1-8', null, 158);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F5Severino@gmail.com', 'B4Muñoz', '2020-1-1', null, 159);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F7Inocencio@hotmail.con', 'E6Gomez', '2020-5-3', null, 160);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F7Primitivo@outlook.com', 'E8Torres', '2020-3-20', null, 161);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('F4Bautista@gmail.com', 'E6Molina', '2020-4-26', null, 162);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G9Agapito@gmail.com', 'F6Ortega', '2020-1-17', null, 163);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('G7Benedicto@gmail.com', 'F9Romero', '2020-2-12', null, 164);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('H5Enrique@hotmail.con', 'F5Diaz', '2020-6-20', null, 165);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('H8Eugenio@outlook.com', 'F7Garrido', '2020-3-4', null, 166);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I9Estanislao@outlook.com', 'F7Serrano', '2020-3-5', null, 167);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I5Fausto@hotmail.con', 'F4Gutierrez', '2020-4-28', null, 168);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I8Faustino@hotmail.con', 'G9Martos', '2020-5-13', null, 169);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Felipe@gmail.com', 'G7Cano', '2020-6-25', null, 170);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J5Félix@outlook.com', 'H5Cruz', '2020-1-23', null, 171);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J7Fermín@outlook.com', 'H8Cortes', '2020-1-7', null, 172);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J3Francisco@gmail.com', 'I9Exposito', '2020-5-17', null, 173);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('J6Gaspar@hotmail.con', 'I5Ramirez', '2020-5-23', null, 174);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L6Genaro@hotmail.con', 'I8Castillo', '2020-5-24', null, 175);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Hilario@gmail.com', 'J7Marin', '2020-1-29', null, 176);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L6Hugo@hotmail.con', 'J5Quesada', '2020-1-9', null, 177);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L5Ignacio@hotmail.con', 'J7Lara', '2020-5-25', null, 178);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('L7Ireneo@hotmail.con', 'J3Medina', '2020-6-24', null, 179);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M6Ismael@hotmail.con', 'J6Moral', '2020-5-31', null, 180);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('M9Joaquín@hotmail.con', 'L6Delgado', '2020-1-20', null, 181);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P7José@outlook.com', 'L7Fuentes', '2020-3-25', null, 182);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P3Juan@gmail.com', 'L6Castro', '2020-3-8', null, 183);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R5Julián@outlook.com', 'L5Morales', '2020-5-30', null, 184);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R7Justo@hotmail.con', 'L7Navarro', '2020-5-11', null, 185);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('R8Leopoldo@outlook.com', 'M6Hernandez', '2020-2-26', null, 186);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S4León@gmail.com', 'M9Herrera', '2020-5-23', null, 187);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S6Lisandro@outlook.com', 'P7Cabrera', '2020-1-6', null, 188);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('S3Lorenzo@gmail.com', 'P3Cobo', '2020-6-6', null, 189);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V6Lucas@hotmail.con', 'R5Martin', '2020-5-19', null, 190);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V7Manuel@hotmail.con', 'R7Moya', '2020-1-6', null, 191);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V8Mateo@outlook.com', 'R8Ortiz', '2020-1-4', null, 192);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('V4Pedro@hotmail.con', 'S4Hidalgo', '2020-5-4', null, 193);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Pío@gmail.com', 'S6Campos', '2020-5-17', null, 194);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Romeo@gmail.com', 'S3Contreras', '2020-5-9', null, 195);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Roque@outlook.com', 'V6Padilla', '2020-2-4', null, 196);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A5Rufino@hotmail.con', 'V7Carrillo', '2020-4-20', null, 197);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A6Santiago@gmail.com', 'V8Muñoz', '2020-5-27', null, 198);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('A7Salvador@hotmail.con', 'V4Macias', '2020-4-26', null, 199);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('0Simón@gmail.com', 'A5Cruz', '2020-6-19', null, 200);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C0Valentín@hotmail.con', 'A7Suarez', '2020-6-6', null, 201);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N11Valentino@hotmail.con', 'A7Gutierrez', '2020-2-20', null, 202);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C11Vicente@gmail.com', 'A5Santos', '2020-3-19', null, 203);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('P77Víctor@outlook.com', 'A6Nuñez', '2020-2-13', null, 204);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('I74Abundio@hotmail.con', 'A7Flores', '2020-5-18', null, 205);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('D103Ambrosio@gmail.com', '0Gil', '2020-3-27', null, 206);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('C262Aniceto@hotmail.con', 'C0Ortega', '2020-5-12', null, 207);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('N45Anselmo@hotmail.con', 'N11Cordero', '2020-2-9', null, 208);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('0Apolonio@outlook.com', 'C11Ponce', '2020-4-21', null, 209);
Insert into Cuenta (correo,password, fecha_creacion,maestro,alumno) values('0Aquilino@hotmail.con', 'P77Reyes', '2020-1-28', null, 210);

-- Insertar Grupo 

Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,Curso) values('Curso online de Adobe Photoshop', 0, '2022-12-1','2023-3-24', 1,0,2);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,Curso) values('Ingles', 0, '2022-12-1', '2023-4-24', 2,0,1);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,Curso) values('Curso De Desarrollador - Python', 0, '2022-12-5', '2023-3-2', 3,0,3);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,Curso) values('Curso Desarrollo Web - Aprende HTML y CSS', 0, '2022-12-1', '2023-3-24', 4,0,4);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,Curso) values('Curso Programación - Java', 0, '2022-12-3', '2023-4-24', 5,0,5);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Introducción a las finanzas', 0, '2022-12-1', '2023-4-3', 1,0,6);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Curso online de Manejo fundamental de Adobe', 0, '2022-12-1', '2023-4-3', 2,0,7);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Curso online de Introducción a Adobe Photoshop', 0, '2022-12-1', '2023-4-3', 3,0,8);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Introducción a Matemáticas para Finanzas y Negocios', 0, '2022-12-1', '2023-5-2', 4,0,9);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Curso online de Diseño de logotipos', 0, '2022-12-1', '2023-4-3', 5,0,10);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Herramientas para el Análisis de Big Data', 0, '2022-12-1', '2023-5-7', 1,0,11);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,disponibilidad,curso) values('Ciencia de datos con Python', 0, '2022-12-1', '2023-5-7', 2,0,12);

-- Inserts Pago

Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-30', 1, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-13', 2, 2);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-28', 3, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-17', 4, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-13', 5, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-17', 6, 4);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-7', 7, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-6', 8, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-14', 9, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-9', 10, 2);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-24', 11, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-15', 12, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-15', 13, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-8', 14, 5);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-1', 15, 5);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-3', 16, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-7', 17, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-8', 18, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-21', 19, 4);

Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-5', 20, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-24', 21, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-4', 22, 2);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-5', 23, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-11', 24, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-27', 25, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-20', 26, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-13', 27, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-3', 28, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-23', 29, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-23', 30, 2);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-3', 31, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-4', 32, 3);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-17', 33, 1);


Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-24', 34, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-5', 35, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-1', 36, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-7', 37, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-10', 38, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-18', 39, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-7', 40, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-25', 41, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-2', 42, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-4', 43, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-7', 44, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-30', 45, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-3', 46, 3);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-12', 47, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-17', 48, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-17', 49, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-15', 50, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-25', 51, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-20', 52, 3);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-4', 53, 3);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-13', 54, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-26', 55, 3);

Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-3', 56, 3);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-16', 57, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-16', 58, 4);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-16', 59, 5);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-16', 60, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-2', 61, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-14', 62, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-28', 63, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-4', 64, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-1', 65, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-8-21', 66, 3);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-19', 67, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-9', 68, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-21', 69, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-18', 70, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-2', 71, 2);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-14', 72, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-2', 73, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-2', 74, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-31', 75, 4);

Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-13', 76, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-26', 77, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-8', 78, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-4', 79, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-10', 80, 4);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-18', 81, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-22', 82, 2);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-2', 83, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-17', 84, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-21', 85, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-2', 86, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-10', 87, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-7', 88, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-18', 89, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-1', 90, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-14', 91, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-2', 92, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-8', 93, 4);

Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-21', 94, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-18', 95, 2);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-12', 96, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-30', 97, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-28', 98, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-25', 99, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-15', 100, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-1', 101, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-6', 102, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-6', 103, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-7', 104, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-9', 105, 2);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-4', 106, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-13', 107, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-6', 108, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-22', 109, 4);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-18', 110, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-12', 111, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-8', 112, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-10', 113, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-5', 114, 4);

Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-2', 115, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-23', 116, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-2', 117, 4);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-8', 118, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-18', 119, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-5', 120, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-15', 121, 2);

Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-10', 122, 2);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-13', 123, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-21', 124, 1);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-21', 125, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-23', 126, 4);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-6-7', 127, 4);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-11', 128, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-5', 129, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-17', 130, 4);

Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-31', 131, 5);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-31', 132, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-7-8', 133, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-7-23', 134, 2);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-7-19', 135, 3);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-15', 136, 4);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-25', 137, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-6-10', 138, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-14', 139, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-31', 140, 1);

Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-15', 141, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-1', 142, 1);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-9', 143, 1);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-8-22', 144, 5);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-28', 145, 2);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-8-9', 146, 1);
Insert into pago(monto,fecha,alumno,grupo) values(299, '2020-8-13', 147, 4);
Insert into pago(monto,fecha,alumno,grupo) values(799, '2020-6-25', 148, 3);
Insert into pago(monto,fecha,alumno,grupo) values(249, '2020-6-12', 149, 5);
Insert into pago(monto,fecha,alumno,grupo) values(850, '2020-7-27', 150, 1);

-- Inserts Alumno_Grupo

Insert into alumno_grupo(alumno,grupo) values(1, 2);
Insert into alumno_grupo(alumno,grupo) values(2, 2);
Insert into alumno_grupo(alumno,grupo) values(3, 5);
Insert into alumno_grupo(alumno,grupo) values(4, 4);
Insert into alumno_grupo(alumno,grupo) values(5, 4);
Insert into alumno_grupo(alumno,grupo) values(6, 4);
Insert into alumno_grupo(alumno,grupo) values(7, 5);
Insert into alumno_grupo(alumno,grupo) values(8, 3);
Insert into alumno_grupo(alumno,grupo) values(9, 4);
Insert into alumno_grupo(alumno,grupo) values(10, 2);
Insert into alumno_grupo(alumno,grupo) values(11, 3);
Insert into alumno_grupo(alumno,grupo) values(12, 5);
Insert into alumno_grupo(alumno,grupo) values(13, 1);
Insert into alumno_grupo(alumno,grupo) values(14, 5);
Insert into alumno_grupo(alumno,grupo) values(15, 5);
Insert into alumno_grupo(alumno,grupo) values(16, 5);
Insert into alumno_grupo(alumno,grupo) values(17, 3);
Insert into alumno_grupo(alumno,grupo) values(18, 5);
Insert into alumno_grupo(alumno,grupo) values(19, 4);
Insert into alumno_grupo(alumno,grupo) values(20, 5);
Insert into alumno_grupo(alumno,grupo) values(21, 3);
Insert into alumno_grupo(alumno,grupo) values(22, 2);
Insert into alumno_grupo(alumno,grupo) values(23, 3);
Insert into alumno_grupo(alumno,grupo) values(24, 5);
Insert into alumno_grupo(alumno,grupo) values(25, 4);
Insert into alumno_grupo(alumno,grupo) values(26, 2);
Insert into alumno_grupo(alumno,grupo) values(27, 4);
Insert into alumno_grupo(alumno,grupo) values(28, 4);
Insert into alumno_grupo(alumno,grupo) values(29, 3);
Insert into alumno_grupo(alumno,grupo) values(30, 2);
Insert into alumno_grupo(alumno,grupo) values(31, 5);
Insert into alumno_grupo(alumno,grupo) values(32, 3);
Insert into alumno_grupo(alumno,grupo) values(33, 1);
Insert into alumno_grupo(alumno,grupo) values(34, 3);
Insert into alumno_grupo(alumno,grupo) values(35, 2);
Insert into alumno_grupo(alumno,grupo) values(36, 2);
Insert into alumno_grupo(alumno,grupo) values(37, 1);
Insert into alumno_grupo(alumno,grupo) values(38, 4);
Insert into alumno_grupo(alumno,grupo) values(39, 2);
Insert into alumno_grupo(alumno,grupo) values(40, 1);
Insert into alumno_grupo(alumno,grupo) values(41, 5);
Insert into alumno_grupo(alumno,grupo) values(42, 3);
Insert into alumno_grupo(alumno,grupo) values(43, 2);
Insert into alumno_grupo(alumno,grupo) values(44, 2);
Insert into alumno_grupo(alumno,grupo) values(45, 4);
Insert into alumno_grupo(alumno,grupo) values(46, 3);
Insert into alumno_grupo(alumno,grupo) values(47, 1);
Insert into alumno_grupo(alumno,grupo) values(48, 3);
Insert into alumno_grupo(alumno,grupo) values(49, 5);
Insert into alumno_grupo(alumno,grupo) values(50, 4);
Insert into alumno_grupo(alumno,grupo) values(51, 4);
Insert into alumno_grupo(alumno,grupo) values(52, 3);
Insert into alumno_grupo(alumno,grupo) values(53, 3);
Insert into alumno_grupo(alumno,grupo) values(54, 1);
Insert into alumno_grupo(alumno,grupo) values(55, 3);
Insert into alumno_grupo(alumno,grupo) values(56, 3);
Insert into alumno_grupo(alumno,grupo) values(57, 3);
Insert into alumno_grupo(alumno,grupo) values(58, 4);
Insert into alumno_grupo(alumno,grupo) values(59, 5);
Insert into alumno_grupo(alumno,grupo) values(60, 5);
Insert into alumno_grupo(alumno,grupo) values(61, 2);
Insert into alumno_grupo(alumno,grupo) values(62, 1);
Insert into alumno_grupo(alumno,grupo) values(63, 1);
Insert into alumno_grupo(alumno,grupo) values(64, 1);
Insert into alumno_grupo(alumno,grupo) values(65, 1);
Insert into alumno_grupo(alumno,grupo) values(66, 3);
Insert into alumno_grupo(alumno,grupo) values(67, 1);
Insert into alumno_grupo(alumno,grupo) values(68, 3);
Insert into alumno_grupo(alumno,grupo) values(69, 5);
Insert into alumno_grupo(alumno,grupo) values(70, 3);
Insert into alumno_grupo(alumno,grupo) values(71, 2);
Insert into alumno_grupo(alumno,grupo) values(72, 5);
Insert into alumno_grupo(alumno,grupo) values(73, 1);
Insert into alumno_grupo(alumno,grupo) values(74, 2);
Insert into alumno_grupo(alumno,grupo) values(75, 4);
Insert into alumno_grupo(alumno,grupo) values(76, 2);
Insert into alumno_grupo(alumno,grupo) values(77, 4);
Insert into alumno_grupo(alumno,grupo) values(78, 4);
Insert into alumno_grupo(alumno,grupo) values(79, 3);
Insert into alumno_grupo(alumno,grupo) values(80, 4);
Insert into alumno_grupo(alumno,grupo) values(81, 5);
Insert into alumno_grupo(alumno,grupo) values(82, 2);
Insert into alumno_grupo(alumno,grupo) values(83, 3);
Insert into alumno_grupo(alumno,grupo) values(84, 4);
Insert into alumno_grupo(alumno,grupo) values(85, 4);
Insert into alumno_grupo(alumno,grupo) values(86, 2);
Insert into alumno_grupo(alumno,grupo) values(87, 1);
Insert into alumno_grupo(alumno,grupo) values(88, 3);
Insert into alumno_grupo(alumno,grupo) values(89, 5);
Insert into alumno_grupo(alumno,grupo) values(90, 1);
Insert into alumno_grupo(alumno,grupo) values(91, 4);
Insert into alumno_grupo(alumno,grupo) values(92, 3);
Insert into alumno_grupo(alumno,grupo) values(93, 4);
Insert into alumno_grupo(alumno,grupo) values(94, 2);
Insert into alumno_grupo(alumno,grupo) values(95, 2);
Insert into alumno_grupo(alumno,grupo) values(96, 5);
Insert into alumno_grupo(alumno,grupo) values(97, 2);
Insert into alumno_grupo(alumno,grupo) values(98, 1);
Insert into alumno_grupo(alumno,grupo) values(99, 1);
Insert into alumno_grupo(alumno,grupo) values(100, 5);
Insert into alumno_grupo(alumno,grupo) values(101, 1);
Insert into alumno_grupo(alumno,grupo) values(102, 2);
Insert into alumno_grupo(alumno,grupo) values(103, 1);
Insert into alumno_grupo(alumno,grupo) values(104, 2);
Insert into alumno_grupo(alumno,grupo) values(105, 2);
Insert into alumno_grupo(alumno,grupo) values(106, 3);
Insert into alumno_grupo(alumno,grupo) values(107, 4);
Insert into alumno_grupo(alumno,grupo) values(108, 2);
Insert into alumno_grupo(alumno,grupo) values(109, 4);
Insert into alumno_grupo(alumno,grupo) values(110, 1);
Insert into alumno_grupo(alumno,grupo) values(111, 1);
Insert into alumno_grupo(alumno,grupo) values(112, 5);
Insert into alumno_grupo(alumno,grupo) values(113, 1);
Insert into alumno_grupo (alumno,grupo) values(114, 4);


Insert into alumno_grupo (alumno,grupo) values(115, 5);
Insert into alumno_grupo (alumno,grupo) values(116, 2);
Insert into alumno_grupo (alumno,grupo) values(117, 4);
Insert into alumno_grupo (alumno,grupo) values(118, 5);
Insert into alumno_grupo (alumno,grupo) values(119, 1);
Insert into alumno_grupo (alumno,grupo) values(120, 3);
Insert into alumno_grupo (alumno,grupo) values(121, 2);

Insert into alumno_grupo (alumno,grupo) values(122, 2);
Insert into alumno_grupo (alumno,grupo) values(123, 2);
Insert into alumno_grupo (alumno,grupo) values(124, 1);
Insert into alumno_grupo (alumno,grupo) values(125, 3);
Insert into alumno_grupo (alumno,grupo) values(126, 4);
Insert into alumno_grupo (alumno,grupo) values(127, 4);
Insert into alumno_grupo (alumno,grupo) values(128, 5);
Insert into alumno_grupo (alumno,grupo) values(129, 3);
Insert into alumno_grupo (alumno,grupo) values(130, 4);

Insert into alumno_grupo (alumno,grupo) values(131, 5);
Insert into alumno_grupo (alumno,grupo) values(132, 3);
Insert into alumno_grupo (alumno,grupo) values(133, 5);
Insert into alumno_grupo (alumno,grupo) values(134, 2);
Insert into alumno_grupo (alumno,grupo) values(135, 3);
Insert into alumno_grupo (alumno,grupo) values(136, 4);
Insert into alumno_grupo (alumno,grupo) values(137, 1);
Insert into alumno_grupo (alumno,grupo) values(138, 1);
Insert into alumno_grupo (alumno,grupo) values(139, 5);
Insert into alumno_grupo (alumno,grupo) values(140, 1);

Insert into alumno_grupo (alumno,grupo) values(141, 5);
Insert into alumno_grupo (alumno,grupo) values(142, 1);
Insert into alumno_grupo (alumno,grupo) values(143, 1);
Insert into alumno_grupo (alumno,grupo) values(144, 5);
Insert into alumno_grupo (alumno,grupo) values(145, 2);
Insert into alumno_grupo (alumno,grupo) values(146, 1);
Insert into alumno_grupo (alumno,grupo) values(147, 4);
Insert into alumno_grupo (alumno,grupo) values(148, 3);
Insert into alumno_grupo (alumno,grupo) values(149, 5);
Insert into alumno_grupo (alumno,grupo) values(150, 1);

-- Insert certificado

Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,2,1);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,2,2);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,5,3);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,4,4);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,4,5);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,4,6);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,5,7);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,8);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,4,9);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,2,10);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,3,11);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,5,12);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,1,13);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 9.25,5,14);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 9.25,5,15);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 9.25,5,16);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,3,17);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,5,18);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,4,19);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,5,20);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,3,21);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,2,22);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,3,23);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,5,24);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,4,25);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,2,26);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,4,27);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,4,28);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,3,29);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,2,30);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,5,31);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,3,32);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,1,33);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,3,34);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,2,35);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,2,36);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,1,37);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.75,4,38);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6,2,39);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.5,1,40);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6,5,41);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,3,42);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,2,43);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,2,44);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,4,45);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,46);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,1,47);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,48);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,5,49);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,4,50);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,4,51);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,3,52);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,3,53);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,1,54);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,55);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,3,56);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,57);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,4,58);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,5,59);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,5,60);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,2,61);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,1,62);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,1,63);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,1,64);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,1,65);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,3,66);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,1,67);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,3,68);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,5,69);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,3,70);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,2,71);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,5,72);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,1,73);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,2,74);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,4,75);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,2,76);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,4,77);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,4,78);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,3,79);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,4,80);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,5,81);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,2,82);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,3,83);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6,4,84);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,4,85);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,2,86);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,1,87);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,3,88);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,5,89);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,1,90);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 9,4,91);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,3,92);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,4,93);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,2,94);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,2,95);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,5,96);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,2,97);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.75,1,98);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.75,1,99);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,5,100);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,1,101);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,2,102);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,1,103);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,2,104);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,2,105);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.75,3,106);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.5,4,107);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6,2,108);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.75,4,109);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,1,110);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,1,111);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,5,112);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,1,113);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,4,114);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,5,115);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,2,116);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,4,117);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,5,118);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,1,119);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,3,120);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,2,121);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,2,122);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,2,123);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,1,124);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,3,125);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,4,126);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,4,127);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,5,128);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,3,129);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,4,130);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.5,5,131);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,3,132);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,5,133);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.25,2,134);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 5.5,3,135);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6,4,136);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,1,137);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,1,138);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,5,139);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.5,1,140);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,5,141);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,1,142);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 6.5,1,143);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7,5,144);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.25,2,145);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 7.75,1,146);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.75,4,147);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,3,148);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8,5,149);
Insert into certificado(fecha,promedio,curso,alumno) values('2021-6-1', 8.25,1,150);

-- Inserts Calificacionesc
Insert into calificacion (calificacion,fecha,alumno, Grupo, Tema) values(9, '2020-11-15',1,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-26',1,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-28',1,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-29',1,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-29',2,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-18',2,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-23',2,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-18',2,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-30',3,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',3,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-22',3,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-30',4,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-27',4,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-21',4,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-23',4,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',4,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-27',5,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-30',5,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-28',5,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-15',5,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-23',5,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-29',6,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-24',6,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',6,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-18',6,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-21',6,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-18',7,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-29',7,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-20',7,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-16',8,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-28',8,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-24',8,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-19',8,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-25',9,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-27',9,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-24',9,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-29',9,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-24',9,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-20',10,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',10,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-26',10,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-31',10,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-17',11,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-28',11,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-24',11,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-24',11,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-29',12,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-18',12,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-19',12,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-30',13,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-27',13,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-31',13,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-31',14,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-19',14,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-23',14,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-17',15,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-24',15,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-24',15,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-20',16,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-15',16,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-16',16,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',17,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-15',17,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-24',17,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-20',17,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-19',18,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-23',18,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-23',18,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-29',19,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-24',19,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',19,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-28',19,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-20',19,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-23',20,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-22',20,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-19',20,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-19',21,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-23',21,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-24',21,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-28',21,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-27',22,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',22,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-16',22,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-21',22,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-28',23,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-19',23,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-27',23,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-29',23,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-17',24,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-16',24,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-15',24,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-21',25,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',25,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-22',25,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-30',25,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-15',25,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-20',26,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-16',26,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-31',26,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-20',26,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-29',27,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-17',27,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-24',27,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-18',27,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-28',27,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-21',28,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-19',28,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-29',28,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-24',28,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-27',28,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-27',29,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-25',29,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-16',29,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-20',29,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-24',30,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-25',30,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-15',30,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',30,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-27',31,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-28',31,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-28',31,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-21',32,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-24',32,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-28',32,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-19',32,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-17',33,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-28',33,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',33,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',34,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-28',34,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-20',34,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-31',34,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-22',35,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-21',35,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-30',35,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-25',35,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',36,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-19',36,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-21',36,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',36,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-24',37,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-31',37,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-15',37,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-16',38,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-15',38,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',38,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',38,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-28',38,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-18',39,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-29',39,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-29',39,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-18',39,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',40,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-20',40,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-30',40,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-27',41,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-25',41,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-19',41,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-19',42,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-24',42,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-19',42,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-26',42,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-20',43,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-30',43,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-29',43,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-19',43,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-19',44,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-31',44,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-24',44,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-27',44,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-20',45,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-18',45,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-23',45,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-19',45,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-28',45,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-17',46,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-27',46,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-22',46,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-24',46,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-19',47,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',47,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-22',47,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-25',48,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-26',48,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-22',48,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-26',48,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-20',49,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-31',49,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-29',49,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-18',50,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-23',50,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',50,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-27',50,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-20',50,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',51,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-16',51,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-26',51,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-17',51,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-18',51,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-25',52,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-28',52,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',52,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-26',52,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',53,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-31',53,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-18',53,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-31',53,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-30',54,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-20',54,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-19',54,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-24',55,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-15',55,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-22',55,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-25',55,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-24',56,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-17',56,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-28',56,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-25',56,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-17',57,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-15',57,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-29',57,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-23',57,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-31',58,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-20',58,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-17',58,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-24',58,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-17',58,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-30',59,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-24',59,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-23',59,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-30',60,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-18',60,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-24',60,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-16',61,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',61,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-16',61,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-26',61,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-28',62,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-21',62,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-20',62,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-21',63,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',63,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-27',63,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-23',64,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',64,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-25',64,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-21',65,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-15',65,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-29',65,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',66,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-31',66,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-26',66,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-26',66,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-19',67,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-29',67,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-15',67,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-16',68,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-31',68,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-30',68,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-22',68,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-23',69,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-30',69,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-26',69,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-28',70,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-16',70,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-18',70,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-28',70,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-21',71,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-29',71,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-21',71,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-21',71,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-16',72,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-24',72,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-23',72,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',73,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-27',73,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-25',73,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-19',74,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-28',74,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-18',74,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-20',74,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-31',75,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-21',75,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-23',75,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-20',75,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-30',75,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-25',76,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-23',76,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-19',76,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-22',76,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-20',77,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-18',77,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',77,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-19',77,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',77,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-31',78,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-25',78,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-21',78,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-17',78,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-29',78,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-28',79,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-29',79,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-22',79,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-16',79,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-30',80,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-31',80,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-24',80,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-21',80,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-28',80,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-19',81,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-29',81,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-30',81,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',82,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-25',82,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-23',82,2,37);


Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-25',82,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-17',83,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-27',83,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-22',83,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-31',83,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-22',84,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-21',84,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-24',84,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-22',84,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-25',84,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-26',85,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-18',85,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-27',85,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',85,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-22',85,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',86,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-24',86,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-23',86,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-27',86,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-23',87,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-17',87,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-27',87,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-28',88,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-20',88,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-25',88,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-31',88,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-31',89,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-25',89,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-30',89,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-22',90,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-18',90,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-22',90,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-26',91,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-21',91,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-15',91,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-30',91,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-27',91,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',92,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-29',92,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-15',92,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-30',92,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-28',93,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',93,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-30',93,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-27',93,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-18',93,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-21',94,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-15',94,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-21',94,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-17',94,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-15',95,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-25',95,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-16',95,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-27',95,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-25',96,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-21',96,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-23',96,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-24',97,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-25',97,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-24',97,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',97,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-22',98,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',98,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-28',98,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-16',99,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-26',99,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-18',99,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-24',100,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-18',100,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-15',100,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-19',101,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-19',101,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-18',101,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-30',102,2,35);

Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-16',102,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-26',102,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-16',102,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-31',103,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-25',103,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-19',103,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-29',104,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-23',104,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-18',104,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-24',104,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-27',105,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-31',105,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-18',105,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-18',105,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-23',106,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-28',106,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',106,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-20',106,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-15',107,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-26',107,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-26',107,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-22',107,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-15',107,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-26',108,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-29',108,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-16',108,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-27',108,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-23',109,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-31',109,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-29',109,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-22',109,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-15',109,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-30',110,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-19',110,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-22',110,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-19',111,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-28',111,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-18',111,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-15',112,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-24',112,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-26',112,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-15',113,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',113,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-31',113,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-21',114,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-31',114,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-15',114,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-21',114,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-16',114,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-29',115,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-23',115,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-28',115,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-18',116,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-12-24',116,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-18',116,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-21',116,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-25',117,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-21',117,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-31',117,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-31',117,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-26',117,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-15',118,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-25',118,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-30',118,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-28',119,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-31',119,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-17',119,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-27',120,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-17',120,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-24',120,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-12-31',120,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-17',121,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-16',121,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-27',121,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-21',121,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-23',122,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-17',122,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-17',122,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',122,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-27',123,2,35);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-27',123,2,36);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-11-21',123,2,37);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-18',123,2,38);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',124,1,1);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-20',124,1,2);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-28',124,1,3);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-20',125,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-31',125,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-19',125,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(6, '2020-12-25',125,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-23',126,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-15',126,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-29',126,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-29',126,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-23',126,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-23',127,4,20);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-11-26',127,4,21);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-11-26',127,4,22);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(8, '2020-11-18',127,4,23);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-12-18',127,4,24);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',128,5,32);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(10, '2020-12-31',128,5,33);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-21',128,5,34);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(9, '2020-12-20',129,3,28);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-17',129,3,29);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-20',129,3,30);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(7, '2020-11-26',129,3,31);
Insert into calificacion (calificacion,fecha,alumno, grupo, tema) values(5, '2020-11-17',130,4,20);
Insert into calificacion (calificacion,fecha, alumno, grupo ,tema) values(6, '2020-12-26',130,4,21);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-12-29',130,4,22);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-26',130,4,23);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-28',130,4,24);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-16',131,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-26',131,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-31',131,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-18',132,3,28);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-25',132,3,29);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-12-17',132,3,30);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-12-25',132,3,31);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-12-16',133,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-29',133,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-11-31',133,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-17',134,2,35);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-19',134,2,36);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-27',134,2,37);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-16',134,2,38);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-12-23',135,3,28);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-11-19',135,3,29);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-11-31',135,3,30);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-11-29',135,3,31);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-18',136,4,20);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-11-15',136,4,21);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-29',136,4,22);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-11-23',136,4,23);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-28',136,4,24);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-15',137,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-16',137,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-22',137,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-24',138,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-11-25',138,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-23',138,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-27',139,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-19',139,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-22',139,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-31',140,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-25',140,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-12-20',140,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-20',141,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-11-27',141,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-11-16',141,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-22',142,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-23',142,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-11-26',142,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-18',143,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-16',143,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-12-27',143,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-18',144,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-21',144,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-12-15',144,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-16',145,2,35);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-12-25',145,2,36);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-28',145,2,37);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-11-24',145,2,38);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-12-29',146,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(8, '2020-11-27',146,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-18',146,1,3);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-11-24',147,4,20);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-22',147,4,21);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(10, '2020-12-29',147,4,22);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-28',147,4,23);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-26',147,4,24);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-24',148,3,28);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-12-19',148,3,29);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(9, '2020-12-17',148,3,30);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-11-23',148,3,31);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-12-31',149,5,32);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-12-17',149,5,33);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(7, '2020-11-26',149,5,34);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-22',150,1,1);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(6, '2020-12-22',150,1,2);
Insert into calificacion (calificacion,fecha,alumno,grupo,tema) values(5, '2020-11-20',150,1,3);

---procedure stores

--info del grupo
DELIMITER $$
create PROCEDURE InfoGrupoProcedure (
      IN idCurso integer
     )

begin

select c.nombre as Nombre_Curso, cat.nombre as Categoria, c.costo as Costo, c.no_hrs as Duracion, c.descripcion as Descripcion
, g.nombre as Grupo, g.fecha_inicio, g.fecha_fin, g.disponibilidad as No_Estudiantes, 
concat (m.nombre,' ',m.ApellidoP, ' ', m.ApellidoM) as Maestro
 from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where c.codigo=idCurso;

end $$
DELIMITER;


--info del curso
 DELIMITER $$
create PROCEDURE InfoCursosMaster(
      IN idMaestro integer
     )

begin

select g.codigo as codigo_curso, c.nombre as Nombre_Curso, cat.nombre as Categoria, c.no_hrs as Duracion, c.descripcion as Descripcion
, g.nombre as Grupo, g.fecha_inicio as fechaIn, g.fecha_fin as fechaFn, g.disponibilidad as No_Estudiantes
 from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where m.codigo=idMaestro;


end $$
DELIMITER; 

drop procedure InfoCursosMaster;

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




 /* actualizacion */
UPDATE curso SET imagen='ing1.jpg' WHERE codigo = 1;
UPDATE curso SET imagen='ing1.jpg' WHERE  curso.codigo = 2;
UPDATE curso SET imagen='pyton.jpg' WHERE codigo = 3;
UPDATE curso SET imagen='curhtml.jpeg' WHERE codigo = 4;
UPDATE curso SET imagen='java.jpg' WHERE codigo = 5;
UPDATE curso SET imagen='finanzas.jpg' WHERE codigo = 6;
UPDATE curso SET imagen='ilu.jpg' WHERE codigo = 7;
UPDATE curso SET imagen='cur.png' WHERE codigo = 8;
UPDATE curso SET imagen='fin.png' WHERE codigo = 9;
UPDATE curso SET imagen='log.png' WHERE codigo = 10;
UPDATE curso SET imagen='dat.jpeg' WHERE codigo = 11;
UPDATE curso SET imagen='py.jpg' WHERE codigo = 12;



UPDATE curso SET imagen= 'xd.jpg' WHERE codigo = 13;
UPDATE curso SET imagen= 'xx.jpg' WHERE codigo = 14;
UPDATE curso SET imagen= 'xx.jpg' WHERE codigo = 15;
UPDATE curso SET imagen= 'ht.png' WHERE codigo = 16;
UPDATE curso SET imagen= 'll.jpeg' WHERE codigo = 17;
UPDATE curso SET imagen= 'finanzas.jpg' WHERE codigo= 18;
UPDATE curso SET imagen= 'zz.jpeg' WHERE codigo = 19;
UPDATE curso SET imagen= 'aa.jpg' WHERE codigo = 20;
UPDATE curso SET imagen= 'qq.jpeg' WHERE codigo = 21;
UPDATE curso SET imagen= 'ww.jpeg' WHERE codigo = 22;