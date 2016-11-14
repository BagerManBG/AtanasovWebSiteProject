<?php
require_once "db.class.php";
$data = $_POST;
echo "<pre>";
$data['email_log'] = mysqli_real_escape_string($db->dbHandle, $data['email_log']);
$query = "SELECT * FROM `users` WHERE `email` = '".$data['email_log']."' ";
$result = $db->fetchArray($query);
if(!empty($result))
{
	if($result[0]['password'] == md5($data['password_log']))
	{
		// 
		$_SESSION['logged_user'] = $result[0];
		header('Location: ../profile.html');
	}
	else //if username exists but password is wrong
	{
		header('Location: ../index.html');

	
	}
}
else //if no user is found
{
		header('Location: ../index.html');

	
	
}
// Login : POST -> url: localhost:port/login?username=admin&password=1234