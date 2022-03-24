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

if(isset($_GET['action'])){
	if($_GET['action'] == 'produkt' || $_GET['action'] == 'kategorie' || $_GET['action'] == 'hersteller'){
		$viewType = $_GET['action'];
	}
	else{
		header('Location: admin.php');
		exit;
	}
}

if($viewType == 'produkt'){
	$query = "SELECT *,p.id as id, p.name as name, h.name as herstellerName , k.name as kategorieName FROM produkt p JOIN hersteller h ON p.hersteller = h.id JOIN kategorie k ON p.kategorie = k.id";
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$result = $prepStat -> fetchAll();
} else if($viewType == 'hersteller'){
	$query = "SELECT * FROM hersteller";
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$result = $prepStat -> fetchAll();
} else if($viewType == 'kategorie'){
	$query = "SELECT * FROM kategorie";
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$result = $prepStat -> fetchAll();
} 


$parsedOutput = parseHTML('anzeigen/'.$viewType.'.html',array(), array('Data' => $result));

foreach($parsedOutput as $line){
	echo $line;
}

?>