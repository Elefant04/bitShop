<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
include_once('inc/setLang.php');
require_once('inc/parser.php');
require_once('inc/db_queries.php');

if(!isset($_GET['searchQuery'])){
	header('Location: index.php');
	exit;
}
$dynamicReplacementArray  = array('results' => getProductsFromSearchQuery($_GET['searchQuery']));


$parsedOutput = parseHTML('suchseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
