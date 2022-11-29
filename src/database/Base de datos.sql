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
    	costo  decimal(10,2) not null, 
    	imagen char(100) null, 
	    no_hrs integer not null, 
    	descripcion text(500) not null,
    	categoria integer, 
    	constraint fk_curso foreign key(categoria) references categoria(codigo) on delete cascade on update cascade
);



--tabla de temas
create table temas(
   	codigo integer primary key auto_increment, 
   	titulo char(100) not null, 
	descripcion text(500) not null,  
   	curso integer not null,
   	constraint fk_temas foreign key(curso) references curso(codigo) on delete cascade on update cascade
);




--tabla de cuentas
create table cuenta(
    	codigo integer primary key auto_increment, 
    	correo char(64) not null,
    	contraseña char(72) not null, 
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

--insert cuenar
Insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values('M8Manuel@outlook.com', 'H9Gomez', '2020-4-23', 1, null);
Insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values('L9Gael@hotmail.con', 'M8Breton', '2020-1-25', 2, null);
Insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values('M5Cristian@outlook.com', 'L9Pizano', '2020-3-26', 3, null);
Insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values('L8Luis@hotmail.con', 'M5Dominguez', '2020-2-5', 4, null);
Insert into cuenta(correo,contraseña,fecha_creacion,maestro,alumno) values('D7Carlos@outlook.com', 'L8Guzman', '2020-2-11', 5, null);

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
Insert into curso(nombre,costo, imagen, No_Hrs, Descripcion, Categoria) values('Curso online de Introducción a Adobe Photoshop CC2020', 450, 'adobephotoshop1.jpg', 8, 'El curso de introducción a Photoshop nos enseñará cómo personalizar los paneles y la caja de herramientas básicas de Photoshop para optimizar tu espacio de trabajo. Aprenderás a usar shortcuts, cómo usar las herramientas de retoque, selección y recorte, así como el manejo de capas y la herramienta más importante y útil de Photoshop, la herramienta pluma. El camino del diseño y el retoque fotográfico es largo pero divertido y este es un gran lugar para iniciar.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, Descripcion, Categoria) values('Introducción a Matemáticas para Finanzas y Negocios', 500, '', 8, 'El objetivo del curso es entender como ciertos conceptos matemáticos se utilizan de forma recurrente para analizar problemas financieros y de negocios.',5);
Insert into curso(nombre,costo, imagen, No_Hrs, Descripcion, Categoria) values('Curso online de Diseño de logotipos desde cero', 185, 'diseñoiconoscurso.jpg', 5, 'En éste curso aprenderás el proceso completo de cómo construir un logotipo, desde la definición del significado y valor de la marca, hasta el proceso creativo y práctico para desarrollarlo en Adobe Illustrator. Desarrollarás una identidad gráfica y aplicaciones que expresen la personalidad de la marca.',3);
Insert into curso(nombre,costo, imagen, No_Hrs, Descripcion, Categoria) values('Herramientas para el Análisis de Big Data', 200, 'cursos11.png', 4, 'Conoce las herramientas para el procesamiento, modelación, análisis, almacenamiento y acceso de los datos. Aprende en este curso online los beneficios del cómputo en la nube para los proyectos de ciencia de datos en las organizaciones y conoce las herramientas más populares.',4);
Insert into curso(nombre,costo, imagen, No_Hrs, Descripcion, Categoria) values('Ciencia de datos con Python', 200, 'curso12.pgn', 6, 'Comprender los conceptos básicos del lenguaje Python y cómo se aplican a la ciencia de datos',4);


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
Insert into temas(titulo,descripcion,curso) values('Gramatica Inglesa:los verbos y tiempos verbales', 'Introducción al Curso de Inglés Básico, Los Sustantivos, su plural y ejemplos en el idioma inglés, Los Artículos básicos en inglés,Adjetivos, concepto y lista de los más comunes en inglés, verbos en inglés, uso del infinitivo y ejemplos comunes, las preposiciones esenciales en la lengua inglesa. Pronombres personales, objetivos y reflexivos en inglés, posesivos: Adjetivos, pronombres e indicar propiedad. Los demostrativos en inglés: Pronombres y adjetivos
El alfabeto y los colores en el idioma Inglés, los Números en Inglés: Cardinales y Ordinales, días de la semana, Meses y estaciones del año en inglés, uso de Much, Many y a Lot of, Ejemplos, el uso de Little y Few, donde utilizarlos
Vocabulario.',1);
Insert into temas (titulo,descripcion,curso) values('Estructuras Gramaticales y Oraciones', 'Presente Simple: Oraciones afirmativas y negativas
Preguntas personales en presente simple usando ḋdoṠ y ḋdoesṠ
Adverbios de frecuencia: always, usually, sometimes & never
El presente continuo y reglas del verbo en gerundio ḋ-ingṠ
Pasado simple de ḋbeṠ: Oraciones con Was / Were
Comparativos en inglés: Reglas de adjetivos y oraciones
Preguntas de Personalidad / Apariencia ḋBe likeṠ & ḋLook likeṠ',1);
Insert into temas(titulo,descripcion,curso) values('Inglés Alto: Enfoque Práctico', 'Expresar acuerdo y desacuerdo con otras personas en inglés
Uso de adjetivos -ing y -ed para describir emociones y sus causas
Presente Perfecto, usos y ejemplos en oraciones / preguntas
Reglas para formar adjetivos superlativos y cómo comparar con ellos
Ejemplos con las clausulas adverbiales: before, after y when
Diferencia entre el uso de las palabras should y have to en inglés
Como usar too / not enough y too many / too much
Clausulas relativas de sujeto. ',1);
Insert into temas(titulo,descripcion,curso) values('Inglés Avanzado: Enfoque Conversacional', 'El presente perfecto continuo; diferencia entre ḋSinceṠ y ḋForṠ
Preguntas Indirectas en Inglés ṡCómo se forman y para qué se usan?
La voz pasiva en inglés, estructuración de oraciones y ejemplos
Clausulas relativas de sujeto y objeto. Usos comunes.
Infinitivos y Gerundios para expresar un propósito o intención
El Pasado Perfecto. Estructura, usos y ejemplos básicos
Causativos en inglés con las palabras ḋHaveṠ y ḋGetṠ. Ejemplos
Segundo condicional en inglés (Tipo II).',1);
Insert into temas(titulo,descripcion,curso) values('conceptos basicos de python para data science', 'Este curso de Python proporciona una introducción para principiantes a Python a la ciencia de datos. Practica a través de ejercicios de laboratorio, Ḃy estarás listo para crear tus primeros scripts de Python por tu cuenta!',12);
Insert into temas(titulo,descripcion,curso) values('analizando datos con python', 'En este curso aprenderás cómo analizar datos en Python usando matrices multidimensionales en numpy, a manipular DataFrames en pandas, a usar la biblioteca SciPy de rutinas matemáticas y a realizar aprendizaje automático usando scikit-learn.',12);
Insert into temas(titulo,descripcion,curso) values('visuslizando datos con python', 'La visualización de datos es la representación gráfica de los datos para transmitir de manera interactiva y eficiente las ideas a los clientes y partes interesadas en general.',12);
Insert into temas(titulo,descripcion,curso) values('Meachine Learning con python', 'El Machine Learning puede ser una herramienta increíblemente beneficiosa para descubrir información y predecir tendencias futuras. Este curso de aprendizaje automático con Python te brindará todas las herramientas que necesitas para comenzar con el aprendizaje supervisado y autónomo.',12);

Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,Curso) values('Curso online de Adobe Photoshop', null, '2020-9-1','2020-12-24', 1,2);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,Curso) values('Ingles', null, '2020-9-1', '2020-12-24', 2,1);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,Curso) values('Curso De Desarrollador - Python', null, '2020-9-1', '2020-12-24', 3,3);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,Curso) values('Curso Desarrollo Web - Aprende HTML y CSS', null, '2020-9-1', '2020-12-24', 4,4);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,Curso) values('Curso Programación - Java', null, '2020-9-1', '2020-12-24', 5,5);



Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Introducción a las finanzas', null, '2022-12-1', '2023-4-3', 1,6);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Curso online de Manejo fundamental de Adobe', null, '2022-12-1', '2023-4-3', 2,7);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Curso online de Introducción a Adobe Photoshop', null, '2022-12-1', '2023-4-3', 3,8);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Introducción a Matemáticas para Finanzas y Negocios', null, '2022-12-1', '2023-5-2', 4,9);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Curso online de Diseño de logotipos', null, '2022-12-1', '2023-4-3', 5,10);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Herramientas para el Análisis de Big Data', null, '2022-12-1', '2023-5-7', 1,11);
Insert into grupo(nombre,horario,fecha_inicio,fecha_fin,maestro,curso) values('Ciencia de datos con Python', null, '2022-12-1', '2023-5-7', 2,12);
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

DELIMITER $$
create PROCEDURE InfoCurso(
      IN idcurso integer
     )

begin

   
select 
   c.codigo as codigo_curso, c.nombre as nombre_curso, cat.nombre as categoria, c.no_hrs as duracion, c.descripcion as descripcion,c.imagen as foto_curso, g.codigo as  grupo, g.fecha_inicio as fechaIn, g.fecha_fin as fechaFn, g.disponibilidad as No_Estudiantes,
   c.costo as costo,concat(m.ApellidoM,' ',m.ApellidoP,' ',m.nombre) as maestro, m.foto as foto
from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where c.codigo=idcurso;

end $$
DELIMITER; 






--llama los triggers
delimiter;
call InfoCurso(1);

delimiter:
call InfoCursosMaster(2);


select 
   c.codigo as codigo_curso, c.nombre as nombre_curso, cat.nombre as categoria, c.no_hrs as duracion, c.descripcion as descripcion,c.imagen as foto_curso, g.codigo as  grupo, g.fecha_inicio as fechaIn, g.fecha_fin as fechaFn, g.disponibilidad as No_Estudiantes,
   c.costo as costo,concat(m.ApellidoM,' ',m.ApellidoP,' ',m.nombre) as maestro, m.foto as foto
from curso as c
 inner join categoria as cat on cat.codigo=c.categoria
 INNER JOIN grupo as g on g.curso=c.codigo
 inner JOIN maestro as m on m.codigo=g.maestro
 where c.codigo=11;