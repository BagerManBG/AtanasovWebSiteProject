<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];

  $result = $db->getBy("online_lectures", "id", $id);
  echo json_encode($result);
 ?>
