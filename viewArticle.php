<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
include_once('inc/setLang.php');
require_once('inc/parser.php');
require_once('inc/db_inc.php');
require_once('inc/connect.php');

$staticArray = array();
$staticArray = array_merge($staticArray, $langReplacementArray);

if(isset($_GET['id'])){

	$produkteQuery = "SELECT *, k.name as kategorieName, h.name as herstellerName, produkt.name as name, produkt.beschreibung as beschreibung, FORMAT((produkt.preis_normal * (1 - produkt.rabatt/100)),2) as preis FROM produkt JOIN kategorie k on k.id = produkt.kategorie JOIN hersteller h on h.id = produkt.hersteller WHERE produkt.id = :id";

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
	$produktArray[2] = array('name' => 'preis', 'content' => $produkt['preis']);
	$produktArray[3] = array('name' => 'rabatt', 'content' => $produkt['rabatt']);
	$produktArray[4] = array('name' => 'kategorie', 'content' => $produkt['kategorie']);
	$produktArray[5] = array('name' => 'hersteller', 'content' => $produkt['hersteller']);
	$produktArray[6] = array('name' => 'bild', 'content' => $produkt['bild']);
	$produktArray[7] = array('name' => 'kategorieName', 'content' => $produkt['kategorieName']);
	$produktArray[8] = array('name' => 'herstellerName', 'content' => $produkt['herstellerName']);
	$produktArray[9] = array('name' => 'id', 'content' => $produkt['id']);

	$staticArray = array_merge($staticArray, $produktArray);
}

$parsedOutput = parseHTML('produktseite.html',$staticArray, array());

foreach($parsedOutput as $line){
	echo $line;
}

?>
