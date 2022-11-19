<?php
  session_start();
  if(isset($_SESSION['email'])){
    $menuStundent=true;
    $use='welcome '.$_SESSION['email'];
  }else{
    $menuStundent=false;
  }
?>