<?php 
require_once('inc/parser.php');
include_once('lang/de.php');


$parsedOutput = parseHTML('einkaufswagen.html',$langReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
