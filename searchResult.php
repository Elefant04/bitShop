<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
require_once('inc/parser.php');
include_once('lang/de.php');


$dynamicReplacementArray  = array('results' => array());


$parsedOutput = parseHTML('suchseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
