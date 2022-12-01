

--inserts de la tabla alumno y cuenta
insert into alumno(nombre,apellidoP,apellidoM,foto,N_celular,correo) values('manuel','gomez','perez',' ','6641644270','manuelgom3z22052003@gmail.com');
insert into cuenta(usuario,contraseña,alumno) values('mango','lalalslsl',1);

insert into alumno(nombre,ApellidoP,ApellidoM,foto,n_celular) values("Manuel","GOmez","Perez","","6641234567")
insert into cuenta(correo,contraseña,fecha_creacion,alumno) values("Manuel@gmail.com","12345678","2022-11-21",1)



insert into maestro(nombre,apellidoP,apellidoM,foto,N_celular) values('Angel','Lopez','Breton',' ','6641644270');
insert into cuenta(correo,contraseña,maestro) values('angel@gmail.com','limon123%',1);
--inserts de las categorias
insert into categoria values
('A1','Programacion','son cursos relacionados a los temas mas interesantes del mundo de progamacion'),
('A2','IdIomas','Son cursos relacionados al aprendizaje de los idiomas de english y frances'),
('A3','Diseño Grafico','Son cursos relacionas al aprendizaje de herrmainets, tecnica o conceptos en el mundo del diseño grafico.'),
('A4','Ciencia de datos','Son cursos estudio de datos con el fin de extraer información significativa para empresas. Es un enfoque multidisciplinario que combina principios y prácticas del campo de las matemáticas, la estadística, la inteligencia artificial y la ingeniería de computación'),
('A5','Negocios','Son cursos relacionados al ambito empresarial');

select * from categoria;

--inserts de la tabla cursos
insert into curso values
('c1', 'Ingles',850,' ',200,'Es un curso de 200 horas lectivas a lo largo del cual se trabajan las cinco destrezas principales de la lengua: la expresión oral, la interacción oral, la comprensión auditiva, la comprensión lectora, la expresión escrita. El curso es muy práctico y se exige la participación activa del alumno.','A2'),
('c2', 'Curso online de Adobe Photoshop',299,'adobephotoshop.jpg',12,'En este curso online aprenderás a usar Photoshop: efectos, filtros y más del programa más conocido de diseño. ¡Conoce todas las herramientas hoy!','A3'),
('c3', 'Curso De Desarrollador - Python',799,'Course-Python.png',200,'En este curso de Python aprenderás de forma práctica los conceptos básicos, las mejores técnicas, así como las librerías más populares y herramientas necesarias para programar de forma eficiente con este lenguaje de programación.','A1'),
('c4', 'Curso Desarrollo Web - Aprende HTML y CSS',299,'Course-HTMLxCSS',45,'Aprende HTML y CSS desde cero, sin conocimientos previos. Conoce todo sobre etiquetas HTML, semántica, CSS, como dar estilos a los elementos de tu sitio web, medidas EM/REM, modelo de caja y mucho más. Aprenderás todo lo que necesitas para empezar en el desarrollo web online y a construir sitios para internet de manera eficiente.','A1'),
('c5', 'Curso Programación - Java',249,'',15,'En este curso de Java aprenderás a dominar este lenguaje de programación desde cero a experto, lo cual te permitirá crear aplicaciones de escritorio siguiendo las buenas prácticas de programación en Java.','A1'),
('c6', 'Introducción a las finanzas',500,'finanza.jpg',14,'Este curso en línea te enseñará conceptos claves y herramientas de valor del dinero en el tiempo que te ayudarán a entender las diferentes tasas de interés y a evaluar, comparar y elegir proyectos de inversión y financiamiento en los mercados financieros','A5'), 
('c7', 'Curso online de Manejo fundamental de Adobe Illustrator CC2020',300,'illustratorcurso.jpg',6,'En este curso de Illustrator online conocerás las posibilidades creativas y de diseño que te ofrece el programa, aprenderás cómo usar Illustrator desde lo más básico hasta los tips y maneras para hacer tu proceso creativo más eficiente. El curso de Illustrator te enseñará para qué sirve Illustrator, tips útiles para trabajar de manera eficiente y acercarte a sus herramientas para que conozcas su funcionamiento y puedas ver las posibilidades creativas que este programa ofrece.', 'A3'),
('c8', 'Curso online de Introducción a Adobe Photoshop CC2020',450,'adobephotoshop1.jpg',8,'El curso de introducción a Photoshop nos enseñará cómo personalizar los paneles y la caja de herramientas básicas de Photoshop para optimizar tu espacio de trabajo. Aprenderás a usar shortcuts, cómo usar las herramientas de retoque, selección y recorte, así como el manejo de capas y la herramienta más importante y útil de Photoshop, la herramienta pluma. El camino del diseño y el retoque fotográfico es largo pero divertido y este es un gran lugar para iniciar.','A3'),
('c9', 'Introducción a Matemáticas para Finanzas y Negocios',500,'',8,'El ojetivo del curso es entender como ciertos conceptos matemáticos se utilizan de forma recurrente para analizar problemas financieros y de negocios.',	'A5'), 
('c10', 'Curso online de Diseño de logotipos desde cero',185,'diseñoiconoscurso.jpg',5,'En éste curso aprenderás el proceso completo de cómo construir un logotipo, desde la definición del significado y valor de la marca, hasta el proceso creativo y práctico para desarrollarlo en Adobe Illustrator. Desarrollarás una identidad gráfica y aplicaciones que expresen la personalidad de la marca.','A3');


select * from curso;
