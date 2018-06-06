<?php
session_start();
$user = json_decode(file_get_contents('php://input'));

require('db.php');
$mysql = new DB();
// $sql = "SELECT * FROM usuario WHERE nombre_usuario = '$user->user' AND clave = PASSWORD('$user->pass')";
$sql = "SELECT * FROM usuario";
$result = $mysql->query($sql);

if($result){
	$_SESSION['user'] = $user;
}

$data['found'] = !empty($result);
echo json_encode($data);
mysqli_close($mysql->db);



1234