<?php
	session_start();
	require_once 'DB.php';

	class Question extends DB{
		public $data;


		function __construct(){
			parent:: __construct();
			$this->data = json_decode(file_get_contents('php://input'));
		}

		function getQuestions(){
			$id = $_GET["id"];
			$sql = "SELECT * FROM pregunta JOIN encuesta_pregunta ON encuesta_pregunta.id_pregunta = pregunta.id WHERE encuesta_pregunta.id_encuesta = '$id'";
			$result = $this->query($sql);
			$this->utf8_string_array_encode($result);
			$response = json_encode($result);
			echo $response;
			// if ($response) {
			// 	echo $response;
			// }else{
			// 	echo json_last_error_msg();
			// }
			mysqli_close($this->db);
		}
	}

	$question = new Question();
	call_user_func(array($question ,$_REQUEST['method']));
