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
				$_SESSION['user'] = $result;
			}
			$response['found'] = !empty($result);
			echo json_encode($response);
			mysqli_close($this->db);
		}

		function register(){
			$data = $this->data;
			$sql = "INSERT INTO usuario(nombre,apellido,nombre_usuario,clave,pregunta,respuesta) VALUES('$data->firstName','$data->lastName','$data->user',PASSWORD('$data->pass'),'$data->question',PASSWORD('$data->answer'))";
			$result = $this->exec($sql);
			echo json_encode($result);
			mysqli_close($this->db);
		}

		function validateUser(){
			$data = $this->data;
			$sql = "SELECT * FROM usuario WHERE nombre_usuario = '$data->user'";
			$result = $this->query($sql);
			$response['found'] = !empty($result);
			$response['user'] = $result;
			echo json_encode($response);
			mysqli_close($this->db);
		}

		function validateAnswer(){
			$data = $this->data;
			$sql = "SELECT * FROM usuario WHERE nombre_usuario = '$data->user' AND respuesta = PASSWORD('$data->answer')";
			$result = $this->query($sql);
			$response['found'] = !empty($result);
			echo json_encode($response);
			mysqli_close($this->db);
		}

		function setPassword(){
			$data = $this->data;
			$sql = "UPDATE usuario SET clave=PASSWORD('$data->pass') WHERE nombre_usuario = '$data->user'";
			$result = $this->exec($sql);
			echo json_encode($result);
		}

	}

	$user = new Usuario();
	call_user_func(array($user ,$_REQUEST['method']));
