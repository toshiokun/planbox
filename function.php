<?php

function connectDb(){
	try {
		return new PDO(DSN, DB_USER, DB_PASSWORD);
	} catch (PDOException $e){
		echo $e->getMessage();
		exit;
	}
}

function h($s) {
	return htmlspecialchars($s, ENT_QUOTES, "UTF-8");
}

function setToken() {
	$token = sha1(uniqid(mt_rand(), true));
	$_SESSION['token'] = $token;
}

function checkToken() {
	if (empty($_SESSION['token']) || ($_SESSION['token'] != $_POST['token'])) {
		echo "不正な処理が行われました。";
		exit;
	}
}

function emailExist($email, $dbh){
	$sql = "select * from users where email = :email limit 1";
	$stmt = $dbh->prepare($sql);
	$stmt->execute(array(":email" => $email));
	$user = $stmt->fetch();
	return $user ? true : false;
}

function userExist($facebook_id, $dbh){
	$sql = "select * from users where facebook_id = :facebook_id limit 1";
	$stmt = $dbh->prepare($sql);
	$stmt->execute(array(":facebook_id" => $facebook_id));
	$user = $stmt->fetch();
	return $user ? true : false;
}



function getSha1Password($s){
	return (sha1(PASSWORD_KEY.$s));
}

//プランリスト
function getfavcourse($a) {
  $dbh = connectDb();
  $sql = "select date_id from favorites where id = ".$a." and fav_flg = 1;";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $date_ids = $stmt->fetch();
  $sql = "select * from dates where date_id IN (".implode(",",$dates_id).") order by created desc;";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetch();
  return $user;
}

//思い出
function getmemories($a) {
  $dbh = connectDb();
  $sql = "select id from couples where male_id = ".$a." or  female_id = ".$a.";";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $couple_id = $stmt->fetch();
  $sql = "select * from dates where couple_id = ".$couple_id." order by created desc;";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetch();
  return $user;
}

//Feed
function getfeeds($a) {
  $dbh = connectDb();
  $sql = "select followed_id from follows where follow_id = ".$a.";";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $followed_ids = $stmt->fetch();
  $sql = "select * from dates where couple_id IN (".implode(",",$followed_ids).") order by created desc;";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetch();
  return $user;
}

