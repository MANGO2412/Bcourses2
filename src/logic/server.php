<?php
  include_once("actions.php");

  if($_REQUEST["activity"]== "register"){
     print_r($_FILES['txtFile']['name']);
     print_r($_FILES['txtFile']['tmp_name']);

        $result= registerAlumno($_POST["name"],$_POST["firstN"],$_POST["lastN"],$_POST["tel"],$_POST["email"],$_FILES,$_POST["passw"]);
           if($result != 0 || $result !== false){
                echo '<script>
                  alert("tu registro se realiza exitosamen,inicia sesion para usar nustra plataforma");
                    </script>';

             
               header('location: ../../index.php');
         }else{
         //  echo "sucedio un problema";
         //        echo '<script>
         //            alert("ocurrio un error, verifica  y reporta");
         //            window.href.location="../../registrate.php";
         //         </script>';
         echo "no se pudo checa tu codigo y revisa la base de datos";
        }

  }else if($_REQUEST["activity"]=="login"){
     login($_POST['email'],$_POST['passw'],$_POST['tipUser']);
     
  }else if($_REQUEST['activity']=="logout"){
      logout();

  }else if($_REQUEST["activity"]=="search"){
    echo searchAllCuorses($_REQUEST["namecurso"]);

  }else if($_REQUEST["activity"]=="updateStudent"){
     $result=updateStrudent($_POST['id'],$_POST['nombre'],$_POST['apellP'],$_POST['apellM'],$_FILES,$_POST['imageOld'],$_POST['cel']);
      header('location: ../../home.php?menu=configurar');

  }else if($_REQUEST["activity"]=="pago"){
    //  echo $_POST['alumno'];
    //  echo $_POST['grupo'];
    //  echo $_POST['monto'];

    $operacion=pagoRegistro($_POST['monto'],$_POST['alumno'],$_POST['grupo']);


    echo $operacion;
    //  if(is_string($operacion)){
    //    echo $operacion;
    //  }else if($operacion == false){
    //     echo "error 404, no hay servicio";
    //  }else{
    //     echo "tu registro  se realizo exitosamente";
    //  }
  }else{
    echo "tu esta ropiendo el sistema, reporta este error";
  }

?>