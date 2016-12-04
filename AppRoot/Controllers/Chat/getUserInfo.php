<?php 

require_once('../../Models/Database/db.class.php');

$id = $_POST['id'];

$q = "SELECT * FROM `chat_users` WHERE `id` = $id";

$result = $db->fetchArray($q);

if(!empty($result))
{
	foreach ($result as $key => $value) 
	{
		unset($value['role_id']);
		unset($value['last_time_online']);
		print json_encode($value);
	}
}
else
{
	echo 'error';
}

?>