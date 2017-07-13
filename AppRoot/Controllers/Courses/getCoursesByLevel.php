<?php
  require_once "../../Models/Database/db.class.php";

  $result = $db->getBy("courses", "difficulty_level", $_GET["level"]);
  echo json_encode($result);
?>
