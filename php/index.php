 <? 
require_once('config.php');
require_once('function.php');

//データベースに接続
$dbh = connectDb();


?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
<p><button data-condition=false class="favoButton" data-favoNum=1>☆</button></p>
<script src="../js/jquery.js"></script>

<script>
	$(".favoButton").click(function() {
  //押されたボタンの特定
  var num = $(this).data("favonum");
  var button = this;
  //お気に入りボタンのdata-conditionで制御
  if($(this).data('condition') == false){

    //お気に入り登録
    $.ajax({
      url: 'fav.php',
      type: 'POST',
      dataType: 'json',
      data: {favonum: num},
    })
    .done(function(data, textStatus, jqXHR) {
      //登録成功
      if(data.result == true){
        //お気に入りボタンの色を黄色に
        $(button).css('backgroundColor', '#FF0');
        //お気に入りボタン状態の更新
        $(button).data('condition',true);
      }
    })
    .fail(function(data) {
      console.log("error");
    });
    
  }

  else if($(this).data('condition') == true){

    //お気に入り登録解除
    $.ajax({
      url: 'deleteFavo.php',
      type: 'POST',
      dataType: 'json',
      data: {favonum: num},
    })
    .done(function(data, textStatus, jqXHR) {
      //登録解除成功
      if(data.result == true){
        //背景色を解除
        $(button).css('backgroundColor', '');
        //お気に入りボタン状態の更新
        $(button).data('condition',false);
      }
    })
    .fail(function(data) {
      console.log("error");
    });
  }
});
</script>
</body>
</html>