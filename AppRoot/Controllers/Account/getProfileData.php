<?php
	session_start();

	if (!isset($_SESSION['logged_user'])) {
		echo json_encode(null);
	} else {
		$first_name = $_SESSION['logged_user']['first_name'];
		$last_name = $_SESSION['logged_user']['last_name'];
		$email = $_SESSION['logged_user']['email'];
		$skype = $_SESSION['logged_user']['skype'];
		$gmail = $_SESSION['logged_user']['google_acc'];

		$data = [
			"first_name" => $first_name,
			"last_name" => $last_name,
			"email" => $email,
			"skype" => $skype,
			"gmail" => $gmail
		];

		echo json_encode($data);
	}
?>
