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

function getSha1Password($s){
  return (sha1(PASSWORD_KEY.$s));
}

//プランリスト
function getfavcourse($a) {
  $dbh = connectDb();
  $sql = "select date_id from favorites where id = ".$a." and fav_flg = 1";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $date_ids = $stmt->fetch();
  $sql = "select * from dates where id IN (".implode(",",$date_ids).") order by created desc";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $dates;
}

//思い出
function getmemories($a) {
  $dbh = connectDb();
  $sql = "select id from couples where male_id = ".$a." or female_id = ".$a;
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $couple_id = $stmt->fetch();
  $sql = "select * from dates where couple_id = ".$couple_id['id']." order by created desc";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $dates;
}

//Feed
function getfeeds($a) {
  $dbh = connectDb();
  $sql = "select couple_id from follows where user_id = ".$a;
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $couple_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);
  $sql = "select * from dates where couple_id IN (".implode(",",$couple_ids).") order by created desc";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $dates;
}

//特集
function getspecials($a) {
  $dbh = connectDb();
  $sql = "SELECT *,COUNT(*) 
      FROM dates 
      LEFT JOIN favorites 
      ON dates.id = favorites.date_id 
      GROUP BY favorites.date_id
      ORDER BY COUNT(*) DESC
      LIMIT 20;";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $specials = $stmt->fetch();
  return $specials;
}

//他のカップルの情報取得
function getcouple($a) {
  $dbh = connectDb();
  $sql = "select * from couples where id = ".$a." order by created desc";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $couple = $stmt->fetch(PDO::FETCH_ASSOC);
  return $couple;
}

function getdates($a) {
  $dbh = connectDb();
  $sql = "select * from dates where couple_id = ".$a." order by created desc";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $dates;
}

function getdatefromid($a) {
  $dbh = connectDb();
  $sql = "select * from dates where id = ".$a;
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $date = $stmt->fetch(PDO::FETCH_ASSOC);
  return $date;
}

function getposts($a) {
  $dbh = connectDb();
  $sql = "select * from posts where date_id = ".$a." order by created";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $dates;
}

function getlocation($a) {
  $dbh = connectDb();
  $sql = "select location from posts where date_id = ".$a." limit 1";
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $dates = $stmt->fetch();
  return $dates['location'];
}

function getphotos($a) {
  $dbh = connectDb();
  $sql = "select * from photos where post_id = ".$a;
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $photos = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $photos;
}

function getuser($a) {
  $dbh = connectDb();
  $sql = "select * from users where id = ".$a;
  $stmt = $dbh->query($sql);
  $stmt->execute;
  $user = $stmt->fetch(PDO::FETCH_ASSOC);
  return $user;
}
