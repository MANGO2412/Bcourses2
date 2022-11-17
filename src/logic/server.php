<?php
  include_once("actions.php");

  if($_REQUEST["activity"]== "register"){

       $result= registerAlumno($_POST["name"],$_POST["firstN"],$_POST["lastN"],$_POST["tel"],$_POST["email"],$_POST["nick"],$_POST["passw"]);
       if($result != 0 || $result !== false){
         echo "si ejecuto el insert";
       }else{
        echo "sucedio un problema";
        //  echo '<script>
        //          alert("ocurrio un error, verifica  y reporta");
        //          window.href.location="../../registrate.php";
        //        </script>';
       }

  }else if($_REQUEST["activity"]=="login"){
    echo "funcion para logiar";
  }

?>