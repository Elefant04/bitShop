<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
include_once('inc/setLang.php');
require_once('inc/parser.php');


$parsedOutput = parseHTML('einkaufswagen.html',$langReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
