<?php
 //funcion para registrar alumno
 function registerAlumno($name,$firstN,$lastM,$tel,$email,$passw){
    require_once("../data/classes.php");
    $myStudent = new alumno();
    $myuser=new user();

    $idS=$myStudent->add($name,$firstN,$lastM," ",$tel);

    if($idS !=0 || $idS != false){
        return $myuser->add($email,password_hash($passw,PASSWORD_DEFAULT),$idS,null);
    }else{
        return false;
    }
    
 }


//funcion para iniciar sesion
function login($username,$password){
   require_once('../data/classes.php');
   $myuser=new user();
   $result=$myuser->get($username,$password);

   //compara si hay datos
   if($result != false){
      $count=mysqli_num_rows($result);
      
      //revisa si la tupla no tiene cero filas
      if($count == 1){
        $fila=mysqli_fetch_assoc($result);
        session_start();
        $_SESSION['email']=$fila['correo'];
        $_SESSION['id']=$fila['codigo'];
         header('location: ../../index.php');
  
      }else{
          echo "no hay datos";
      }
   }else{
      echo "no hay datos";
   }

     
 }

//metodo para iniciar sesion
function logout(){
    session_start();
    session_destroy();
    header('Location: ../../index.php');
}

?>