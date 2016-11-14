<?php
require_once "db.class.php";
$data = $_POST;
echo "<pre>";
$data['username_log'] = mysqli_real_escape_string($db->dbHandle, $data['username_log']);
$query = "SELECT * FROM `users` WHERE `username_sign` = '".$data['username_log']."' ";
$result = $db->fetchArray($query);
if(!empty($result))
{
	if($result[0]['password_sign'] == md5($data['password_log']))
	{
		// 
		$_SESSION['logged_user'] = $result[0];
		header('Location: ../index.php');
	}
	else //if username exists but password is wrong
	{
		header('Location: ../index.php');

	
	}
}
else //if no user is found
{
		header('Location: ../index.php');

	
	
}
// Login : POST -> url: localhost:port/login?username=admin&password=1234