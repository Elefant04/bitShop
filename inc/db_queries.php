<?php

	include_once('db_inc.php');
	include_once('connect.php');


	function getAllProducts(){
		global $db;
		$query = "SELECT *, p.name as produktName FROM produkt p JOIN hersteller h ON p.hersteller = h.id JOIN kategorie k ON p.kategorie = k.id";
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
		return $prepStat -> fetchAll();
	}

	function getMostExpensiveProducts(){
		global $db;
		$query = "SELECT *, p.name as produktName FROM produkt p JOIN hersteller h ON p.hersteller = h.id JOIN kategorie k ON p.kategorie = k.id ORDER BY (p.preis_normal * (1 - p.rabatt/100)) DESC LIMIT 5";
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
		return $prepStat -> fetchAll();
	}

	function getProductsFromCategory($kategorie){
		global $db;
		$query = "SELECT *, p.name as produktName FROM produkt p JOIN hersteller h ON p.hersteller = h.id JOIN kategorie k ON p.kategorie = k.id WHERE p.kategorie = :kategorieId";
		try{
			$prepStat = $db -> prepare($query);
			$prepStat -> bindParam(':kategorieId', $kategorie);
			$prepStat -> execute();
		} catch (PDOException $e) {
			echo '<p>Verbindung fehlgeschlagen!</p>';
			if(ini_get('display_errors')){
				echo '<p>' . $e -> getMessage();
			}
			exit;
		}
		return $prepStat -> fetchAll();
	}

?>