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
			padding:10px 0px 10px 0px;
		}
		.menu li{
			text-align: center;
			padding:10px 20px 10px 20px;
			color: white;
			list-style: none;
		}
		.menu li.active{
			border-radius: 20px;
			background: #4b82bd;
		}
		.menu li a{
			font-weight: bold;
			color: white;
			cursor:pointer;
			text-decoration: none;
		}
	</style>
	<script src="app/SurveySystem.js"></script>
	<script src="app/controllers/SessionController.js"></script>
	<script src="app/controllers/MenuController.js"></script>


	<title>Encuesta ULA - UDO</title>
</head>
<body>
	<div style="width:100%;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);">
		<div style="height:100px; background: #007bff;" class="container-fluid">
			<div class="row" style="padding-top: 4px;">
				<div class="col-md-2">
					<img src="assets/ula.png" alt="" height="90">
					&nbsp;&nbsp;
					<img src="assets/udo.png" alt="" width="90">
				</div>
				<div class="col-md-10" style="color: white; font-weight: bold; padding-top: 10px">
					Linea 1
					<br/>
					Linea 2
					<br/>
					Linea 3
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="">
		<div class="row" style="height:100vh">
			<div class="col-md-2" style="background: #007bff;box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);">
				<ul class="menu">
					<li class="active">
						<a href="/SurveySystem/">Inicio</a>
					</li>
				    <li ng-controller="MenuController">
				    	<a id="Encuestas" ng-click="obtener($event)">Encuestas</a>
				    </li>
				    <li ng-controller="MenuController">
				    	<a id="Datos" ng-click="obtener($event)">Mis datos</a>
				    </li>
				    <li ng-controller="SessionController">
				    	<a ng-click="logout()" href="#">
				    Salir</a>
				</li>
				</ul>
			</div>
			<div class="col-md-10" id="content">
				Home
			</div>
		</div>
	</div>
</body>
</html>