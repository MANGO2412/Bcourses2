<?php

  
if($menu_accion_user=="c_asignado" && $menuMaestro){
  $mymaster = new maestro();
  $dataset=$mymaster->getOwnCourses($_SESSION['id_maestro']);

  if($dataset){
    
     while($row=mysqli_fetch_array($dataset)){
?>
    <!-- estrucutra html para ver info del cuurso -->
<div class="tarjeta">
			<!-- primera modificacion ques es el de la imgen junto con los nombres de los curos y el nombre de la zorra del profesor que ese va a ser el mismo xd junto con la -->
			<div class="cabecera" style="background: url(src/img/cursos/default.png);background-repeat: no-repeat;-webkit-background-size: cover;background-size: cover;">
				<a class="parte1" href="src/views/cursos_calificacion.php?maester=<?=$_SESSION['id_maestro']?>">
				<div class="titulo"><?=$row['Nombre_Curso']?></div>				
				</a>
				<!-- <div class="nombre">RAUL EDUARDO ALMORA HERNANDEZ </div> -->
			</div>

			<div class="medio">				
				<div class="texto">
					<img class="foto" src="src/img/maestros/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/maestros/defaultuser.png'">
					<h2>Informacion del curso</h2>
           <ul>
            <li>cantidad de estudiantes: <?=$row['No_Estudiantes']?></li>
            <li>fecha de inicio: <?=$row['fechaIn']?> </li>
            <li>fecha fin: <?=$row['fechaFn']?> </li>
           </ul>
					<div class="tareas">
					</div>
				</div>
	</div>


<?php
     }
   }else{

    echo "no tienes conexion";
  }
}else{
?>
<!-- estrucutra html para ver info del cuurso -->
<p>vista cuenta</p>



<p><?=$menu_accion_user?></p>
<section>
   <!-- obtener info del alumno y motrarlo -->
   <?php
    $myMaster = new maestro();

    $dataset=$myMaster->get($_SESSION['id_maestro']);
    if($dataset){
        $row=mysqli_fetch_assoc($dataset);
    }
   ?>
<!-- 
   <img src="src/img/alumnos/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/alumnos/defaultuser.png'">
     informacion del usuario 
   <ul>
    <li>Nombre:<?=$row['ApellidoP'].' '.$row['ApellidoM'].' '.$row['nombre']?></li>
    <li>Correo:<?=$_SESSION['email']?></li>
    <li>Numero de telefono:<?=$row['n_celular']?></li>
    <li>fecha de registro:<?=$_SESSION['creacion']?></li>
   </ul>
   <button id="edit">cambiar cuenta</button> -->

    <!-- info del usuario -->
   <section id="dividida1">
    <div class = izq1>
        <div class="tarjetalum"><img class="imgalum" src="src/img/maestros/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/alumnos/defaultuser.png'">
        <p class="Nomb1"><?=$row['ApellidoP'].' '.$row['ApellidoM'].' '.$row['nombre']?></p>
        <!-- <p class="Nomb1">Maestro</p> -->
    </div>
  </div>
  <div class = der1>
    <div class="infousu">
        <ul class="botonesa">
        <p2 class="infous">Informacion del Usuario</p2>
        <li><button class="botoninfo" id="edit">cambiar cuenta</button></li>
        <!-- <li><a class="botoninfo" href="....">Cambiar Informacion</a></li>

        </ul> -->
    </div>
    <div class="infodelusu">
    <ul>
        <br>
        <li class="info">Nombre:<?=$row['nombre']?></li>
        <br>
        <li class="info">Apellido:<?=$row['ApellidoP'].' '.$row['ApellidoM']?> </li>
        <br>
        <li class="info">Numero Telefonico:<?=$row['n_celular']?></li>
        <br>
        <li class="info">Correo Electronico:<?=$_SESSION['email']?></li>
        
    </ul>
    <!-- </div>
        <br>
        <p2 class="infous">certificados</p2>
        <div class="certificado">
            <ul class="botonesalu">
              <li class="xdd"> <a href="xd"> Programacion Orientada a objetos</a></li>
            </ul>
        </div> -->

		<!-- formualrio escondido -->
		<div class="ventana" id="formdata">
   <form  action="src/logic/server.php?activity=updateMaster&&tip=maestro" method="post" enctype="multipart/form-data">
     <h1>cambiar informacion de la cuenta</h1>
     <!-- id del alumno -->
     <input type="text" hidden name="id"  value="<?=$row['codigo']?>">

     <label for="">nombre</label>
     <input type="text" name="nombre" value="<?=$row['nombre']?>">

     <label for="">apellido paterno</label>
     <input type="text" name="apellP" value="<?=$row['ApellidoP']?>">

     <label for="">apellido materno</label>
     <input type="text" name="apellM" value="<?=$row['ApellidoM']?>">

     <label for="">numero de telefono</label>
     <input type="text" name="cel" value="<?=$row['n_celular']?>">
     <!-- imagen de la foto -->
     <input type="text" hidden name="imageOld" value="<?=$row['foto']?>">

     <label for="">imagen</label>
     <input type="file" name="imageNew">


     <input id="save" type="submit" value="gurdar">
     <input id="cancel" type="submit" value="cancelar">
   </form>
   </div>

  </div>




<?php
 }
?>