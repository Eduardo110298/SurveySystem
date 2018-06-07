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
	<script src="app/controllers/SessionController.js"></script>


	<title>Encuesta ULA - UDO</title>
</head>
<body id="content">
	<div class="container text-center">
		<div>
			<img src="assets/ula.png" alt="" height="200">
			<img src="assets/udo.png" alt="" width="200">
		</div>
		<div class="login" ng-controller="SessionController">
			<form id="login-form">
				<div class="form-group">
					<label><b>Usuario</b></label>
					<input class="form-control" ng-model="user.user" type="text">
				</div>
				<div class="form-group">
					<label><b>Contraseña</b></label>
					<input class="form-control" ng-model="user.pass" type="password">
				</div>
				<button class="btn btn-primary" ng-click="submitLoginData()">Iniciar sesión</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" ng-click="toggleForms($event)">Registrarse</button>
				<a href="recovery.php">Recuperar Contraseña</a>
			</form>
			<form id="register-form" style="display:none;">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label><b>Nombre</b></label>
							<input class="form-control" ng-model="newUser.firstName" type="text">
						</div>
						<div class="form-group">
							<label><b>Apellido</b></label>
							<input class="form-control" ng-model="newUser.lastName" type="text">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label><b>Usuario</b></label>
							<input class="form-control" ng-model="newUser.user" type="text">
						</div>
						<div class="form-group">
							<label><b>Contraseña</b></label>
							<input class="form-control" ng-model="newUser.pass" type="password">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label><b>Pregunta de seguridad</b></label>
							<input class="form-control" ng-model="newUser.question" type="text">
						</div>
						<div class="form-group">
							<label><b>Respuesta</b></label>
							<input class="form-control" ng-model="newUser.answer" type="text">
						</div>
					</div>
				</div>
				<button class="btn btn-primary" ng-click="submitRegistryData()">Registrarse</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default" ng-click="toggleForms($event)">Iniciar sesión</button>
			</form>
		</div>
	</div>
</body>
</html>