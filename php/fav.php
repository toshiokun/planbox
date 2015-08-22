<?php
require_once('config.php');
require_once('function.php');

$fav_flg = $_POST['fav_flg'];
$user_id = $_POST['user_id'];
$date_id = $_POST['date_id'];

$dbh = connectDb();
$sql = "select * from favorites where user_id = ".$fav_flg." and date_id = ".$user_id;
$stmt = $dbh->query($sql);
$stmt->execute;
$favorite = $stmt->fetch();

if (empty($favorite)) {
	$sql = "insert into favorites (fav_flg, user_id ,date_id created, modified) values (".!$fav_flg", ".$user_id", ".$date_id", ".time()", ".time();
	$stmt = $dbh->query($sql);
	$stmt->execute;
} else {

}