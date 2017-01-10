<?php
  require_once "../Database/db.class.php";

  $result = $db->getAll("difficulty_levels");
  echo json_encode($result);
 ?>
