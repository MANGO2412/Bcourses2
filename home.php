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
       <?php 
       include('src/views/menu.php');
       $menu_accion_user=isset($_REQUEST['menu'])?$_REQUEST['menu']:'no existe';
       ?>
      <!-- fin header -->
      <div class="contener">
         <?php 
         if($menuMaestro){
          include('src/views/vistaMaestro.php');
         }else{
          include('src/views/vistaAlumno.php');
         }
         ?>
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


  <script src="src/logic/script.js"></script>
</body>

</html>