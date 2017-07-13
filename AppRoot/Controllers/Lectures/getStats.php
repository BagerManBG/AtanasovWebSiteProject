<?php
  require_once "../../Models/Database/db.class.php";
  $query = "SELECT l.title, COUNT(s.id) AS seats_taken FROM seats s INNER JOIN lectures l on s.lecture_id = l.id WHERE s.user_id IS NOT NULL GROUP BY l.title";
  $result = $db->fetchArray($query);
  echo json_encode($result);
?>
