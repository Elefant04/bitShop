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

$dynamicArray = array();
$staticArray = array();

if($viewType == 'produkt'){

	$produkteQuery = "SELECT *, k.name as kategorieName, h.name as herstellerName, produkt.name as name, produkt.beschreibung as beschreibung FROM produkt JOIN kategorie k on k.id = produkt.kategorie JOIN hersteller h on h.id = produkt.hersteller WHERE produkt.id = :id";

	try{
		$produkteStat = $db -> prepare($produkteQuery);
		$produkteStat -> bindValue(':id', $_GET['id']);
		$produkteStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$produkt = $produkteStat -> fetch();
	
	$produktArray[0] = array('name' => 'name', 'content' => $produkt['name']);
	$produktArray[1] = array('name' => 'beschreibung', 'content' => $produkt['beschreibung']);
	$produktArray[2] = array('name' => 'preis', 'content' => $produkt['preis_normal']);
	$produktArray[3] = array('name' => 'rabatt', 'content' => $produkt['rabatt']);
	$produktArray[4] = array('name' => 'kategorie', 'content' => $produkt['kategorie']);
	$produktArray[5] = array('name' => 'hersteller', 'content' => $produkt['hersteller']);
	$produktArray[6] = array('name' => 'bild', 'content' => $produkt['bild']);
	$produktArray[7] = array('name' => 'kategorieName', 'content' => $produkt['kategorieName']);
	$produktArray[8] = array('name' => 'herstellerName', 'content' => $produkt['herstellerName']);
	$produktArray[9] = array('name' => 'id', 'content' => $produkt['id']);

	$staticArray = array_merge($staticArray, $produktArray);

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

	
} else if($viewType == 'hersteller'){
	$query = "SELECT * FROM hersteller WHERE id = :id";
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindValue(':id', $_GET['id']);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$hersteller = $prepStat -> fetch();
	$herstellerArray[0] = array('name' => 'name', 'content' => $hersteller['name']);
	$herstellerArray[1] = array('name' => 'id', 'content' => $hersteller['id']);

	$staticArray = array_merge($staticArray, $herstellerArray);

} else if($viewType == 'kategorie'){
	$query = "SELECT * FROM kategorie WHERE id = :id";
	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindValue(':id', $_GET['id']);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		exit;
	}
	$kategorie = $prepStat -> fetch();
	$kategorieArray[0] = array('name' => 'name', 'content' => $kategorie['name']);
	$kategorieArray[1] = array('name' => 'beschreibung', 'content' => $kategorie['beschreibung']);
	$kategorieArray[2] = array('name' => 'id', 'content' => $kategorie['id']);

	$staticArray = array_merge($staticArray, $kategorieArray);
}


$parsedOutput = parseHTML('bearbeiten/'.$viewType.'.html',$staticArray, $dynamicArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>