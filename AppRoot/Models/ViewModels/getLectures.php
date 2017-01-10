<?php
  require_once "../Database/db.class.php";

  $query = "SELECT l.id, l.title, l.description, l.date, l.start as startTime, l.end as endTime, l.course_id AS courseId, c.name FROM lectures l INNER JOIN courses c ON l.course_id = c.id";
  $result = $db->fetchArray($query);
  $events = array();

  foreach ($result as $event) {
    $event = (array)$event;
    $event["start"] = $event["date"] . "T" . $event["startTime"];
    $event["end"] = $event["date"] . "T" . $event["endTime"];
    $event = (object)$event;
    array_push($events, $event);
  }

  echo json_encode($events);
 ?>
