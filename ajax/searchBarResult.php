<?php
header('Content-Type: text/json; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

require_once('../inc/db_queries.php');

if(isset($_GET['searchQuery'])){
	$searchQuery = $_GET['searchQuery'];
	$products = getShortProductsFromSearchQuery($searchQuery);
	echo json_encode($products);
}

?>