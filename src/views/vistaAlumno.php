<?php
include_once('src/data/classes.php');

if($menu_accion_user=='mis_cursos'){
?>
<p><?=$menu_accion_user?></p>
<?php
}else if($menu_accion_user=='configurar'){
?>
<p><?=$menu_accion_user?></p>


<?php
}else if($menu_accion_user==="mi_pago"){
?>
 <p><?=$menu_accion_user?></p>
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
                         <a href="src/views/curso.php?id_curso=<?=$row['codigo']?>" class="vermas">ver mas del curso</a>
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
<script src="src/logic/jquery-3.6.1.min.js"></script>
<script src="src/logic/scripts/script1.js"></script>