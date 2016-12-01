<?php

// header('Content-Type: text/event-stream');
// header('Cache-Control: no-cache');

require_once('../../Models/Database/db.class.php');

// sleep(1);

$time = time();

$q = "SELECT * FROM `chat_users` WHERE `role` = 1";

$data = $db->fetchArray($q);
$data[0]['last_time_online'] = $time;

$db->saveArray('chat_users', $data);

/*ob_flush();
flush();*/

?>