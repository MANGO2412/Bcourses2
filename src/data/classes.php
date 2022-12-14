<?php
include_once("config.php");

//funciones para los metodos
 function move_foto($foto,$id){
   $pos=strpos($foto['txtFile']['name'],'.');
   $ext=substr($foto['txtFile']['name'],$pos, strlen($foto['txtFile']['name']));
   $nameFile=$id.$ext;
   $archivo='../img/alumnos/'.$nameFile;       
   move_uploaded_file($foto['txtFile']['tmp_name'],$archivo); 
   return $nameFile;
 }


//-----------------------------------------------clases-------------------------------------------------

/*****
 clase maestro
 *****/
class maestro extends conexionDB{
    //meto
     public function get($id){
      $con= $this->connect();
      if($con){
        $sql="select * from maestro where codigo=$id";
        return $this->query($sql);
      }else{
         return false;
      }

     }
     
     public function getOwnCourses($id){
        $con=$this->connect();
        if($con){
         $sql="call InfoCursosMaster($id);";
         return $this->query($sql);
        }else{
          return false;
        }
     }


     public function add(){

     }

      //metodo para modificar el maestro
    public function set($id,$nom,$apellP,$apellM,$foto,$cel){
      $con = $this->connect();
      if($con){
       $sql="update maestro set nombre='$nom',ApellidoP='$apellP',ApellidoM='$apellM',foto='$foto',n_celular='$cel' where codigo=$id;";
       echo $sql;
       return $this->updateDelete($sql);
      }else{
       return false;
    }
   }
}



/**********
 clase alumno
************/
class alumno extends conexionDB{
   /*
    matricula
    nombre
    apellido paterno
    apellido materno
    foto
    email
    numero de telefono
   */ 
  
   //metodo para obtener el alumno
    public function getAll(){
      $con=$this->connect();
      $sql="select * from alumnos";

      if($con){
      return $this->query($sql);
      }else{
        return false;
      }

    }

    public function get($id){
      $con=$this->connect();
      $sql="select * from alumno where matricula=$id";

      if($con){
        return $this->query($sql);  
      }else{
        return false;
      }
    }
    
    //metodo para agregar al un estudiante
    public function add($nom,$apellP,$apellM,$foto,$cel){
      $con=$this->connect();
      $file=!empty($foto['txtFile']['name'])?true:false;

      $sql="insert into alumno(nombre,ApellidoP,ApellidoM,foto,n_celular) values('$nom','$apellP','$apellM',' ','$cel');";
      if($con){
        $id_new =$this->insert($sql);

        if($file){
          $archivo= move_foto($foto,$id_new);
          $sql=  "update alumno set foto='$archivo' where matricula=".$id_new.";";
          $id_new=$this->updateDelete($sql)?$id_new:false;
        }

       return $id_new;
      }else{
        return false;
      }
    }
    
    //metodo para modificar a un estudiante
    public function set($id,$nom,$apellP,$apellM,$foto,$cel){
        $con = $this->connect();
        if($con){
         $sql="update alumno set nombre='$nom',ApellidoP='$apellP',ApellidoM='$apellM',foto='$foto',n_celular='$cel' where matricula=$id;";
         echo $sql;
         return $this->updateDelete($sql);
        }else{
         return false;
      }
     }
}

/**********
 clase  cuenta
************/
class user extends conexionDB{
    
    //metodo para obtener
    public function getAll(){
      $con=$this->connect();
      $sql="select * from cuenta";

      if($con){
        return $this->query($sql);  
      }else{
        return false;
      }
    }

    //metodo para obtener el usuario
    // public function get($email,$passw,$tipUser){
    //     $con=$this->connect();
    //     $sql="select  contrase??a from cuenta where  correo='$email';";
        
        
    //     if($con){
    //        $dataset=$this->query($sql);
    //        $fila = $dataset==false?array('contrase??a'=>''):mysqli_fetch_array($dataset);

    //        //comprobar el suario
    //        if($tipUser == "maestro"){
    //         $same=$fila['contrase??a']==$passw?true:false;
    //        }else{
    //         $same = password_verify($passw,$fila['contrase??a']);
    //        } 
        
    //        if($same){

    //         $sql2="select  * from cuenta where  correo='$email';";
    //         $dataset2=$this->query($sql2);
    //         return $dataset2;
    //        }else{
    //          return false;
    //        }

    //     }else{

    //       return false;
    //     }
    // }

    public function get($email,$passw){
        $con =$this->connect();
        
        $sql="select * from cuenta where correo='$email' and password='$passw'";
        echo $sql;
        if($con){
           return $this->query($sql);
        }else{
          return false;
        }
    }

    //metodo para agregar 
    public function add($email,$passw,$idA,$idM){
      $con=$this->connect();
      $fechaActual = date('y-m-d');

       if($con){
          if($idA !== null){
            $sql="insert into cuenta(correo,fecha_creacion,contrase??a,alumno) values('$email','$fechaActual','$passw','$idA');";
            return $this->insert($sql);
          }else{
            $sql="insert into cuenta(correo,fecha_creacion,contrase??a,maestro) values('$email',now(),'$passw','$idM');";
            return $this->insert($sql);
          }
       }else{
        return false;
       }
    }

    //metodo para modificar--pendiente
    public function set($id,$passw){
      $con=$this->connect();
      $dataset=false;
      
      if($con){
         $dataset=$this->query("select contrase??a from cuenta where codigo=$id");
         if($dataset){
            $fila=mysqli_fetch_array($dataset);
            $same= password_verify($passw,$fila['contrase??a']);
            if(!$same){
               $password=password_hash($passw,PASSWORD_DEFAULT);
               $dataset= $this->updateDelete("update cuenta set contrase??a='$password'");
            }else{
              $dataset=true;
            }
         }

         return $dataset;
      }
 
    }


}

/**********
 clase cursos
************/
class curso extends conexionDB{
   private $category;

   

  public function getAllCursos($tipCat){
     $con=$this->connect();
     $this->category=$tipCat;

     if($con){    
       $sql=is_null($this->category)?'select * from curso':'select * from curso where categoria='.$this->category.'';
       return $this->query($sql);
     }else{
       return false;
     }
  }


  public function get($id){
      $con= $this->connect();

      if($con){
        $sql= "call InfoCurso($id)";
        return $this->query($sql);
      }else{
         return false;
      }
  }

  public function set(){

  }

  public function add(){

  }


  public function search($response){
    $con= $this->connect();

    if($con){
      $sql= "select * from curso where nombre like '$response'  or nombre like '".$response."%"."' ";
      return $this->query($sql);
    }else{
       return false;
    }
  }
}

/*****
 clase categoria
*****/
class categoria extends conexionDB{

  //metodo para obtener todas las categorias
  public function getAll(){
    $con=$this->connect();

    if($con){
      $sql= 'select * from categoria';
      return $this->query($sql);
    }else{
      return false;
    }
  }
}



/******
 * tema
 ****/

class tema extends conexionDB{
  public function getAll($id_curso){
     $con=$this->connect();
     if($con){
      $sql="select * from temas where curso=$id_curso";
      return $this->query($sql);
     }else{
      return false;
     }
  }

}

/***
 clase grupo
 ****/
class grupo extends conexionDB{
   public function getAll($iduser){
      $con=$this->connect();

      if($con){
        $sql="call  infogrupos($iduser)";
        return $this->query($sql);
      }else{
        return false;
      }
   }

   public function get(){

   }


}

 /***
  * clase pago
  */
class pago extends conexionDB{
  public function  set($monto,$fecha,$idAlumn,$idGrp){
    $con =$this->connect();

    

    if($con){
      $sql="insert into pago(monto,fecha,alumno,grupo) values($monto,'$fecha',$idAlumn,$idGrp)";
      $sql2="insert into alumno_grupo(alumno,grupo) values($idAlumn,$idGrp) ";
      $mens=true;

      try {

        $newid = $this->insert($sql);
      } catch (Exception $e) {
        $newid= $e->getMessage();
       
      }  
    
      if($newid>0){
        echo $sql2;
        return $this->insert($sql2);
      }else{
        return $newid;
      }
      
    }else{
      return false;
    }
  }

  
  public function getAll($idUser){
    $con=$this->connect();
    if($con){
       $sql="call infPago($idUser)";
       return $this->query($sql);
    }else{
        return false;
    }
  }



}






?>