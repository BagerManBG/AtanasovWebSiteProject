<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];

  $result = $db->getBy("posts", "id", $id);
  echo json_encode($result);
 ?>
