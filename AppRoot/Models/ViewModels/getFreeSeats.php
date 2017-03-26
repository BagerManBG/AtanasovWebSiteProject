<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];
  $query = 'SELECT seats.seat_index FROM seats WHERE seats.lecture_id = ' . $id . ' AND seats.user_id IS NULL';
  $result = $db->fetchArray($query);
  echo json_encode($result);
 ?>
