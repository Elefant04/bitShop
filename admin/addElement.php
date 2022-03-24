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
else{
	header('Location: admin.php');
	exit;
}

$dynamicArray = array();

if($viewType == 'produkt'){
	$query = 'SELECT * FROM kategorie';
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
	$kategorien = $prepStat -> fetchAll();
	$dynamicArray['kategorien'] = $kategorien;

	$query = 'SELECT * FROM hersteller';
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
	$hersteller = $prepStat -> fetchAll();
	$dynamicArray['hersteller'] = $hersteller;
}



if(isset($_POST['submit'])){
	if($viewType == 'produkt'){
		produktErfassen();
	} else if($viewType == 'kategorie'){
		kategorieErfassen();
	} else if($viewType == 'hersteller'){
		herstellerErfassen();
	}
}


$parsedOutput = parseHTML('erfassen/'.$viewType.'.html',array(), $dynamicArray);

foreach($parsedOutput as $line){
	echo $line;
}

function produktErfassen(){
	global $db;



	$name = $_POST['name'];
	$beschreibung = $_POST['beschreibung'];
	$preis_normal = $_POST['preis'];
	$rabatt = $_POST['rabatt'];
	$kategorie = $_POST['kategorie'];
	$hersteller = $_POST['hersteller'];

	//save image
	$target_dir = "../assets/products/";
		$target_file = $target_dir . $name . $hersteller . $kategorie . basename($_FILES["bild"]["name"]);
		$bild = $name . $hersteller . $kategorie . basename($_FILES["bild"]["name"]);
		move_uploaded_file($_FILES["bild"]["tmp_name"], $target_file);

	$query = 'INSERT INTO produkt (name, beschreibung, preis_normal, rabatt, bild, kategorie, hersteller) VALUES (:name, :beschreibung, :preis_normal, :rabatt, :bild, :kategorie, :hersteller)';
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindParam(':name', $name);
		$prepStat -> bindParam(':beschreibung', $beschreibung);
		$prepStat -> bindParam(':preis_normal', $preis_normal);
		$prepStat -> bindParam(':rabatt', $rabatt);
		$prepStat -> bindParam(':bild', $bild);
		$prepStat -> bindParam(':kategorie', $kategorie);
		$prepStat -> bindParam(':hersteller', $hersteller);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
}

function kategorieErfassen(){
	global $db;

	$name = $_POST['name'];
	$beschreibung = $_POST['beschreibung'];

	$query = 'INSERT INTO kategorie (name, beschreibung) VALUES (:name, :beschreibung)';
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindParam(':name', $name);
		$prepStat -> bindParam(':beschreibung', $beschreibung);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
}

function herstellerErfassen(){
	global $db;

	$name = $_POST['name'];

	$query = 'INSERT INTO hersteller (name) VALUES (:name)';
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindParam(':name', $name);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
}

?>