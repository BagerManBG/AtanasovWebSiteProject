<?php 

require_once "../../Models/Database/db.class.php";

if(isset($_SESSION['logged_user']))
{
	$user_email = $_SESSION['logged_user']['email'];
	$q = "SELECT * FROM `chat_users` WHERE `email` = '".$user_email."'";
	$result = $db->fetchArray($q);
	
	echo $result[0]['id'];
}
else
{
	echo 'error';
}

?>