<?php

include_once('db_inc.php');
include_once('connect.php');

function isLogedIn(){
	if(isset($_SESSION['admin-logedIn'])){
		return true;
	}
	return false;
}


function logIn($username, $password){
	global $db;

	$query = 'SELECT * FROM admin WHERE username = :username';

	try{
		$prepStat = $db -> prepare($query);
		$prepStat -> bindValue(':username', $username);
		$prepStat -> execute();
	} catch (PDOException $e) {
		echo '<p>Verbindung fehlgeschlagen!</p>';
		if(ini_get('display_errors')){
			echo '<p>' . $e -> getMessage();
		}
		return false;
	}

	if($prepStat -> rowCount() == 1){
		$row = $prepStat -> fetch();
		if(password_verify($password, $row['password'])){
			$_SESSION['admin-logedIn'] = true;
			return true;
		}
	}
	return false;

}