<?php 
$dsn = 'mysql:host=' . $host . ';dbname=' . $database;
$options = [PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'];
try{
	$db = new PDO($dsn, $user, $password, $options);
	$db -> setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
	echo '<p>Verbindung fehlgeschlagen!</p>';
	if(ini_get('display_errors')){
		echo '<p>' . $e -> getMessage();
	}
	exit;
}
?>