<?php 
header('Content-Type: text/html; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

require_once('inc/checkLogin.php');
require_once('inc/parser.php');

if(!isLogedIn()){
	header('Location: login.php');
	exit;
}


$parsedOutput = parseHTML('adminHome.html',array(), array());

foreach($parsedOutput as $line){
	echo $line;
}

?>