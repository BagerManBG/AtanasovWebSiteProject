<?php

require_once "../../Models/Database/db.class.php";

// FirstName
// LastName
// Email

$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];

$user_id = $_SESSION['logged_user']['id'];

$q = "SELECT * FROM `users` WHERE `id` = '$user_id'";

$user_data = $db->fetchArray($q);

$data = [
	'id' => $user_data[0]['id'],
	'first_name' => $first_name,
	'last_name' => $last_name,
	'email' => $email
];

$db->saveArray('users', $data);

$_SESSION['logged_user']['first_name'] = $first_name;
$_SESSION['logged_user']['last_name'] = $last_name;
$_SESSION['logged_user']['email'] = $email;

header('location: ../../index.html');
?>