<?php
session_start();
if(isset($_SESSION['user'])){
    header("Location: /SurveySystem/");
}
?>
<!DOCTYPE html>
<html ng-app="SurveySystem">
<head>
	<script src="resources/jquery/3.3.1/jquery-3.3.1.min.js"></script>
	<script src="resources/angularjs/1.6.10/angular.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="styles.css">

	<script src="app/SurveySystem.js"></script>
	<script src="app/controllers/LoginController.js"></script>


	<title>Encuesta ULA - UDO</title>
</head>
<body>
	<div class="container center">
		<div>
			<img src="assets/ula.png" alt="" height="200">
			<img src="assets/udo.png" alt="" width="200">
		</div>
		<div ng-controller="LoginController">
			<button id="mybutton">prueba</button>
		</div>
	</div>
</body>
</html>