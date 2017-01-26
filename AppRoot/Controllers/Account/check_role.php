<?php

require_once "../../Models/Database/db.class.php";

$email = $_POST['email'];

$q = "SELECT r.name FROM users u INNER JOIN roles r ON u.role_id = r.id WHERE `email` = '$email'";

$result = $db->fetchArray($q);
echo $result;
?>
