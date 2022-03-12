
<?php 
require_once('inc/parser.php');
include_once('lang/de.php');



$dynamicReplacementArray  = array('Highlights' => array(array('name' => 'RTX 3090'),array('name' => 'RTX 3080'),array('name' => 'RTX 3070'),array('name' => 'RTX 3060')));



$parsedOutput = parseHTML('startseite.html',$langReplacementArray, $dynamicReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
