<?php 

require_once "../../Models/Database/db.class.php";

$q = "SELECT * FROM `chat_users` WHERE `role_id` = 1";

$result = $db->fetchArray($q);

echo $result[0]['id'];

?>