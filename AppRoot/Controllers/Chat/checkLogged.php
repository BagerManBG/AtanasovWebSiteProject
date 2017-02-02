<?php 

require_once "../../Models/Database/db.class.php";

if(isset($_SESSION['logged_user']))
{
	echo 'Okay';

	$email = $_SESSION['logged_user']['email'];
	$q = "SELECT * FROM `chat_users` WHERE `email` = '$email'";
	$result = $db->fetchArray($q);

	if(empty($result))
	{
		$data = $_SESSION['logged_user'];
		$data['last_time_online'] = time();
		unset($data['id']);
		unset($data['role']);
		$db->saveArray('chat_users', $data);
	}
}
else
{
	echo 'Please log in to use chat.';
}

?>