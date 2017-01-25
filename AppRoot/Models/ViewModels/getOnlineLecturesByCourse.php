<?php
  require_once "../Database/db.class.php";

  $result = $db->getBy("online_lectures", "course_id", $_GET["course"]);
  echo json_encode($result);
?>
