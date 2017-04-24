<?php
  require_once "../Database/db.class.php";

  $result = $db->getAll("posts");
  echo json_encode($result);
?>
