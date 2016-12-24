<?php

require_once "../../Models/Database/db.class.php";

$email = $_POST['email'];

$q = "SELECT * FROM `users` WHERE `email` = '$email'";

$result = $db->fetchArray($q);

if(empty($result)) {

	echo 'OK';
}
else {

	echo 'Not OK'; 
}
?>