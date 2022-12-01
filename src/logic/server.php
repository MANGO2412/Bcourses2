<?php
  include_once("actions.php");

  if($_REQUEST["activity"]== "register"){
     print_r($_FILES['txtFile']['name']);
     print_r($_FILES['txtFile']['tmp_name']);

        $result= registerAlumno($_POST["name"],$_POST["firstN"],$_POST["lastN"],$_POST["tel"],$_POST["email"],$_FILES,$_POST["passw"]);
           if($result != 0 || $result !== false){
                echo '<script>
                       alert("tu registro se realiza exitosamente,inicia sesion en nustra plataforma");
                       window.location.href="../../iniciarsesion.php";
                    </script>';

             
               //header('location: ../../index.php');
         }else{
               echo '<script>
                     alert("el registro, no se ralizo exitosamente,vuelev a intentarlo");
                     window.location.href="../../registrate.php";
                  </script>';
        }

  }else if($_REQUEST["activity"]=="login"){
    echo $_POST['passw'];
     login($_POST['email'],$_POST['passw'],$_POST['tipUser']);
     
  }else if($_REQUEST['activity']=="logout"){
      logout();

  }else if($_REQUEST["activity"]=="search"){
    echo searchAllCuorses($_REQUEST["namecurso"]);

  }else if($_REQUEST["activity"]=="updateStudent"){
     $result=updateStrudent($_POST['id'],$_POST['nombre'],$_POST['apellP'],$_POST['apellM'],$_FILES,$_POST['imageOld'],$_POST['cel'],$_REQUEST['tip']);
      header('location: ../../home.php?menu=configurar');

  }else if($_REQUEST["activity"]=="updateMaster"){

     $result=updateMaster($_POST['id'],$_POST['nombre'],$_POST['apellP'],$_POST['apellM'],$_FILES,$_POST['imageOld'],$_POST['cel'],$_REQUEST['tip']);
     header('location: ../../home.php?menu=configurar');
  }else if($_REQUEST["activity"]=="pago"){
    $operacion=pagoRegistro($_POST['monto'],$_POST['alumno'],$_POST['grupo']);
   
      echo $operacion;
     if($operacion>0){ if($operacion>0){
      echo '<script>
       alert("el pago se realizo exitosaemnte");
       window.location.href="../../home.php?menu=mi_pago";
       </script>';    

  }else{
    echo '<script>
         alert("el pago no se realizo exitosamente  ya esta  inscrito o el curso esta cerrado");
         window.location.href="../../home.php?menu=mi_pago";
     </script>';   
   }
 
        echo '<script>
         alert("el pago se realizo exitosaemnte");
         window.location.href="../../home.php?menu=mi_pago";
         </script>';    

    }else{
      echo '<script>
           alert("el pago no se realizo exitosamente por '.$operacion.'");
           window.location.href="../../home.php?menu=mi_pago";
       </script>';   
     }
   
  }else{
    echo "tu esta ropiendo el sistema, reporta este error";
  }

?>