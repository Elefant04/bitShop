<?php 
header('Content-Type: text/html; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

require_once('inc/checkLogin.php');
require_once('inc/parser.php');

if(isLogedIn()){
	header('Location: admin.php');
	exit;
}

if(isset($_POST['username']) && isset($_POST['password'])){
	if(logIn($_POST['username'], $_POST['password'])){
		header('Location: admin.php');
		exit;
	}
}

$parsedOutput = parseHTML('loginPage.html',array(), array());

foreach($parsedOutput as $line){
	echo $line;
}

?>