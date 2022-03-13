<?php
	$langFromGetValid = false;
	if(isset($_GET['lang'])){
		if($_GET['lang'] === 'en'){
			$lang = $_GET['lang'];
			$langFromGetValid = true;
		} else if ($_GET['lang'] === 'de'){
			$lang = $_GET['lang'];
			$langFromGetValid = true;
		}
		if($langFromGetValid){
			setcookie('lang', $lang, time()+60*60*24*365*10, '/', '');
		} else{
			$lang = 'de';
		}
	} else if(isset($_COOKIE['lang'])){
		$lang = $_COOKIE['lang'];
	} else {
		$lang = 'de';
	}


	if( $lang === 'de' ||	$lang === 'en' ){
		include_once('lang/'.$lang.'.php');
	} else {
		include_once('lang/de.php');
	}
?>