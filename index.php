<?php
   include('src/logic/session.php');
   if($menuStundent){
     header('location: home.php');
   }

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="src/styles/principal.css">
    <title>Inicio</title>
</head>
<body>
<header class="header">
    <div class="logo">
       <img src="src/img/03.png">
    </div>
       
  <nav>
      <ul class="botones">
        <li><a href="iniciarsesion.php">Inicia Sesion</a></li>
        <li><a href="registrate.php">Registrate</a></li>
     </ul>
  </nav>
</header>
   
        <section id="dividida">
            <div class = izq>
                <h2>Estudia cuando quieras y  donde quieras</h2> 
                <p class="p1">¡ Elige la hora y el momento que quieras, para tomar tus cursos en linea !</p>
                <p class="p2">Somos una empresa que se encarga de poder brindar a las personas un sitio para poder llevar acabo sus cursos de manera online</p>    
            <a href="registrate.php">Registrate</a>
            <a href="Hablarasesor.php">Ver cursos disponibles</a>
          </div>
          <div class = der></div>
        </section>
        <section class="frase">
            <div>
            <p class="hola">Explora nuestros cursos mas interesantes </p>
            </div>
        </section>

</body>
</html>