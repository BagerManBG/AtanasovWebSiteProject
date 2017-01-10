<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];

  $result = $db->getBy("courses", "id", $id);
  echo json_encode($result);
 ?>
