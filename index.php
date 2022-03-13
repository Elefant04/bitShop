<?php 
header('Content-Type: text/html; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

include_once('inc/setLang.php');
require_once('inc/parser.php');
require_once('inc/db_queries.php');


$dynamicReplacementArray  = array('Highlights' => getMostExpensiveProducts());



$parsedOutput = parseHTML('startseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
