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
 
 			$sql = "SELECT * FROM respuesta WHERE combinacion = $data->comb";
 			$result = $this->query($sql);
			$new_comb_id = $result["id"];
			$new_comb = explode(",",$data->comb);

			$sql = "SELECT * FROM respuesta_alumno1 WHERE id_respuesta = 1";
			$respuestas = $this->query($sql);
			$respuestas = $this->is_assoc($respuestas)? array($respuestas) : $respuestas;
			
			foreach($respuestas as $row){
				$user_comb = explode(",",$row["opciones"]);
				$username = $row["id_usuario"];
				if (count(array_unique(array_merge($new_comb,$user_comb))) == count($new_comb)){
					$sql = "UPDATE respuesta_alumno1 SET id_respuesta = $new_comb_id WHERE id_usuario = $username";
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
					$result = $this->exec($sql);
					return $comb_bag["respuesta"];
				}
			}
			$sql = "INSERT INTO respuesta_alumno1(id_respuesta,id_usuario,opciones) VALUES('1','$data->user_id','$data->comb')";
			$result = $this->exec($sql);
			return "Por favor contactenos para atender mas detalladamente su caso\n rahylem26@gmail.com";
		}

		function saveAnswers(){
			$data = $this->data;
			echo json_encode($this->getAnswer($data));
		}
		function getDoneSurveys(){
			$rol = $_GET["rol"];
			$nombre_usuario = $_GET["nombre_usuario"];
			if($rol == "administrador"){
				$sql = "SELECT respuesta_alumno1.id AS id_respuesta_alumno1, encuesta.nombre FROM respuesta_alumno1 JOIN respuesta ON respuesta.id = respuesta_alumno1.id_respuesta JOIN encuesta ON encuesta.id = respuesta.id_encuesta";
				$result = $this->query($sql);
				echo json_encode($result);
			}else{
				$sql = "SELECT respuesta_alumno1.id AS id_respuesta_alumno1, encuesta.nombre FROM respuesta_alumno1 JOIN respuesta ON respuesta.id = respuesta_alumno1.id_respuesta JOIN encuesta ON encuesta.id = respuesta.id_encuesta WHERE id_usuario = '$nombre_usuario'";
				$result = $this->query($sql);
				echo json_encode($result);
			}
		}

		function getDoneCombs(){
			$sql = "SELECT * FROM respuesta";
			$result = $this->query($sql);
			echo json_encode($result);
		}

		function getCombResult(){
			$data = $this->data;
			$id_comb = $data->id;
			$sql = "SELECT * FROM respuesta WHERE id = $id_comb";
			$result = $this->query($sql);
			
			
			
			echo json_encode($result);
		}


		function getSurveyResult(){
			$data = $this->data;
			$id_respuesta_alumno1 = $data->id_respuesta_alumno1;
			$sql = "SELECT respuesta_alumno1.opciones, respuesta.respuesta FROM respuesta_alumno1 JOIN respuesta ON respuesta.id = respuesta_alumno1.id_respuesta WHERE respuesta_alumno1.id = '$id_respuesta_alumno1'";
			$result = $this->query($sql);
			//echo json_encode($result);
			$opciones = explode(",", $result["opciones"]);
			$intervencion = $result["respuesta"];
			$response["res"] = array();
			foreach ($opciones as $opcion_id){
				$sql = "SELECT pregunta.pregunta, opciones.opcion FROM pregunta JOIN opciones ON pregunta.id = opciones.id_pregunta WHERE opciones.id_opcion = '$opcion_id'";
				$result = $this->query($sql);
				array_push($response["res"], $result);
			}
			$response["intervencion"] = $intervencion;
			$this->utf8_string_array_encode($response);
			echo json_encode($response);
		}
	}


	$question = new Question();
	call_user_func(array($question ,$_REQUEST['method']));
