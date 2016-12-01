<?php 

require_once('../../Models/Database/db.class.php');

$email = $_POST['email'];
$time = time();

$q = "SELECT * FROM `chat_users` WHERE `email` = '$email'";

$data = $db->fetchArray($q);
$data[0]['last_time_online'] = $time;

$db->saveArray('chat_users', $data);

?>