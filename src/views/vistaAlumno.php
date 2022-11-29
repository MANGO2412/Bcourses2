<?php


if($menu_accion_user=='mis_cursos'){
?>
<p><?=$menu_accion_user?></p>
<?php
}else if($menu_accion_user=='configurar'){
?>
<p><?=$menu_accion_user?></p>
<section>
   <!-- obtener info del alumno y motrarlo -->
   <?php
    $mystudent = new alumno();

    $dataset=$mystudent->get($_SESSION['id_alumno']);
    if($dataset){
        $row=mysqli_fetch_assoc($dataset);
    }
   ?>

   <img src="src/img/alumnos/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/alumnos/defaultuser.png'">
   <!-- informacion del usuario -->
   <ul>
    <li>Nombre:<?=$row['ApellidoP'].' '.$row['ApellidoM'].' '.$row['nombre']?></li>
    <li>Correo:<?=$_SESSION['email']?></li>
    <li>Numero de telefono:<?=$row['n_celular']?></li>
    <li>fecha de registro:<?=$_SESSION['creacion']?></li>
   </ul>
   <button id="edit">cambiar cuenta</button>


   <!-- formualrio escondido -->
   <div class="ventana" id="formdata">
   <form  action="src/logic/server.php?activity=updateStudent" method="post" enctype="multipart/form-data">
     <h1>cambiar informacion de la cuenta</h1>
     <!-- id del alumno -->
     <input type="text" name="id"  value="<?=$row['matricula']?>">

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


   <!-- certificados -->

   <!--  -->
</section>


<?php
}else if($menu_accion_user==="mi_pago"){
?>
 <p><?=$menu_accion_user?></p>
<?php
}else if($menu_accion_user==="curso"){
  include('src/views/curso.php');
?>
  <p><?=$id_curso?></p>

<?php
}else if($menu_accion_user=="realiza_pago" && $menuStundent){
?>

<section>
  <section class = "formulariopago">
  
      <form class="form-register" action="src/logic/server.php?activity=pago" method="post"  enctype="multipart/form-data">
          <h4 class="Pago">Pago </h4>
  
          <input class="controls" type="text" name="name" id="nombres" maxlength="50" placeholder="Nombre" required>
  
  
           <input class="controls" type="text" name="firstN"  id="nombres" maxlength="30" placeholder="Primer apellido" required>
  
  
           <input class="controls" type="text" name="lastN" required id="nombres" maxlength="30"   placeholder="Segundo apellido">
  
          <input  class="controls" type="text" required name="TarjetN"  maxlength="16"  id="Tarjeta" pattern="[0-9]+" placeholder="Numero de tarjeta">
          
          <input class= "controls" type= "text" required name="CVV" maxlength="4" id="CVV" pattern="[0-9]+" placeholder="Codigo de seguridad">
           
          <input type="text" hidden name="alumno" value="<?=$_SESSION['id_alumno']?>">
          <input type="text" hidden name="grupo" value="<?=$_REQUEST['id_grupo']?>" >
          <input type="text" hidden name="monto" value="<?=$_REQUEST['costo']?>">
       
          <article class="expiracion">
              <label>Fecha de expiracion</label>
              <input class = "controls2" type = "text" required name ="mesvenc" maxlenght="2" pattern="[0-9]+" placeholder="MM">
              <input class = "controls2" type = "text" required name ="mesvenc" maxlenght="2" pattern="[0-9]+" placeholder="AA"> 
             </article>
             <input class="boton" type="submit" value="Relizar pago">
      
      </form>
  </section>
</section>

<?php
}else{
?>
  <!--opciones para buscar cursos por categoria  -->
  <section class= "categorias">
               <!-- muestra las categorias -->
               <button id="todos"class ="boton">Todos</button>
               <?php
                 $mycategoria= new categoria();
                 $dataset2=$mycategoria->getAll();

                 if($dataset2){
                    while ($row=mysqli_fetch_array($dataset2)){
               ?>
                 <button id="<?=$row['codigo']?>"class ="boton"><?=$row['nombre']?></button>
              <?php
                 }
                }
              ?>
          </section>
          <!-- fin de este section -->
          <!-- muestra todo los cursos -->
           <section class="view_c">
               <header>cursos disponibles</header>
               <section>
                 <!-- <input type="text" id="luck"> -->
                <!-- <button id="luck">jajajaj</button> -->
                <!-- los cursos se muestran aqui -->
                <?php
                  $allcursos = new curso();

                  if(isset($_REQUEST['category'])){
                    $dataset= $allcursos->getAllCursos($_REQUEST['category']);
                  }else{
                     $dataset= $allcursos->getAllCursos(null);
                  }
                        if($dataset){
                             while ($row=mysqli_fetch_array($dataset)) {
                ?>
                  <article class="cursos">
                     <!-- imagen del cursos -->
                    <img src="img/"  alt="img not found" onerror="this.src='src/img/cursos/default.png'">
                     <!-- info del cursos -->
                     <section>
                         <h2 class="titulo_curso"><?=$row['nombre']?></h2>
                         <p class="descripcion"><?=$row['descripcion']?></p>
                         <a href="home.php?id_curso=<?=$row['codigo']?>&&menu=curso" class="vermas">ver mas del curso</a>

                         <!-- <a href="src/views/curso.php?id_curso=//$row['codigo']" class="vermas">ver mas del curso</a> -->
                     </section>
                  </article>
                <?php
                     }
                   }

                ?>

               </section>
           </section>

          <!-- fin de esta seccion -->
<?php
}
?>
