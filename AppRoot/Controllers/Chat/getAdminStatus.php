<?php 

require_once('../../Models/Database/db.class.php');

$q = "SELECT * FROM `chat_users` WHERE `role_id` = 1";
$data = $db->fetchArray($q);

$curr_time = time();
$admn_time = $data[0]['last_time_online'];

if($curr_time - $admn_time > 5)
{
	echo "Offline";
}
else
{
	echo "Online";
}

?>