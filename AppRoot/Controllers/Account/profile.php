<?php

require_once "../../Models/Database/db.class.php";

// FirstName
// LastName
// Email

$new_data = $_POST['data'];

$first_name = $new_data['first_name'];
$last_name = $new_data['last_name'];
$email = $new_data['email'];

$user_id = $_SESSION['logged_user']['id'];

$q = "SELECT * FROM `users` WHERE `id` = '$user_id'";

$user_data = $db->fetchArray($q);

$user_data['first_name'] = $first_name;
$user_data['last_name'] = $last_name;
$user_data['email'] = $email;

$db->saveArray('users', $user_data);

?>