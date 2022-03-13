<?php 
header('Content-Type: text/html; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

require_once('inc/parser.php');
include_once('lang/de.php');
require_once('inc/db_queries.php');


$dynamicReplacementArray  = array('Highlights' => getMostExpensiveProducts());



$parsedOutput = parseHTML('startseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
