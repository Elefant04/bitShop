<?php

include_once('inc/checkLogin.php');

if(isLogedIn()){
	header('Location: admin.php');
	exit;
}
else{
	header('Location: login.php');
	exit;
}