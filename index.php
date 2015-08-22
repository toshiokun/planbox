 <? 
require_once('config.php');
require_once('function.php');

//データベースに接続
$dbh = connectDb();

//universityの情報を取得
$universities = array();
$sql = "select * from universities";
foreach($dbh->query($sql) as $row){
    array_push($universities,$row);
}

?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
</body>
</html>