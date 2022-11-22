<?php
  include_once("actions.php");

  if($_REQUEST["activity"]== "register"){

       $result= registerAlumno($_POST["name"],$_POST["firstN"],$_POST["lastN"],$_POST["tel"],$_POST["email"],$_POST["passw"]);
       if($result != 0 || $result !== false){
              echo '<script>
                alert("tu registro se realiza exitosamen,inicia sesion para usar nustra plataforma");
                </script>';
              header('location: ../../index.php');
       }else{
        echo "sucedio un problema";
        //  echo '<script>
        //          alert("ocurrio un error, verifica  y reporta");
        //          window.href.location="../../registrate.php";
        //        </script>';
       }

  }else if($_REQUEST["activity"]=="login"){
       login($_POST['email'],$_POST['passw']);
       
  }else if($_REQUEST['activity']=="logout"){
      logout();
  }else if($_REQUEST["activity"]== "getcourses"){
      echo GetAllCourses(null);
  }else if($_REQUEST["activity"]=="oneGetCourse"){
    echo getOneCourses($_POST['idC']);
  }

?>