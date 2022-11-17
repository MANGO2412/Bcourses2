<?php
 function registerAlumno($name,$firstN,$lastM,$tel,$email,$nick,$passw){
    require_once("../data/classes.php");
    $myStudent = new alumno();
    $myuser=new user();

    $idS=$myStudent->add('A1',$name,$firstN,$lastM," ",$tel,$email);

    if($idS !=0 || $idS != false){
        return $myuser->add($nick,$passw,$idS,null);
    }else{
        return false;
    }
    
 }

?>