<?php
	session_start();
	require_once 'DB.php';

	class Usuario extends DB{
		public $data;


		function __construct(){
			parent:: __construct();
			$this->data = json_decode(file_get_contents('php://input'));
		}

		function login(){
			$data = $this->data;
			$sql = "SELECT * FROM usuario WHERE nombre_usuario = '$data->user' AND clave = PASSWORD('$data->pass')";
			$result = $this->query($sql);
			if($result){
				$_SESSION['user'] = $data;
			}
			$response['found'] = !empty($result);
			echo json_encode($response);
			mysqli_close($this->db);
		}

		function register(){
			$data = $this->data;
			$sql = "INSERT INTO usuario(nombre,apellido,nombre_usuario,clave,pregunta,respuesta) VALUES('$data->firstName','$data->lastName','$data->user',PASSWORD('$data->pass'),'$data->question','$data->answer')";
			$result = $this->exec($sql);
			echo json_encode($result);
		}
	}

	$user = new Usuario();
	call_user_func(array($user ,$_REQUEST['method']));
