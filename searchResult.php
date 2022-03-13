<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
include_once('inc/setLang.php');
require_once('inc/parser.php');


$dynamicReplacementArray  = array('results' => array());


$parsedOutput = parseHTML('suchseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
