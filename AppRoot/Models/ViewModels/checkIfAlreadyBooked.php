<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];
  if (!isset($_SESSION['logged_user'])) {
    echo json_encode([]);
  } else {
    $query = 'SELECT seats.seat_index FROM seats WHERE seats.lecture_id = ' . $id . ' AND seats.user_id  = ' . $_SESSION['logged_user']['id'];
    $result = $db->fetchArray($query);
    echo json_encode($result);
  }
 ?>
