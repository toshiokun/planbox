<?php
require 'TwistOAuth.phar';
$code = 200;

// Set your timezone.
date_default_timezone_set('Asia/Tokyo');


try {
    // Generate your TwistOAuth object.
    $to = new TwistOAuth('9ELmNVrSHQih0oFF8Dlr19L7D', '1NjLEN4bjL5WqYwgsh4G1LQKc0SSgjucoeNeETOQ7p6juxduFq', '2720934722-wa7bZMpCBKUtKoRatXGIsUWKt60WZ0f2evJi7TG', 'YACgr4Vh3RjzzSCQ8b3EEGKzPqgJ9umtFKmaP4wFlKLgj');

} catch (TwistException $e) {

    // Set error message.
    $error = $e->getMessage();

    // Overwrite HTTP status code.
    // The exception code will be zero when it thrown before accessing Twitter, we need to change it into 500.
    $code = $e->getCode() ?: 500;

}
// Disable timeout.
set_time_limit(0);

// Finish all buffering.
while (ob_get_level()) {
    ob_end_clean();
}

// Start streaming.
$to->streaming('user', function ($status) {
    // Treat only tweets.
   
    if (isset($status->text)) {
    $Hash = '#PlanBox';
     $pos = strpos($status->text, $Hash);
    if($pos!==false)
     {
    $time=strtotime($status->created_at);
//渡すもの$status->text(コメント),$status->created_at(時間),$status->user->screenname(ユーザ名),$status->entities->media[0]->media_url(画像のurl),&status->coordinates(緯度経度(配列))

      echo $status->entities->media[0]->media_url;
         printf(
            "<br />@%s: %s\n,<br />%s",
            $status->user->screen_name,
       //       
            htmlspecialchars_decode($status->text, ENT_NOQUOTES),
            
        $status->created_at
       $status->entities->media[0]->media_url,
     //  $status->coordinates->coordinates[0]
           
        );
        flush(); // Required if running not on Command Line but on Apache
    }
    }
});
?>