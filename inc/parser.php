<?php 

function parseHTML($html, $staticReplacements){

	for($i = 0; $i < count($html); $i++){
		foreach($staticReplacements as $replacement){
			$html[$i] = str_replace($replacement['name'], $replacement['content'], $html[$i]);
		}
	}

	return $html;

}

?>