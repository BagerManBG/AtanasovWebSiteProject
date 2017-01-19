<?php
  require_once "../Database/db.class.php";

  $result = $db->getBy("lectures", "course_id", $_GET["course"]);
  echo json_encode($result);
?>
