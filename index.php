<?php
session_start();
if(!isset($_SESSION['user'])){ //if login in session is not set
    header("Location: login.php");
}

?>

<!DOCTYPE html>
<html>
<head>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/angularjs/1.6.10/angular.min.js"></script>
	<script src="resources/jquery/3.3.1/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
	<title>Encuesta ULA - UDO</title>
</head>
<body>
	INDEX
</body>
</html>