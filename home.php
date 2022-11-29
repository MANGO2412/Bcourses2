<?php
$menu_accion_user=isset($_REQUEST['menu'])?$_REQUEST['menu']:'inicio';

$fondo_pago=isset($_REQUEST['menu'])&&$_REQUEST['menu']=="realiza_pago"?'class="principal"':"class=''";
$id_curso=isset($_REQUEST['id_curso'])?$_REQUEST['id_curso']:'no existe';
?>
<!DOCTYPE html>
<html>
   <head>
     <!-- <link rel="stylesheet" href="trash/EstilosCategoria.css" type="text/css"/> -->
     <!-- <link rel="stylesheet" href="src/styles/principal.css"> -->
     <link rel="stylesheet" href="src/styles/home.css">
     <link rel="stylesheet" href="src/styles/estiloscursopago.css">
     <title><?=$menu_accion_user?></title> 
    </head>
    <body <?=$fondo_pago?>>
      <!-- header -->
       <?php 
       include('src/views/menu.php');
       ?>
      <!-- fin header -->
      <div class="contener">
           <!-- lista de busqueda -->
          <div id="listbusq">
             <button id="close">cerrar</button>
              <div id="list"></div>
          </div>
         <?php 
         if($menuMaestro){
          //todas las vistas para el maestro
          include('src/views/vistaMaestro.php');
         }else{
          //todas las vistas para el usuario y el alumno
          include('src/views/vistaAlumno.php');
         }
         ?>
      </div>
  
     <!-- scripts -->
     <script src="src/logic/scripts/jquery-3.6.1.min.js"></script>
     <script src="src/logic/scripts/main.js"></script>
     <script src="src/logic/scripts/script1.js"></script>   
      <script src="src/logic/scripts/script.js"></script>
  </body>
</html>