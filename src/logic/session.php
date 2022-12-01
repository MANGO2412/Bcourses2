<?php
  session_start();
  if(isset($_SESSION['email']) && $_SESSION['email'] != false){

     if(isset($_SESSION['id_maestro'])){
       $menuMaestro = true;
       $menuStundent=false;
     }else if(isset($_SESSION['id_alumno'])){
      $menuStundent=true;
      $menuMaestro = false;
     }
  }else{
    $menuStundent=false;
    $menuMaestro = false;
  }
?>