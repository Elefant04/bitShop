<?php 
header('Content-Type: text/json; charset=utf-8');
if(!isset($_SESSION)){
	session_start();
}

require_once('../inc/db_queries.php');

if(isset($_GET['start']) && isset($_GET['rowcount'])){
	$start = $_GET['start'];
	$rowcount = $_GET['rowcount'];
} else {
	$start = 0;
	$rowcount = 5;
}

if(isset($_GET['kategorie'])){
	$kategorie = $_GET['kategorie'];
	$products = getRangeOfProductsFromCategory($kategorie, $start, $rowcount);
	echo json_encode($products);
	exit;
} 

if(isset($_GET['searchQuery'])){
	$searchQuery = $_GET['searchQuery'];
	$products = getProductsFromRangeOfSearchQuery($searchQuery, $start, $rowcount);
	echo json_encode($products);
	exit;
}
