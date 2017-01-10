<?php
  require_once "../Database/db.class.php";

  $result = $db->getAll("courses");
  echo json_encode($result);
?>
