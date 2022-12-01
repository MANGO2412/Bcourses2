<?php
 require_once("../data/classes.php");

/**********
 * funciones para extras
 *********/

 //funcion para mover la foto de un archivo local al servidor
 function move_foto2($foto,$id,$typeuser){
  $pos=strpos($foto['imageNew']['name'],'.');
  $ext=substr($foto['imageNew']['name'],$pos, strlen($foto['imageNew']['name']));
  $nameFile=$id.$ext;
  
  $archivo=$typeuser=="maestro"?'../img/maestros/'.$nameFile:'../img/alumnos/'.$nameFile;
        
  move_uploaded_file($foto['imageNew']['tmp_name'],$archivo); 
  return $nameFile;
}

//funcion para actualizar la foto 
function updatePhoto($fotoNew,$id,$fotoOld,$typeUser){
  echo $fotoNew['imageNew']['name'];
     

    if(!empty($fotoNew['imageNew']['name'])){
      $path=$typeUser=="maestro"?'../img/maestros/':'../img/alumnos/';
      $verifiy=!empty($fotoOld)?unlink($path.$fotoOld):true;
      
      if($verifiy){
        return move_foto2($fotoNew,$id,$typeUser);
      }else{
        return $fotoOld;
      }

    }else{
      return $fotoOld;
    }

  }
//---------------------------------------------------------------------------------------

 //funcion para registrar alumno
 function registerAlumno($name,$firstN,$lastM,$tel,$email,$photo,$passw){
    $myStudent = new alumno();
    $myuser=new user();

    $idS=$myStudent->add($name,$firstN,$lastM,$photo,$tel);

    if($idS !=0 || $idS != false){
        //para cambiar en nombre de la foto
        
        return $myuser->add($email,password_hash($passw,PASSWORD_DEFAULT),$idS,null);
    }else{
        return false;
    }
    
 }


//funcion para iniciar sesion
function login($username,$password,$tipUser){
   $myuser=new user();
   $result=$myuser->get($username,$password,$tipUser);

   //compara si hay datos
   if($result != false){
      $count=mysqli_num_rows($result);
      
      //revisa si la tupla no tiene cero filas
      if($count == 1){
        $fila=mysqli_fetch_assoc($result);
        session_start();
        $_SESSION['email']=$fila['correo'];
        $_SESSION['creacion']=$fila['fecha_creacion'];
        $_SESSION['contraseña']=$fila['password'];
        // $_SESSION['id']=$fila['codigo'];
        
        //valida el tipo de usuario
         if($tipUser == "alumno"){
          $_SESSION['id_alumno']=$fila['alumno'];
          $_SESSION['email']=isset($_SESSION['id_alumno'])?$fila['correo']:false;
  
         }else if($tipUser=="maestro"){
          $_SESSION['id_maestro']=$fila['maestro'];
          $_SESSION['email']=isset($_SESSION['id_maestro'])?$fila['correo']:false;
         }

         if($_SESSION['email'] == false){
          echo '<script>
          alert("no existe el usuario '.$tipUser.'");
          window.location.href="../../iniciarsesion.php";
         </script>';
         }else{
          header('location: ../../index.php');
         }
           
      }else{
       echo '<script>
         alert("no hay un registro de tu correo y contraseña");
         window.location.href="../../iniciarsesion.php";
        </script>';
      }
   }else{
   echo '<script>
    alert("tu contraseña o correo son incorrecto,vuelve a intetarlo");
    window.location.href="../../iniciarsesion.php";
    </script>';     
  }

     
 }

//metodo para iniciar sesion
function logout(){
    session_start();
    session_destroy();
    header('Location: ../../index.php');
}




//funcion para buscar cursos
function searchAllCuorses($valor){
  $mycourses= new curso();
  $dataset= $mycourses->search($valor);
  if($dataset){
    //crea el areglo json
   $json=array();

   //obtien los datos json
   while ($row=mysqli_fetch_array($dataset)) {
    $json[] = array(
       'codigo'=>$row['codigo'],
       'nombre'=>$row['nombre'],
       'costo'=>$row['costo'],
       'imagen'=>$row['imagen'],
       'hrs'=>$row['no_hrs'],
       'descripcion'=>$row['descripcion'],
       'categoria'=>$row['categoria']
    );
   }
   
   //retorna un valor json
   return json_encode($json);
  }else{
    //retorna un valor comun
    return "no hay datos";
  }

}


//function para actualizar alumno y  cuenta
 function updateStrudent($idAlum,$nombre,$apellP,$apellM,$fotonew,$fotoOld,$cel,$tipusr){
  $myStudent= new alumno();
  $file=updatePhoto($fotonew,$idAlum,$fotoOld,$tipusr);
  if($myStudent->set($idAlum,$nombre,$apellP,$apellM,$file,$cel)){
    return true;
  }else{
    return false;
  }


}



//function para actualizar Maestro
function updateMaster($idAlum,$nombre,$apellP,$apellM,$fotonew,$fotoOld,$cel,$tipusr){
  $myMaster= new maestro();
  $file=updatePhoto($fotonew,$idAlum,$fotoOld,$tipusr);
  if($myMaster->set($idAlum,$nombre,$apellP,$apellM,$file,$cel)){
    return true;
  }else{
    return false;
  }


}



//metodo para registrar el pago
function pagoRegistro($monto,$idAlumn,$idGrp){
     $mypago = new pago();
     $fecha=date('y-m-d');

     $result=$mypago->set($monto,$fecha,$idAlumn,$idGrp);
     return  $result;
}



?>