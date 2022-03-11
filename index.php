
<?php 

require_once('inc/parser.php');

$htmlFile = file('HTML-Templates/startseite.html');

include_once('lang/de.php');


$parsedOutput = parseHTML($htmlFile,$langReplacementArray);

foreach($parsedOutput as $line){
	echo $line;
}

?>
