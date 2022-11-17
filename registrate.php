<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>
<body>
    <form action="src/logic/server.php?activity=register" method="post">
        <input type="text"  name="name"   placeholder="nombre">
        <input type="text"  name="firstN" placeholder="apellido">
        <input type="text"  name="lastN"  placeholder="apellido materno">
        <input type="text"  name="tel"    placeholder="nmero de telefono">
        <input type="email"  name="email"  placeholder="email">
        <input type="text"  name="nick"   placeholder="nickname">
        <input type="password" name="passw"placeholder="password">
        <input type="submit" value="Registrar">
    </form> 
</body>
</html>