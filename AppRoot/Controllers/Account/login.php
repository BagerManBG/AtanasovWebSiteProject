<?php
	require_once "../../Models/Database/db.class.php";

	$data = [
		'email' => $_POST['log_data'][0],
		'password' => $_POST['log_data'][1],
	];

	$query = "SELECT * FROM `users` WHERE `email` = '".$data['email']."' ";
	$result = $db->fetchArray($query);

	if(!empty($result))
	{
		if($result[0]['password'] == md5($data['password']))
		{ 
			unset($result[0]['password']);
			unset($result[0]['secret_question']);
			unset($result[0]['secret_answer']);

			$_SESSION['logged_user'] = $result[0];

			echo 'OK';
		}
		else //if username exists but password is wrong
		{
			
		}
	}
	else //if no user is found
	{

	}
?>