<?php
require_once "../../Models/Database/db.class.php";

$data = $_POST;

echo "<pre>";
$data['email'] = mysqli_real_escape_string($db->dbHandle, $data['email']);
$query = "SELECT * FROM `users` WHERE `email` = '".$data['email']."' ";
$result = $db->fetchArray($query);
if(!empty($result))
{
	if($result[0]['password'] == md5($data['password']))
	{ 
		$_SESSION['logged_user'] = $result[0];
		header('Location: ../../Resources/Templates/login_register.html');

		
	}
	else //if username exists but password is wrong
	{
		header('Location: ../../Resources/Templates/login_register.html');
		

	
	}
}
else //if no user is found
{
		header('Location: ../../Resources/Templates/login_register.html');
		

}

//print_r($_POST);	
//print_r($_SESSION);