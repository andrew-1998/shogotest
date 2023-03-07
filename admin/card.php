<?php
declare(strict_types=1); //Жесткую типизацию Необходимо писать именно в начале!

ini_set('error_reporting', (string)E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

function db_connect () {
	$link = mysqli_connect("localhost", "andrey", "and321", "shogo");
	if (!$link) {
		die (mysqli_connect_error($link));
	} 
	return $link;
}

$br = "<br>";	
$id = htmlspecialchars($_GET["id"]);
$fullImgPath = htmlspecialchars($_GET["fullImgPath"]);

//require_once('code/classes/simpleproduct.php');
//require_once('code/classes/fullproduct.php');

$link1 = db_connect();

$prod = mysqli_query($link1, "SELECT * FROM product WHERE id=$id");
$prod = mysqli_fetch_assoc ($prod);
$position = (int)$prod['position'];
$name       = $prod['name'];
$price      = (float)$prod['price'];
$oldPrice   = (float)$prod['price_old'];
$url        = $prod['url'];
$currencyId = (int)$prod['currency_id'];

$currencyRes = mysqli_query($link1, "SELECT cur_name FROM currency WHERE id=$currencyId");
$currencyRes = mysqli_fetch_assoc ($currencyRes);
$currency = $currencyRes['cur_name'];

$articul    = $prod['articul'];
$notice     = $prod['notice'];
$content    = $prod['content'];

$sectionIdRes = mysqli_query($link1, "SELECT section_id FROM product_assignment WHERE product_id=$id");
$sectionIdRes = mysqli_fetch_assoc ($sectionIdRes);
$sectionId = (int)$sectionIdRes['section_id'];
$sectionRes = mysqli_query($link1, "SELECT name FROM product_section WHERE id=$sectionId");
$sectionRes = mysqli_fetch_assoc ($sectionRes);
$section = $sectionRes['name'];
$typeIdRes = mysqli_query($link1, "SELECT type_id FROM product_assignment WHERE product_id=$id");
$typeIdRes = mysqli_fetch_assoc ($typeIdRes);
$typeId = (int)$typeIdRes['type_id'];
$typeRes = mysqli_query($link1, "SELECT name FROM product_type WHERE id=$typeId");
$typeRes = mysqli_fetch_assoc ($typeRes);
$type = $typeRes['name'];

//$card = new FullProduct($id, $name, $url, $currency, $price, $oldPrice, $position, 
//    $articul, $notice, $content, $section, $type);

mysqli_close ($link1);

?>

<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../public_html/css/mystyle.css">
	<title>Карточка товара</title>
</head>
<body>
<h1>Информация о товаре</h1>
<div class="container">	
	<div align="center"> <!-- Избежать выравнивания блоков по горизонтали -->
	<img src="<?= $fullImgPath ?>" alt="<?= $pName ?>" class="full_pic"><br>
	<p> <?= $id.".".$name.$br.$price." руб."; ?></p>
	</div>
</div>
<div class="container" align="center">
	<a class="redirect" href="index.php" color="red">Вернуться к выбору товара</a>
</div>

</body>
</html>