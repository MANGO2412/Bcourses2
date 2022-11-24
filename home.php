<!DOCTYPE html>
<html>
   <head>
     <!-- <link rel="stylesheet" href="trash/EstilosCategoria.css" type="text/css"/> -->
     <!-- <link rel="stylesheet" href="src/styles/principal.css"> -->
     <link rel="stylesheet" href="src/styles/home.css">
     <title>Inicio</title> 
    </head>
    <body>
      <!-- header -->
       <?php include('src/views/menu.php')?>
      <!-- fin header -->
      <div class="contener">
          <!--opciones para buscar cursos por categoria  -->
          <section class= "categorias">
              <button class = "boton">alimentacion</button>
              <button class = "boton">Robotica</button>
              <button class = "boton">Arquitrectura</button>
              <button class = "boton">Arte y cinema</button>
              <button class = "boton">Ciencia</button>
              <button class = "boton">Economia</button>
              <button class = "boton">Computacion</button>
              <button class = "boton">Analisis de datos</button>
          </section>
          <!-- fin de este section -->
          <!-- muestra todo los cursos -->
           <section class="view_c">
               <header>cursos disponibles</header>
               <section>
                <!-- los cursos se muestran aqui -->
                  <article class="cursos">
                     <!-- imagen del cursos -->
                     <img src="src/img/Estudio.jpg" alt="">
                     <!-- info del cursos -->
                     <section>
                         <h2 class="titulo_curso">Analisis estadistico con Excel</h2>
                         <p class="descripcion">Para que puedas formarte, a tu disposición se ponen una amplia variedad de cursos 
                     impartidos por Universidades y plataformas de enseñanza online, en los que contarás con todos los materiales y recursos necesarios.</p>
                         <a class="vermas">ver mas del curso</a>
                     </section>
                  </article>


                  <article class="cursos">
                     <!-- imagen del cursos -->
                     <img src="src/img/Estudio.jpg" alt="">
                     <!-- info del cursos -->
                     <section>
                         <h2 class="titulo_curso">Analisis estadistico con Excel</h2>
                         <p class="descripcion">Para que puedas formarte, a tu disposición se ponen una amplia variedad de cursos 
                     impartidos por Universidades y plataformas de enseñanza online, en los que contarás con todos los materiales y recursos necesarios.</p>
                         <a class="vermas">ver mas del curso</a>
                     </section>
                  </article>
               </section>
           </section>
          <!-- fin de esta seccion -->
      </div>
      
      
<!-- 
    <hr>
    
    <h3 class = "Curso1">Cursos disponibles</h3>

    <section class="curso">
        <h1 class="titulo"></h1>
        <article class = "curso2">
        <img class = "img0" src = "src/img/Estudio.jpg">
        </article>





        <aside class="asid1">
            <h1 class="titulo_curso">Analisis estadistico con Excel</h1>
            <article class = "descripcion">Para que puedas formarte, a tu disposición se ponen una amplia variedad de cursos 
                impartidos por Universidades y plataformas de enseñanza online, en los que contarás con todos los materiales y recursos necesarios. 
            </article>

            <article class = "componentes">
                
    
            </article>
            <input class ="vermas" type = "submit" value="Ver mas del curso ">
        </aside>
    </section> -->



</body>

</html>