<?php
	session_start();
	require_once 'DB.php';

	class Question extends DB{
		public $data;


		function __construct(){
			parent:: __construct();
			$this->data = json_decode(file_get_contents('php://input'));
		}

		function getOptionsForQuestion($id_question){
			$sql = "SELECT * FROM opciones WHERE id_pregunta = '$id_question'";
			$result = $this->query($sql);
			return $result;
		}

		function assocOptionsAndQuestions($question){
			$id_question = $question["id"];
			$question["options"] = $this->getOptionsForQuestion($id_question);
			return $question;
		}

		function getQuestions(){
			$id = $_GET["id"];
			$sql = "SELECT * FROM pregunta JOIN encuesta_pregunta ON encuesta_pregunta.id_pregunta = pregunta.id WHERE encuesta_pregunta.id_encuesta = '$id'";
			$result = $this->query($sql);
			$result = array_map(array($this, 'assocOptionsAndQuestions'), $result);
			$this->utf8_string_array_encode($result);
			$response = json_encode($result);
			echo $response;
			mysqli_close($this->db);
		}

		function saveCustomAnswer(){
			$data = $this->data;
			if($data->repe){
				$sql = "UPDATE respuesta SET respuesta = '$data->resp' WHERE combinacion = '$data->comb'";
				$result = $this->exec($sql);
				echo json_encode($result);
			}else{
				$sql = "INSERT INTO respuesta(respuesta, id_encuesta, combinacion) VALUES('$data->resp', '$data->survey_id', '$data->comb')";
				$result = $this->exec($sql);
				if(!is_array($result) && explode(" ", $result)[0]=="Duplicate"){
					echo json_encode(array("repeated" => true));
				}else{
					echo json_encode($result);
				}
			}
			mysqli_close($this->db);
		}
	}

	$question = new Question();
	call_user_func(array($question ,$_REQUEST['method']));
