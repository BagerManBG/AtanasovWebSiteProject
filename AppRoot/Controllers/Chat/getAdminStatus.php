<?php 

header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');

require_once('../../Models/Database/db.class.php');

$q = "SELECT * FROM `chat_users` WHERE `role` = 1";
$data = $db->fetchArray($q);

$curr_time = time();
$admn_time = $data[0]['last_time_online'];

//echo $curr_time . '<br>';
//echo $admn_time;

if($curr_time - $admn_time > 5)
{
	echo "data: Offline\n\n";
}
else
{
	echo "data: Online\n\n";
}

ob_flush();
flush();
?>