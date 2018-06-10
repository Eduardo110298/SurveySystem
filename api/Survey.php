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
			$sql = "SELECT * FROM encuesta";
			$result = $this->query($sql);
			$this->utf8_string_array_encode($result);
			echo json_encode($result);
			mysqli_close($this->db);
		}
	}

	$survey = new Survey();
	call_user_func(array($survey ,$_REQUEST['method']));
