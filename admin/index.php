<?php
declare(strict_types=1); //Жесткую типизацию Необходимо писать именно в начале!

ini_set('error_reporting', (string)E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

$br="<br>";	

function my_scandir($dir) {
	$files = scandir($dir);
	if (!$files) {
    	die('Операция не удалась');
	} elseif ($files[0] == '.' && $files[1] == '..') {
		unset($files[0], $files[1]);
		sort($files);
		return $files;  
	} else {
		die('Ошибка файловой системы');
	}
}
function cards($allProducts) {
	$br="<br>";	
	foreach ($allProducts as $product) {
		$id          = $product->getId();

		$url         = $product->getUrl();
		$files       = my_scandir($url);
		$fullImgPath = $url.$files[0];

		$name        = $product->getName();
		$price       = $product->getPrice();
		$oldPrice    = $product->getOldPrice();
		$currency    = $product->getCurrency();

		echo "<div>";
			echo "<a href= \"card.php?id=$id&fullImgPath=$fullImgPath\" target=\"_blank\" class=\"card\">";
		 		echo "<figure class=\"img_pic\">";
	   				echo "<img src= \"$fullImgPath\" width=\"180\" class=\"img_pic\">";
	   				echo "<figcaption>";
	   				echo "$br $id. $name";
	   				if ($oldPrice > 0) {
	   					echo "$br <b>Скидка! <s>$oldPrice $currency </s></b>";
	   				}
	   				echo "$br <b> $price $currency </b>";
	   				echo "</figcaption>";
	   			echo "</figure>";
			echo "</a>";
	  	echo "</div>";
	}
}
function db_connect () {
	$link = mysqli_connect("localhost", "andrey", "and321", "shogo");
	if (!$link) {
		die (mysqli_connect_error($link));
	} 
	return $link;
}

?>	

<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../public/css/null_style.css">
	<link rel="stylesheet" href="../public/css/mystyle.css">
	<title>Тестовое задание</title>
</head>
<body>
<h1>Визуализация товаров</h1>

<div class="container">	
<?php

	require_once('code/classes/simpleproduct.php');

	$link1 = db_connect();
	$result = mysqli_query($link1, "SELECT * FROM product");
	$products = [];
	while ($row = mysqli_fetch_assoc ($result)) {
		$id         = (int)$row['id']; 
		$name       = $row['name'];
		$price      = (float)$row['price'];
		$oldPrice   = (float)$row['price_old'];
		$position   = (int)$row['position'];
		$url        = $row['url'];
		$currencyId = (int)$row['currency_id'];

		$currencyRes = mysqli_query($link1, "SELECT cur_name FROM currency WHERE id=$currencyId");
		$currencyRes = mysqli_fetch_assoc ($currencyRes);
		$currency = $currencyRes['cur_name'];

		$products[] = new SimpleProduct($id, $name, $url, $currency, $price, $oldPrice, $position);
	}
	
	//Cортируем по свойству position
	
	usort($products, function($prod1, $prod2) {
    	return ($prod1->getPosition() > $prod2->getPosition()) ? 1 : -1;});
	
	//Выводим карточки из базы данных
	cards($products);

	mysqli_close ($link1);

?>

</div>

</body>
</html>