<?php
   include('src/logic/session.php');
  
   if($menuStundent==false){
     header('location: index.php');
   }

?>

<!DOCTYPE html>
<html>
   <head>
     <link rel="stylesheet" href="trash/EstilosCategoria.css" type="text/css"/>
     <title>Categorias</title> 
    </head>
    <body>
    <!-- header -->
    <header>
       
        <section class ="seccion1">
         <img class = "img00" src = "../src/img/logo1.png"> 
         <input class="boton2" type="submit" value="iniciar secion">
         <input class="boton3" type="submit" value="Registrate">
           
    </section>
    
    

    <section class="busq"> 
    <input class="busqueda" type="text" name="Nombre Completo" id="nombres" placeholder="Que curso quieres buscar?">
</section>

<button class="menu-toggle" aria-label="Menu toggle button">
    <span class="hamburger"></span>
 </button>



 </header>
<!-- fin header -->
    <br>
    <nav>
    <a href="src/logic/server.php?activity=logout">salir</a> 
        <section class= "botonG">
        <input class = "boton" type="submit" value ="alimentacion">
        <input class = "boton" type="submit" value ="Robotica">
        <input class = "boton" type="submit" value ="Arquitrectura">
        <input class = "boton" type="submit" value ="Arte y cinema">
        <input class = "boton" type="submit" value ="Ciencia">
        <input class = "boton" type="submit" value ="Economia">
        <input class = "boton" type="submit" value ="Computacion">
        <input class = "boton" type="submit" value ="Analisis de datos">
    </section>
    </nav>
    <br>
    <hr>
    <br>
    <h3 class = "Curso1">Cursos disponibles</h3>

    <section class="curso">
        <h1 class="titulo"></h1>
        <article class = "curso2">
        <img class = "img0" src = "../src/img/Estudio.jpg">
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
    </section>



</body>

</html>