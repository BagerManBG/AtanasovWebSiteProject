<?php
	require_once "../../Models/Database/db.class.php";
  $users = $db->getAll('users');
  echo json_encode($users);
?>
