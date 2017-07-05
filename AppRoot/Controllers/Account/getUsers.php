<?php
	require_once "../../Models/Database/db.class.php";
	$query = "SELECT * FROM users ORDER BY role_id ASC";
  $users = $db->fetchArray($query);
  echo json_encode($users);
?>
