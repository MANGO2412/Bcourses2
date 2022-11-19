<?php
   include('src/logic/session.php');
  
   if($menuStundent==false){
     header('location: index.php');
   }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cursos del usuario</title>
</head>
<body>
    <nav>
        <ul>
            <li><a href="src/logic/server.php?activity=logout">salir sesion</a></li>
        </ul>
    </nav>
</body>
</html>