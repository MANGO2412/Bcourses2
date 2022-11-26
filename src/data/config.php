<?php
class conexionDB{
    private $host;
    private $user;
    private $passw;
    private $db;
    private $con;

    public function __construct(){
          $this->host="localhost";
          $this->user="root";
          $this->passw="";
          $this->db="CursosOnline";
    }

    //metodo que establece conexion a la base de datos
    public function connect(){
      
      $this->con=@mysqli_connect($this->host,$this->user,$this->passw,$this->db);

      if($this->con){
        return true;
      }else{
         return false;
      }
    }

    //metodo que consultas datos
    public function query($sql){
      $result=mysqli_query($this->con,$sql);

      if($result){
         return $result;
      }else{
         return false;
      }
    }


    public function insert($sql){
       if(mysqli_query($this->con,$sql)){
         $newid=mysqli_insert_id($this->con);
         return $newid;
       }else{
         $newid=0;
         return $newid;
       }
    }
    
    //metodo que actualiza o elimina los datos
    public function updateDelete($sql){
         if(mysqli_query($this->con,$sql)>0){
           return true;
         }else{
           return false;
         }
    }

}
?>