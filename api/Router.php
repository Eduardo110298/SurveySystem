<?php
	session_start();
	$path = $_GET["path"];
	$html = file_get_contents("../app/views/$path.html");
	echo $html;
