<?php
session_start();
if(!isset($_SESSION['user'])){ //if login in session is not set
    header("Location: login.php");
}

?>

<!DOCTYPE html>
<html ng-app="SurveySystem">
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="resources/jquery/3.3.1/jquery-3.3.1.min.js"></script>
	<script src="resources/angularjs/1.6.10/angular.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
	<!--link rel="stylesheet" type="text/css" href="styles.css"-->
	<style>
		.menu{
			padding:0px;
		}
		.menu li{
			list-style: none;
		}
		.menu li a{
			text-decoration: none;
		}
	</style>
	<script src="app/SurveySystem.js"></script>
	<script src="app/controllers/SessionController.js"></script>
	<script src="app/controllers/MenuController.js"></script>


	<title>Encuesta ULA - UDO</title>
</head>
<body>
	<div class="container text-center">
	</div>
	<div style="width:100%">
		<div style="height:100px; background: #007bff;" class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<img src="assets/ula.png" alt="" height="100">
					&nbsp;&nbsp;
					<img src="assets/udo.png" alt="" width="100">
				</div>
				<div ng-controller="SessionController" class="col-md-6 text-right">
					<button ng-click="logout()" style="margin-top: 4.5%" class="btn btn-default">Cerrar Sesion</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul class="menu">
				    <li class="active"><a href="#">Home</a></li>
				    <li><a href="#">Menu 1</a></li>
				    <li><a href="#">Menu 2</a></li>
				    <li><a href="#">Menu 3</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				Content
			</div>
		</div>
	</div>
</body>
</html>