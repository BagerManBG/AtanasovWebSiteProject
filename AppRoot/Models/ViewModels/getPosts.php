<?php
  require_once "../Database/db.class.php";
  $query = "SELECT * FROM posts ORDER BY post_index ASC, id DESC";
  $result = $db->fetchArray($query);
  echo json_encode($result);
?>
