<?php
  require_once "../Database/db.class.php";

  $result = $db->getAll("online_courses");
  echo json_encode($result);
?>
