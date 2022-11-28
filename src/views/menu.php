<?php
  include('src/logic/session.php');
  include_once('src/data/classes.php');
  
  if($menuStundent){
    $myalumno=new alumno();
    $dataset=$myalumno->get($_SESSION['id_alumno']);

    if($dataset){
      $row=mysqli_fetch_array($dataset);
    }
?>
  <!-- menu de usuario -->
   <header id="nav" class="menuUser">
        <!-- nombre y logo del sitio web -->
        <section class ="seccion1">
         <img class = "img00" src = "src/img/imgPage/logo1.png"> 
        </section>
        <!-- buscador -->
        <section class="busq2"> 
          <form action="">
            <input class="busqueda" type="text" name="Nombre Completo" id="luck" placeholder="Que curso quieres buscar?">
          </form>
        </section>

        <!-- el boton para desplegar el menu -->
         <button id="hamburger"  class="menu-toggle" aria-label="Menu toggle button">
            <span class="hamburger"></span>
         </button>
         <!-- menu -->
        <nav class="nav">
            <ul>
                <li>
                    <ul>
                        <li><img src="src/img/alumnos/<?=$row['foto']?>"></li>
                        <li><?=$row['ApellidoP'].' '.$row['ApellidoM'].' '.$row['nombre']?></li>
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
}else if($menuMaestro){
  $mymaster=new maestro();
  $dataset=$mymaster->get($_SESSION['id_maestro']);

  if($dataset){
    $row=mysqli_fetch_array($dataset);
  }

?>
   <!-- menu de usuario -->
   <header id="nav" class="menuUser">
        <!-- nombre y logo del sitio web -->
        <section class ="seccion1">
         <img class = "img00" src = "src/img/logo1.png"> 
        </section>
        <!-- el boton para desplegar el menu -->
         <button id="hamburger" class="menu-toggle" aria-label="Menu toggle button">
            <span class="hamburger"></span>
         </button>
         <!-- menu -->
        <nav class="nav">
            <ul>
                <li>
                    <ul>
                        <li><img src="src/img/alumnos/estudent.jpeg"></li>
                        <li><?=$row['ApellidoP'].' '.$row['ApellidoM'].' '.$row['nombre']?></li>
                    </ul>
                </li> 
                <li><a href="home.php?menu=c_asignado">cursos asignados</a></li>
                <li><a 
                href="home.php?menu=infoCuenta">ver cuenta</a></li>
                <li><a href="src/logic/server.php?activity=logout">cerrar sesion</a></li>
            </ul>
        </nav>
    </header>

<?php

  }else{
?>
    <!-- menu sin login -->
    <header id="nav" class="menu">
        <section class ="seccion1">
         <img class = "img00" src = "src/img/logo1.png"> 
        </section>

        <section class="busq"> 
          <form action=""><input class="busqueda" type="text" name="Nombre Completo" id="luck" placeholder="Que curso quieres buscar?"></form>
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