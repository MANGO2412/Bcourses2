<?php
  include('src/logic/session.php');
  
  if($menuStundent){
?>
  <!-- menu de usuario -->
   <header class="menuUser">
        <!-- nombre y logo del sitio web -->
        <section class ="seccion1">
         <img class = "img00" src = "src/img/logo1.png"> 
        </section>
        <!-- buscador -->
        <section class="busq2"> 
          <form action=""><input class="busqueda" type="text" name="Nombre Completo" id="nombres" placeholder="Que curso quieres buscar?"></form>
        </section>

        <!-- el boton para desplegar el menu -->
         <button class="menu-toggle" aria-label="Menu toggle button">
            <span class="hamburger"></span>
         </button>
         <!-- menu -->
        <nav class="nav">
            <ul>
                <li>
                    <ul>
                        <li><img src="src/img/alumnos/estudent.jpeg"></li>
                        <li>Gomez Perez Manuel</li>
                    </ul>
                </li> 
                <li><a href="home.php">Inicio</a></li>
                <li><a href="home.php?menu=mi_pago">pagos</a></li>
                <li><a href="home.php?menu=mis_cursos">Mis cursos</a></li>
                <li><a href="home.php?menu=configurar">configurar cuenta</a></li>
                <li><a href="src/logic/server.php?activity=logout">cerrar sesion</a></li>
            </ul>
        </nav>
    </header>
<?php

  }else{
?>
    <!-- menu sin login -->
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