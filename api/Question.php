<?php
	session_start();
	require_once 'DB.php';

	class Survey extends DB{
		public $data;


		function __construct(){
			parent:: __construct();
			$this->data = json_decode(file_get_contents('php://input'));
		}

		function getQuestions(){
			$data = $this->data;
			echo json_encode($data);
			$sql = "SELECT * FROM pregunta WHERE id_encuesta = ''";
			$result = $this->query($sql);
			echo json_encode($result);
			mysqli_close($this->db);
		}
	}

	$survey = new Survey();
	call_user_func(array($survey ,$_REQUEST['method']));
