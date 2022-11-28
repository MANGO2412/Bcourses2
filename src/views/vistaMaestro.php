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
					<img class="foto" src="src/img/alumnos/estudent.jpeg" alt="">
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
<?php
 }
?>