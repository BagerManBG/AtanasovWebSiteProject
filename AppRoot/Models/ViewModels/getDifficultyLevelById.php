<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];

  $result = $db->getBy("difficulty_levels", "id", $id);
  echo json_encode($result);
 ?>
