<?php 

function parseHTML($htmlPath, $staticReplacements,$dynamicReplacements = array()){

	$html = file('HTML-Templates/' . $htmlPath);
	for($i = 0; $i < count($html); $i++){

		if(preg_match('/^[+]{1}[+]{1}[-]{1}\w+[-]{1}[+]{1}[+]{1}$/',trim($html[$i]))){
			$trimmedLine = trim($html[$i]);
			$modulePath = 'shared/'.substr($trimmedLine,3,strlen($trimmedLine)- 6).'.html';
			$moduleOutput = parseHTML($modulePath, $staticReplacements,$dynamicReplacements);
			$html[$i] = '';
			foreach($moduleOutput as $line){
				$html[$i] = $html[$i] . $line;
			}
		} elseif(preg_match('/^[@]{1}[@]{1}[@]{1}[-]{1}\w+[-]{1}[@]{1}[@]{1}[@]{1}$/',trim($html[$i]))){
			$startMarkerLine = $i;
			if($i + 2 < count($html)){
				$startReplacementLine = $i + 1;
				$endMarkerLine = 0;
				for($j = $i + 1;$j < count($html); $j++){
					if(trim($html[$j]) === '@@@end@@@'){
						$endMarkerLine = $j;
						break;
					}
				}
				if($endMarkerLine && $endMarkerLine != $startReplacementLine){

					$outputs = array();

					$dynamicArray = $dynamicReplacements[substr(trim($html[$startMarkerLine]),4,strlen(trim($html[$startMarkerLine]))- 8)];

					for($k = 0; $k < count($dynamicArray); $k++){
						$currentItem = $dynamicArray[$k];
						$currentItemKeys = array_keys($currentItem);
						$output = '';
						for($l = $startReplacementLine; $l < $endMarkerLine; $l++){
							$intermediateLine = $html[$l];
							foreach($staticReplacements as $replacement){
								$intermediateLine = str_replace($replacement['name'], $replacement['content'], $intermediateLine);
							}
							foreach ($currentItemKeys as $itemKey) {
								$intermediateLine = str_replace('@@#-' . $itemKey. '-#@@', $currentItem[$itemKey], $intermediateLine);
							}

							$output = $output . $intermediateLine;
						}

						$outputs[$k] = $output;
					}
					for($k = $startMarkerLine; $k <= $endMarkerLine; $k++){
						$html[$k] = '';
					}

					$outputAsString = '';

					foreach($outputs as $outputLine){
						$outputAsString = $outputAsString . $outputLine;
					}
					$html[$startMarkerLine] = $outputAsString;
				}
			}
		}
		else{
			foreach($staticReplacements as $replacement){
				$html[$i] = str_replace('###_' . $replacement['name'] . '_###', $replacement['content'], $html[$i]);
			}
		}
	}

	return $html;

}

?>