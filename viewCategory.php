<?php 
header('Content-Type: text/html; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}
require_once('inc/parser.php');
include_once('lang/de.php');
require_once('inc/db_queries.php');

if(isset($_GET['category'])){
	$dynamicReplacementArray  = array('results' => getProductsFromCategory($_GET['category']));
} else {
	//output Error 404
	include('index.php');
	exit;
}


$parsedOutput = parseHTML('suchseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
