<?php
  require_once "../../Models/Database/db.class.php";
  $id = $_GET["id"];
  $query = 'SELECT s.id, s.seat_index, s.user_id, u.email FROM seats s INNER JOIN users u ON s.user_id = u.id WHERE s.lecture_id = ' . $id;
  $result = $db->fetchArray($query);
  echo json_encode($result);
 ?>
