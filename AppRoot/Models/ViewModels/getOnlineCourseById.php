<?php
  require_once "../Database/db.class.php";
  $id = $_GET["id"];

  $query = "SELECT c.name, c.description, l.name as difficulty, l.id as level_id FROM online_courses c INNER JOIN difficulty_levels l ON c.difficulty_level = l.id WHERE c.id = " . $id;
  $result = $db->fetchArray($query);
  echo json_encode($result);
 ?>
