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
			<form>
				<div class="form-group">
					<label><b>Usuario</b></label>
					<input class="form-control" ng-model="user.user" type="text">
				</div>
				<div class="form-group">
					<label><b>Contraseña</b></label>
					<input class="form-control" ng-model="user.pass" type="password">
				</div>
				<button class="btn btn-primary" ng-click="submit()">Enviar</button>
			</form>
		</div>
	</div>
</body>
</html>