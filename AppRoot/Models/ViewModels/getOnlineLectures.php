<?php
  require_once "../Database/db.class.php";

  $result = $db->getAll("online_lectures");
  echo json_encode($result);
?>
