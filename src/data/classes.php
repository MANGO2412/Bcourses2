<?php
include_once("config.php");

/*****
 clase maestro
 *****/




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
    public function get(){
      $con=$this->connect();
      $sql="select * from alumnos";

      if($con){
        return $this->query($sql);  
      }else{
        return false;
      }
    }
    
    //metodo para agregar al un estudiante
    public function add($nom,$apellP,$apellM,$foto,$cel){
      $con=$this->connect();
      $sql="insert into alumno(nombre,apellidoP,apellidoM,foto,N_celular) values('$nom','$apellP','$apellM','$foto','$cel');";
      if($con){
       return $this->insert($sql);
      }else{
        return false;
      }
    }
    
    //metodo para modificar el 
    public function set(){

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
    public function get($email,$passw){
        $con=$this->connect();
        $sql="select  contraseña from cuenta where  correo='$email';";
        
        echo $sql;
        if($con){
           $dataset=$this->query($sql);
           $fila = mysqli_fetch_array($dataset);
           $same = password_verify($passw,$fila['contraseña']);
           


           if($same){

            $sql2="select  * from cuenta where  correo='$email';";
            $dataset2=$this->query($sql2);;
            return $dataset2;
           }else{
             return false;
           }

        }else{

          return false;
        }
    }

    //metodo para agregar
    public function add($email,$passw,$idA,$idM){
      $con=$this->connect();

       if($con){
          if($idA !== null){
            $sql="insert into cuenta(correo,contraseña,alumno) values('$email','$passw','$idA');";
            return $this->insert($sql);
          }else{
            $sql="insert into cuenta(correo,contraseña,maestro) values('$email','$passw','$idM');";
            return $this->insert($sql);
          }
       }else{
        return false;
       }
    }

    //metodo para modificar
    public function set(){
    }


}

/**********
 clase cursos
************/
class curso extends conexionDB{


  public function getAllCursos(){
     $con=$this->connect();

     if($con){
       $sql= 'select * from curso';
       return $this->query($sql);
     }else{
       return false;
     }
  }


  public function get($id){
      $con= $this->connect();

      if($con){
        $sql= "select * from curso where codigo='$id'";
        return $this->query($sql);
      }else{
         return false;
      }
  }

  public function set(){

  }

  public function add(){

  }
}


/***
 clase grupo
 ****/


 /***
  * clase pago
  */


?>