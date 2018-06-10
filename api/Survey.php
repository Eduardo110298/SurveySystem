<?php
	session_start();
	require_once 'DB.php';

	class Survey extends DB{
		public $data;


		function __construct(){
			parent:: __construct();
			$this->data = json_decode(file_get_contents('php://input'));
		}

		function getSurveys(){
			$data = $this->data;
			$nombre_usuario = $_GET["nombre_usuario"];
			$sql = "SELECT * FROM encuesta WHERE id NOT IN(SELECT respuesta.id_encuesta FROM respuesta JOIN respuesta_alumno1 ON respuesta_alumno1.id_respuesta = respuesta.id WHERE respuesta_alumno1.id_usuario='$nombre_usuario')";
			$result = $this->query($sql);
			if ($result){ 
				$this->utf8_string_array_encode($result);
				echo json_encode($result);
			}else{
				echo json_encode(array());
			}
			
			mysqli_close($this->db);
		}
	}

	$survey = new Survey();
	call_user_func(array($survey ,$_REQUEST['method']));
