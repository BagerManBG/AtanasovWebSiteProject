<?php
  require_once "../db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new LecturesController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["title"], $data["description"], $data["date"], $data["start"], $data["end"], $data["courseId"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["title"], $data["description"], $data["date"], $data["start"], $data["end"], $data["courseId"]);
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

    function create($title, $description, $date, $start, $end, $courseId) {
      $info = ["title" => $title, "description" => $description, "date" => $date, "start" => $start, "end" => $end, "course_id" => $courseId];
      $this->db->saveArray($this->tableName, $info);
    }

    function edit($id, $title, $description, $date, $start, $end, $courseId) {
      $info = ["id" => $id, "title" => $title, "description" => $description, "date" => $date, "start" => $start, "end" => $end, "course_id" => $courseId];
      $result = $this->db->saveArray($this->tableName, $info);
    }

    function delete($id) {
      $result = $this->db->deleteRow($this->tableName, $id, "id");
    }

    function getById($id) {
      $result = $this->db->getBy($this->tableName, "id", $id);
    }

    function getAll() {
      $result = $this->db->getAll($this->tableName);
    }
  }
?>
