<?php 
header('Content-Type: text/html; charset=utf-8');
session_start();
require_once('inc/parser.php');
include_once('lang/de.php');


$parsedOutput = parseHTML('startseite.html',$langReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
