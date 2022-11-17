<?php
include_once("config.php");

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
    public function add($matr,$nom,$apellP,$apellM,$foto,$cel,$correo){
      $con=$this->connect();
      $sql="insert into alumno(nombre,apellidoP,apellidoM,foto,N_celular,correo) values('$nom','$apellP','$apellM','$foto','$cel','$correo');";
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


class user extends conexionDB{
    
    //metodo para obtener
    public function get(){
      $con=$this->connect();
      $sql="select * from cuenta";

      if($con){
        return $this->query($sql);  
      }else{
        return false;
      }
    }

    //metodo para agregar
    public function add($user,$passw,$idA,$idM){
      $con=$this->connect();

       if($con){
          if($idA !== null){
            $sql="insert into cuenta(usuario,contraseña,alumno) values('$user','$passw','$idA');";
            return $this->insert($sql);
          }else{
            $sql="insert into cuenta(usuario,contraseña,maestro) values('$user','$passw','$idM');";
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

?>