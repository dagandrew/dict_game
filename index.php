<?php
//defaults and Smarty
require('../resources/config.php');
require('../lib/php/Smarty/Smarty.class.php');
$smarty = new Smarty();
$smarty->setTemplateDir('../smarty/templates');
$smarty->setCompileDir('../smarty/templates_c');
$smarty->setCacheDir('../smarty/cache');
$smarty->setConfigDir('../smarty/configs');

$smarty->assign('css_path', '../public_html/css');
$smarty->assign('js_path', '../public_html/js');
$smarty->assign('icon_path', '../public_html/img/icon');

$siteName = "Толи наадан";
$smarty->assign('name', $siteName);
$smarty->assign('page', '');
//for add page and for the future :)
if (isset($_GET["l"])) {
	$smarty->assign('page', "start");
	if($_GET["l"] == "easy"){
		$level = 0;
	}
	else if ($_GET["l"] == "middle"){
		$level = 1;
	}
	else if ($_GET["l"] == "hard"){
		$level = 2;
	}
	$word = "word";
	if (isset($_GET["lang"])){
		$word = "word_ru";
	}
	$words = array();
	$sql = "SELECT $word, definition FROM $kw_buryat_table WHERE level = $level && $word <> '' ORDER BY RAND()";
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result)) {
			array_push($words, array('word' => $row[$word], 'def' => $row["definition"]));
		}
		$smarty->assign('words', $words);
		mysqli_free_result($result);
	}
} 

$smarty->display('index_game.tpl');
?>
