<?php
require_once('config.php');
require_once('function.php');

$user_id = $_POST['user_id'];
$date_id = $_POST['date_id'];

$dbh = connectDb();
$sql = "select * from dates where id = ".$date_id;
$stmt = $dbh->query($sql);
$stmt->execute;
$date = $stmt->fetch();
$sql = "select * from follows where user_id = ".$user_id." and couple_id = ".$date["couple_id"];
$stmt = $dbh->query($sql);
$stmt->execute;
$follow = $stmt->fetch();
if (empty($follow)) {
  $sql = "insert into follows (fav_flg, user_id,  couple_id, created, modified) values (1, ".$user_id.", ".$date["couple_id"].", NOW(), NOW())";
  $stmt = $dbh->query($sql);
  $stmt->execute;
} else {
  if ($follow["fav_flg"] == 1){
    $sql = "update follows set fav_flg = 0 where user_id = ".$user_id." and couple_id = ".$date["couple_id"];
    $stmt = $dbh->query($sql);
    $stmt->execute;
  } else {
    $sql = "update follows set fav_flg = 1 where user_id = ".$user_id." and couple_id = ".$date["couple_id"];
    $stmt = $dbh->query($sql);
    $stmt->execute;   
 }
}

header("Location: datecourse.php?id=$date_id", true, 301);
exit();