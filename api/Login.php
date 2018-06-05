<?php
session_start();

require('db.php')
$db = new DB();
$data = $db->query("a")

// $data = json_decode(file_get_contents('php://input'));


echo json_encode($data);

 

 // if (password_verify($password, $row['password'])) { 
 
 //    $_SESSION['loggedin'] = true;
 //    $_SESSION['username'] = $username;
 //    $_SESSION['start'] = time();
 //    $_SESSION['expire'] = $_SESSION['start'] + (5 * 60);

 //    echo "Bienvenido! " . $_SESSION['username'];
 //    echo "<br><br><a href=panel-control.php>Panel de Control</a>"; 

 // } else { 
 //   echo "Username o Password estan incorrectos.";

 //   echo "<br><a href='login.html'>Volver a Intentarlo</a>";
 // }
 // mysqli_close($conexion); 