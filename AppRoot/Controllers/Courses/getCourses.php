<?php
  require_once "../../Models/Database/db.class.php";

  $result = $db->getAll("courses");
  echo json_encode($result);
?>
