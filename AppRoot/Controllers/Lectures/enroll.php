<?php
  require_once "../../Models/Database/db.class.php";

  $course = $_GET["id"];
	$student = $_SESSION['logged_user']['id'];
  $query = "INSERT INTO students_courses VALUES($student, $course)";
  $result = $db->execute($query);
  echo json_encode($result);
?>
