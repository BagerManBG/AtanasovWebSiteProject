<?php
  require_once "../../Models/Database/db.class.php";
  $id = $_GET["id"];

  $result = $db->getBy("lectures", "id", $id);
  echo json_encode($result);
 ?>
