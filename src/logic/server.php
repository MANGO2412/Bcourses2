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
  }else if($_REQUEST["activity"]== "getcourses"){
      echo GetAllCourses(null);
  }else if($_REQUEST["activity"]=="oneGetCourse"){
    echo getOneCourses($_POST['idC']);
  }else if($_REQUEST["activity"]=="search"){
    echo searchAllCuorses($_REQUEST["namecurso"]);
  }else if($_REQUEST["activity"]=="updateStudent"){
    echo $_POST['id'];
    $result=updateStrudent($_POST['id'],$_POST['nombre'],$_POST['apellP'],$_POST['apellM'],$_FILES,$_POST['imageOld'],$_POST['cel']);
    header('location: ../../home.php?menu=configurar');

  }else{
    echo "tu esta ropiendo el sistema, reporta este error";
  }

?>