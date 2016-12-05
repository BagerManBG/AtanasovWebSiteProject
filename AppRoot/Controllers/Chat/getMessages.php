<?php 

require_once('../../Models/Database/db.class.php');

$user_id = $_POST['user_id'];

$q = "SELECT * FROM `messages` WHERE `sender_id` = $user_id OR `receiver_id` = $user_id ORDER BY `send_time` ASC"; 

$result = $db->fetchArray($q);

if(!empty($result))
{
	print json_encode($result);
}

?>