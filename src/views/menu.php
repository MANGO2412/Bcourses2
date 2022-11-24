<?php
  include('src/logic/session.php');
  
  if($menuStundent){
?>
  <header>
    <h1><?=$use?></h1>
    <nav>
      <ul>
        <li><a href="src/logic/server.php?activity=logout">salir</a> </li>
      </ul>
    </nav>
  </header>

<?php

  }else{
?>
    <header class="menu">
        <section class ="seccion1">
         <img class = "img00" src = "src/img/logo1.png"> 
        </section>

        <section class="busq"> 
          <form action=""><input class="busqueda" type="text" name="Nombre Completo" id="nombres" placeholder="Que curso quieres buscar?"></form>
        </section>

        <!-- <button class="menu-toggle" aria-label="Menu toggle button">
            <span class="hamburger"></span>
        </button> -->
        <nav>
          <ul class="botones">
            <li><a href="iniciarsesion.php">Inicia Sesion</a></li>
            <li><a href="registrate.php">Registrate</a></li>
         </ul>
      </nav>
   </header>

<?php

  }

?>