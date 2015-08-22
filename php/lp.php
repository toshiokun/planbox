 <? 
require_once('config.php');
require_once('function.php');

//データベースに接続
$dbh = connectDb();

$dates = getmemories(1);
var_dump($favorites);

// foreach ($dates as $date) {
	$posts = getposts($dates[0]["id"]);
	//var_dump($posts);
	foreach ($posts as $post) {
		echo $post['content'];
		echo '<br>';
		$photos = getphotos($post['id']);
		foreach ($photos as $photo) {
	        echo '<img src="../images/'.$photo['filename'].'">';
		}
	}
// }

?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
</body>
</html>