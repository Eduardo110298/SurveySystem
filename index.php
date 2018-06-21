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
		.table tr td a{
			cursor:pointer;
		}
		.table tr td.action{
			color:white;
		}
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
	<script src="app/controllers/SurveyController.js"></script>
	<script src="app/controllers/UserController.js"></script>
	<script>
		var userData = <?php echo json_encode($_SESSION["user"]); ?>;
		app.run(function($rootScope){
			$rootScope.userData = userData;
		});
	</script>
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
					Universidad de Los Andes - Universidad de Oriente
					<br/>
					Criminología - Lic. Informática
					<br/>
					Merida - Nueva Esparta
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
				    	<a id="Encuestas" ng-click="obtener($event)">Encuestas por Hacer</a>
				    </li>
				    <li ng-controller="MenuController">
				    	<a id="EncuestasRealizadas" ng-click="obtener($event)">Encuestas Hechas</a>
				    </li>
				    <div ng-if="userData.rol=='administrador'">
					    <li ng-controller="MenuController">
					    	<a id="Combinaciones" ng-click="obtener($event)">Combinaciones</a>
					    </li>
				    </div>
				    <li ng-controller="MenuController">
				    	<a id="Datos" ng-click="obtener($event)">Mis datos</a>
				    </li>
				    <li ng-controller="SessionController">
				    	<a ng-click="logout()" href="#">
				    Salir</a>
				</li>
				</ul>
			</div>
			<div class="col-md-10" id="content" >
				<div style="padding-top:10px">
					<div class="page-header">
						<h3>Bienvenido</h3>
					</div>
					<div style="text-align: justify; line-height: 26px; padding: 20px 50px 20px 20px">
						Buenas días/tardes soy estudiante de la Escuela de Criminología de la Universidad de los Andes y estoy desarrollando una investigación sobre los factores sociales que afecten el desempeño individual y/o comunitario de los estudiantes en su institución académica; y al mismo tiempo ofrecer una asesoría o intervención criminológica que les permita identificar dichos elementos y las posibles soluciones que podrían orientarlos para la mejora de los factores expuestos.<br/>
						Agradezco toda su colaboración para que me ayude a completar el instrumento que es totalmente ANÓNIMO, participando en las encuestas que tendran disponible haciendo click en la seccion de Encuestas por Hacer.<br/> 
						Sin más que agregar gracias de antemano.  
					<br/>
					<br/>
						<p style="font-style: italic;">
							<b>Pasante Rahylem Jiménez</b><br/>
							rahylem26@gmail.com
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>