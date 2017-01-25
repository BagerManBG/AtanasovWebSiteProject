<?php
  require_once "../Database/db.class.php";

  $result = $db->getBy("online_courses", "difficulty_level", $_GET["level"]);
  echo json_encode($result);
?>
