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

		function is_assoc($test) {
	        if (empty($test)) { return(false); }
	        if (!is_array($test)) { return(false); }
	        return ($test !== array_values($test));
		}

		function getAnswer($data){
			$sql = "SELECT * FROM respuesta WHERE id_encuesta = '$data->survey_id' ORDER BY CHAR_LENGTH(combinacion) ASC";
			$result = $this->query($sql);
			
			$user_comb_array = explode(",",$data->comb);
			$all_comb_array = ($result) ? ((!$this->is_assoc($result))? $result : array($result)) : array();
			
			foreach($all_comb_array as $comb_bag){
				if (count(array_unique(array_merge(explode(",",$comb_bag["combinacion"]),$user_comb_array))) == count(explode(",",$comb_bag["combinacion"]))){
					$comb_bag_id = $comb_bag["id"];
					$sql = "INSERT INTO respuesta_alumno1(id_respuesta,id_usuario,opciones) VALUES('$comb_bag_id','$data->user_id','$data->comb')";
					return $comb_bag["respuesta"];
				}
			}

			return "Por favor contactenos para atender mas detalladamente su caso";
		}

		function saveAnswers(){
			$data = $this->data;
			echo json_encode($this->getAnswer($data));
		}
	}

	$question = new Question();
	call_user_func(array($question ,$_REQUEST['method']));
