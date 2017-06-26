<?php
	require_once "../../Models/Database/db.class.php";
	$query = "SELECT * FROM users WHERE role_id != 3";
  $users = $db->fetchArray($query);
  echo json_encode($users);
?>
