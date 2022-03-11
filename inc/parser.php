<?php 

function parseHTML($html, $staticReplacements){

	foreach($html as $htmlLine){
		foreach($staticReplacements as $replacement){
			str_ireplace($replacement['name'], $replacement['content'], $htmlLine);
		}
	}

	return $html;

}

?>