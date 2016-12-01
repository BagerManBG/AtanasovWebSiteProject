<?php

require_once('../../Models/Database/db.class.php');

$time = time();

$q = "SELECT * FROM `chat_users` WHERE `role_id` = 1";

$data = $db->fetchArray($q);
$data[0]['last_time_online'] = $time;

$db->saveArray('chat_users', $data);

?>