<?php
	session_start();

	$first_name = $_SESSION['logged_user']['first_name'];
	$last_name = $_SESSION['logged_user']['last_name'];
	$email = $_SESSION['logged_user']['email'];

	$data = [
		"first_name" => $first_name,
		"last_name" => $last_name,
		"email" => $email
	];

	echo json_encode($data);
?>