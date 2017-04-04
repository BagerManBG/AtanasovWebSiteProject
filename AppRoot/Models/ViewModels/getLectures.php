<?php
  require_once "../Database/db.class.php";
  $user_id = -1;

  if (isset($_SESSION["logged_user"])) {
    $user_id = $_SESSION['logged_user']['id'];
  }

  $query = "SELECT l.id, l.title, l.description, l.date, l.date_end, l.start as startTime, l.end as endTime, l.course_id AS courseId, c.name FROM lectures l INNER JOIN courses c ON l.course_id = c.id";
  $result = $db->fetchArray($query);
  $events = array();

  foreach ($result as $event) {
    $event = (array)$event;
    $event["start"] = $event["date"] . "T" . $event["startTime"];
    $event["end"] = $event["date_end"] . "T" . $event["endTime"];

    $checkIfBookedQuery = 'SELECT * from seats WHERE lecture_id = ' . $event['id'] . ' AND user_id = ' . $user_id;
    $booked = $db->fetchArray($checkIfBookedQuery);

    if (sizeof($booked) > 0) {
      $event['color'] = '#b2bf6d';
    } else {
      $event['color'] = '#98795c';
    }

    $event = (object)$event;
    array_push($events, $event);
  }

  echo json_encode($events);
 ?>
