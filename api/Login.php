<?php
session_start();
$user = json_decode(file_get_contents('php://input'));

require('db.php');
$db = new DB();
$sql = "SELECT * FROM usuario WHERE nombre_usuario = '$user->user' AND clave = PASSWORD('$user->pass')";
$result = $db->query($sql);

if($result){
	$_SESSION['user'] = $user;
}

$data['found'] = !empty($result);
echo json_encode($data);
mysqli_close($db->db);
