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

if(isset($_GET['action']) && isset($_GET['id'])){
	if($_GET['action'] == 'produkt' || $_GET['action'] == 'kategorie' || $_GET['action'] == 'hersteller'){
		$viewType = $_GET['action'];
	}
	else{
		header('Location: admin.php');
		exit;
	}
}


$parsedOutput = parseHTML('bearbeiten/'.$viewType.'.html',array(), array());

foreach($parsedOutput as $line){
	echo $line;
}

?>