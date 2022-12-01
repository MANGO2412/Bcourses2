<!-- obtiene la consulta de un curso -->
<?php
  if(empty($_REQUEST['id_curso'])){
      echo "no hay cursos";
  }else{
    $mycurso= new curso();
    $mytopic=new tema();
    $dataset=$mycurso->get($_REQUEST['id_curso']);

    if($dataset){
        $row=mysqli_fetch_array($dataset);
        $verifiyLog=!empty($_SESSION['id_alumno'])?"href='home.php?id_curso=".$_REQUEST['id_curso']."&&menu=realiza_pago&&id_grupo=".$row['grupo']."&&costo=".$row['costo']."'":"onclick='message()'"
?>


<div  class="curso">

     <section id="dividida">
            <div class = izqres>
              <br>
               <p class="p3"><?=$row['nombre_curso']?></p>
               <p class="p4"><?=$row['descripcion']?></p>
            </div>
            <div class = derres>
             <img class="imgxd" src="src/img/cursos/<?=$row['imagen_c']?>">
            </div>
        </section>
          <section id="dividida">
              <div class = izqapren>
                 <br>
             <p class="p5">¿Qué es lo que vas a aprender?</p>
             <br>
              <div class="p6">
                 <?php
                   $dataset2=$mytopic->getAll($row['codigo_curso']);
                   while ($row2=mysqli_fetch_array($dataset2)) {
                      echo "<p>-->".$row2['titulo']."<--</p>";
                      echo "<p>#".$row2['descripcion']."</p>";
                   }
                 ?>
              </div>
              <br>
             
             <p class="p7">ACERCA DEL INSTRUCTOR</p>
             <div class="perfil">
              <br>
              <img class="imgperf"  src="src/img/maestros/<?=$row['foto']?>"  alt="img not found" onerror="this.src='src/img/maestros/defaultuser.png'">
              
              <br>
              <p class="nombrexd"><?=$row['maestro']?></p>
              <br>
              <br>
          </div>
                 </div>
                 <div class = derapren>
                  <br>
                 <div class="precio">
                  <br>
                  <p class="prec"><?=$row['costo']?> MXN</p>
                  <ul class="botonesxd">
                  <li><a <?php echo $verifiyLog?> >Comprar curso</a></li>
                  </ul>
                  <p class="adv">Una vez realizada la compra no podras cancelar tu compra.</p>
                  <br>
                  <br>
                 </div>
                 <br>
                 <br>
              <div class="hora">
                 <span class="hora">Horarios: 7:00 - 9:00 am</span><br>
                 <span class="hora">Personas inscritas al curso:<?=$row['No_Estudiantes']?>/30 </span><br>
                 <span class="hora">Fecha de inicio:<?=$row['fechaIn']?></span><br>
                 <span class="hora">Fecha de fin: <?=$row['fechaFn']?></span><br>
              </div>   
              </div>
              
                 </section>
                            

</div>
<script>
    function message(){
        alert("inicia sesion para poder adquirir el curso");
    }
</script>
<?php
    }else{
        echo "
              <p>Error 404</p>
              <a href='home.php'>regresa a casa</a>
              ";
    }
  }
?>    
   