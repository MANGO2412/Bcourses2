<?php
 require_once("../data/classes.php");

 //funcion para registrar alumno
 function registerAlumno($name,$firstN,$lastM,$tel,$email,$passw){
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
           echo "<script>
               alert('no existe el usuario, comprueba si  estan correcta el corre y pasword');
               window.location.href='../../iniciarsesion.php'
             </script>";
      }
   }else{
        echo "<script>
        alert('no existe el usuario, comprueba si  estan correcta el corre y pasword');
        window.location.href='../../iniciarsesion.php'
       </script>";
   }

     
 }

//metodo para iniciar sesion
function logout(){
    session_start();
    session_destroy();
    header('Location: ../../index.php');
}




//metodo para obtener  todo los cursos
function GetAllCourses($category){
  
    $mycourses= new curso();
    if(!is_null($category)){
     //pendiente crear un procedure store 
      return "datos pendient";   
    }else{  
      $dataset= $mycourses->getAllCursos();
      
      if($dataset){
        //crea el areglo json
       $json=array();

       //obtien los datos json
       while ($row=mysqli_fetch_array($dataset)) {
        $json[] = array(
           'codigo'=>$row['codigo'],
           'nombre'=>$row['nombre'],
           'costo'=>$row['costo'],
           'imagen'=>'"img/null"
           alt="img not found" onerror=this.src="src/img/default.png"',
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
}



//metodo para obtener un cursos
function getOneCourses($id){
  $mycourses= new curso();
  $dataset= $mycourses->get($id);
      
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
?>