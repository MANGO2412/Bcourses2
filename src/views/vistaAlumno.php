<?php


if($menu_accion_user=='mis_cursos'){
  $mycurso= new grupo();
  $result=$mycurso->getAll($_SESSION['id_alumno']);
  
  if($result){

  ?>

 <div class="cuerpo">

<?php
    while ($row=mysqli_fetch_assoc($result)) {
?>
   <div class="tarjeta">
   			<!-- primera modificacion ques es el de la imgen junto con los nombres de los curos y el nombre de la zorra del profesor que ese va a ser el mismo xd junto con la -->
   			<div class="cabecera" style="background: url(IMAGEN DEL CURSO QUE SE IMPARTE);background-repeat: no-repeat;-webkit-background-size: cover;background-size: cover;">
   				<a class="parte1" href="">
   				<div class="titulo"><?=$row['curso']?></div>				
   				</a>
   				<div class="nombre"><?=$row['maestro']?> </div>
   			</div>
   
   			<div class="medio">				
   				<div class="texto">
   					<img class="foto" src="imagenes/user1.jpg" alt="">
   					<h2>Informacion del curso</h2>
   					<div class="tareas">
   						<a class="link" href=""><?=$row['descripcion']?> </a>
   					</div>
   				</div>
   			</div>
   
   			<div class="pie">				
   				<span class="icon2"><i class="far fa-folder fa-lg"></i></span>
   			</div>
   
   </div>
   <?php
       }
    ?>
</div>
<?php
  }
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
        <div class="tarjetalum"><img class="imgalum" src="src/img/maestros/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/maestros/defaultuser.png'">
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
    </div>
        <br>
        <p2 class="infous">certificados</p2>
        <div class="certificado">
            <ul class="botonesalu">
              <li class="xdd"> <a href="xd"> Programacion Orientada a objetos</a></li>
            </ul>
        </div>
  </div>





   <!-- formualrio escondido -->
   <div class="ventana" id="formdata">
   <form  action="src/logic/server.php?activity=updateStudent&&tipuser=alumno" method="post" enctype="multipart/form-data">
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

  $mypago=new pago();

  $result=$mypago->getAll($_SESSION['id_alumno']);

?>
     <div class="pagos">
            <p class="paguito">Pagos realizados</p>
            <table border="1px" style="margin: 0 auto;">
                <tr>
                <th>Nombre del curso </th>
                <th>Fecha de Pago</th>
                <th>Monto</th>
                </tr>
                <?php
                if($result){
                   while ($row=mysqli_fetch_assoc($result)) {
                      echo "
                      <tr>
                         <td>".$row['curso']."</td>
                         <td>".$row['fecha']."</td>
                         <td>".$row['pago']."</td>
                      </tr>      
                      ";
                   }
                 }
                ?>
                
            </table>
    </div>
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
  
  
           <input class="controls" type="text" name="lastN" required id="nombres" maxlength="30"   placeholder="Segundo apellido" required>
  
          <input  class="controls" type="text" required name="TarjetN"  maxlength="16"  id="Tarjeta" pattern="[0-9]+" placeholder="Numero de tarjeta"required>
          
          <input class= "controls" type= "text" required name="CVV" maxlength="4" id="CVV" pattern="[0-9]+" placeholder="Codigo de seguridad" required>
           
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
                    <img src="src/img/cursos/<?=$row['imagen']?>"  alt="img not found" onerror="this.src='src/img/cursos/default.png'">
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
