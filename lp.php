 <? 
require_once('config.php');
require_once('function.php');

//データベースに接続
$dbh = connectDb();

$favorites = getmemories(1);
var_dump($favorites);

?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
</body>
</html>