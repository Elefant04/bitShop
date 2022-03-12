<?php 

function parseHTML($htmlPath, $staticReplacements){

	$html = file('HTML-Templates/' . $htmlPath);
	for($i = 0; $i < count($html); $i++){

		if(preg_match('/^[+]{1}[+]{1}[-]{1}\w+[-]{1}[+]{1}[+]{1}$/',trim($html[$i]))){
			$trimmedLine = trim($html[$i]);
			$modulePath = 'shared/'.substr($trimmedLine,3,strlen($trimmedLine)- 6).'.html';
			$moduleOutput = parseHTML($modulePath, $staticReplacements);
			$html[$i] = '';
			foreach($moduleOutput as $line){
				$html[$i] = $html[$i] . $line;
			}
		}else{
			foreach($staticReplacements as $replacement){
				$html[$i] = str_replace($replacement['name'], $replacement['content'], $html[$i]);
			}
		}
	}

	return $html;

}

?>