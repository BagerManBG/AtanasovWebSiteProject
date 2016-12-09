<?php 

require_once "../../Models/Database/db.class.php";

$message = $_POST['message_data']['message'];
$message = htmlentities($message, ENT_HTML5 | ENT_QUOTES, 'UTF-8');


$sender_id = $_POST['message_data']['sender_id'];
$receiver_id = $_POST['message_data']['receiver_id'];
$time = time();

$data = array(
	'message' => $message,
	'send_time' => $time,
	'sender_id' => $sender_id,
	'receiver_id' => $receiver_id
);



$db->saveArray('messages', $data);

?>