<?php

	require_once "../../Models/Database/db.class.php";

	$data = [
		'first_name' => $_POST['reg_data'][0],
		'last_name' => $_POST['reg_data'][1],
		'email' => $_POST['reg_data'][2],
		'password' => $_POST['reg_data'][3],
		'password_confirm' => $_POST['reg_data'][4],
        'skype' => $_POST['reg_data'][5],
        'google_acc' => $_POST['reg_data'][6]
	];

	$hasError = false;

	$q = "SELECT * FROM `users` WHERE `email` = '".$data['email']."'";
	$result = $db->fetchArray($q);

	if(!empty($result)) {
		$hasError = true;
	}

	CheckName($data['first_name']);
	CheckName($data['last_name']);
	CheckEmail($data['email']);
	CheckPassword($data['password']);
	CheckPasswordConfirm($data['password'], $data['password_confirm']);
    CheckSkype($data['skype']);
    CheckGmail($data['google_acc']);

	if(!$hasError) {

		$file = 'http://atanosoff.local/AppRoot/Resources/Images/ProfilePics/profile_default_image.jpg';

		unset($data['password_confirm']);
		$data['password'] = md5($data['password']);
		$data['avatar'] = $file;

		$db->saveArray('users', $data);

    $query = "SELECT * FROM `users` WHERE `email` = '".$data['email']."' ";
    $result = $db->fetchArray($query);

	unset($result[0]['password']);

	$result["role"] = "normal";
    $_SESSION['logged_user'] = $result[0];

		echo 'OK';
	}

function CheckName($name) {

    $regex = '/^[a-zA-Z]+$/';

    if (strlen($name) < 3) {
        $hasError = true;
    }

    if (strlen($name) > 21) {
        $hasError = true;
    }

    if (!preg_match($regex, $name)) {
        $hasError = true;
    }
}

function CheckEmail($email) {

    $regex = '/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/';

    if (!preg_match($regex, $email)) {
        $hasError = true;
    }
}

function CheckPassword($password) {

    $regex = '/^[a-zA-Z1-9]+$/';

    if (strlen($password) < 4) {
        $hasError = true;
    }

    if (strlen($password) > 30) {
        $hasError = true;
    }

    if (!preg_match($regex, $password)) {
        $hasError = true;
    }
}

function CheckPasswordConfirm($password, $password_confirm) {

    if ($password != $password_confirm) {
        $hasError = true;
    }
}


function CheckSkype($skype) {

    $regex = '/^[a-zA-Z][a-zA-Z1-9._]+[a-zA-Z1-9]$/';

    if (strlen($skype) < 4 && $skype != "") {
        $hasError = true;
    }

    if (strlen($skype) > 30) {
        $hasError = true;
    }

    if (!preg_match($regex, $skype)) {
        $hasError = true;
    }
}

function CheckGmail($google_acc) {

    $regex = '/ ^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@gmail\.com$ /';

    if (!preg_match($regex, $google_acc) && $google_acc != "") {
        $hasError = true;
    }
}
?>
