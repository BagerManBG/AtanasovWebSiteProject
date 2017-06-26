<?php
  require_once "../Models/Database/db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new LecturesController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["title"], $data["description"], $data["date"], $data["date_end"], $data["start"], $data["end"], $data["courseId"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["title"], $data["description"], $data["date"], $data["date_end"], $data["start"], $data["end"], $data["courseId"]);
      break;
    case 'book':
      $controller->book($data["seat_index"], $data["lecture_id"]);
      break;
    case 'delete':
      $controller->delete($data["id"]);
      break;
    case 'getById':
      $controller->getById($data["id"]);
      break;
    case 'getAll':
      $controller->getAll();
      break;
    default:
      #for later
      break;
  }

  class LecturesController {
    function __construct($db) {
      $this->db = $db;
      $this->tableName = "lectures";
    }

    function create($title, $description, $date, $date_end, $start, $end, $courseId) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        if ($date_end == null) {
          $date_end = $date;
        }

        $info = ["title" => $title, "description" => $description, "date" => $date, "date_end" => $date_end, "start" => $start, "end" => $end, "course_id" => $courseId];
        $id = $this->db->saveArray($this->tableName, $info);

        for ($i = 1; $i <= 6; $i++) {
          $this->db->saveArray('seats', ['seat_index' => $i, 'lecture_id' => $id]);
        }

        header('Location: ' . '../#/lectures');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function edit($id, $title, $description, $date, $date_end, $start, $end, $courseId) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        if ($date_end == null) {
          $date_end = $date;
        }
        
        $info = ["id" => $id, "title" => $title, "description" => $description, "date" => $date, "date_end" => $date_end, "start" => $start, "end" => $end, "course_id" => $courseId];
        $result = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../#/lectures');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function book($seat_index, $lecture_id) {
      $checkForOtherPlaceQuery = 'SELECT * FROM seats WHERE lecture_id = ' . $lecture_id . ' AND user_id = ' . $user_id;
      $seat = $this->db->fetchArray($checkForOtherPlaceQuery);
      if (sizeof($seat) > 0) {
        echo '<p>You already have a seat</p>';
      } else {
        $getSeatQuery = 'SELECT * FROM seats WHERE seat_index = ' . $seat_index . ' AND lecture_id = ' . $lecture_id . ' AND user_id IS NULL';
        $seat = $this->db->fetchArray($getSeatQuery);
        if (is_null($seat[0]['user_id'])) {
          $user_id = $_SESSION['logged_user']['id'];
          $info = ['id' => $seat[0]['id'], 'lecture_id' => $lecture_id, 'seat_index' => $data[0]['seat_index'], 'user_id' => $user_id];
          $this->db->saveArray('seats', $info);
          header('Location: ' . '../#/lectures');
        }
        else {
          echo('<p>Seat already taken</p>');
        }
      }
    }

    function delete($id) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $result = $this->db->deleteRow($this->tableName, $id, "id");
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function getById($id) {
      $result = $this->db->getBy($this->tableName, "id", $id);
    }

    function getAll() {
      $result = $this->db->getAll($this->tableName);
    }
  }
?>
