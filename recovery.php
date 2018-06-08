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
	<!--link rel="stylesheet" type="text/css" href="styles.css"-->
	<style>
		.login{
			background: white;
			padding:40px 80px 40px 80px;
			border-radius: 5px;
			text-align: left;
			width: 400px;
			margin: 0px auto 0px auto;
			box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
		}

		#content{
			background-image: url('assets/background-3.jpg');
			background-repeat: no-repeat;
			background-size: cover;
		}
	</style>
	<script src="app/SurveySystem.js"></script>
	<script src="app/controllers/RecoveryController.js"></script>


	<title>Encuesta ULA - UDO</title>
</head>
<body id="content">
	<div class="container text-center">
		<div>
			<img src="assets/ula.png" alt="" height="200">
			<img src="assets/udo.png" alt="" width="200">
		</div>
		<div class="login" ng-controller="RecoveryController">
			<form id="user-form">
				<div class="form-group">
					<label><b>Usuario</b></label>
					<input class="form-control" ng-model="data.user" type="text">
				</div>
				<button class="btn btn-primary" ng-click="submitUser()">Siguiente</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" ng-click="beginSession()">Iniciar sesión</button>
			</form>
			<form id="question-form" style="display:none;">
				<div class="form-group">
					<label><b>Pregunta de seguridad:</b><br/> {{data.question}}</label>
				</div>
				<div class="form-group">
					<label><b>Respuesta</b></label>
					<input class="form-control" ng-model="data.answer" type="password">
				</div>
			<button class="btn btn-primary" ng-click="submitAnswer()">Siguiente</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" ng-click="beginSession()">Iniciar sesión</button>
			</form>
			<form id="password-form" style="display:none;">
				<div class="form-group">
					<label><b>Nueva Contraseña: </b></label>
					<input class="form-control" ng-model="data.pass" type="password">
				</div>
				<button class="btn btn-primary" ng-click="submitPassword()">Cambiar Contraseña</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" ng-click="beginSession()">Iniciar sesión</button>
			</form>
		</div>
	</div>
</body>
</html>