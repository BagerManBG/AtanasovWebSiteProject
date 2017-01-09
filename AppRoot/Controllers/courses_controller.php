<?php
  require_once "../Models/Database/db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new CoursesController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["name"], $data["description"], $data["students_capacity"], $data["difficulty_level"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["name"], $data["description"], $data["students_capacity"], $data["difficulty_level"]);
      break;
    case 'delete':
      $controller->delete($data["id"]);
      break;
    case 'enrollStudent':
      $controller->enrollStudent($data["courseId"], $data["studentId"]);
      break;
    case 'disenrollStudent':
      $controller->disenrollStudent($data["courseId"], $data["studentId"]);
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

  class CoursesController {
    function __construct($db) {
      $this->db = $db;
      $this->tableName = "courses";
    }

    function create($name, $description, $capacity, $difficulty_level_id) {
      $info = ["name" => $name, "description" => $description, "students_capacity" => $capacity, "difficulty_level" => $difficulty_level_id];
      $this->db->saveArray($this->tableName, $info);
    }

    function edit($id, $name, $description, $capacity, $difficulty_level_id) {
      $info = ["name" => $name, "description" => $description, "students_capacity" => $capacity, "difficulty_level" => $difficulty_level_id];
      $result = $this->db->saveArray($this->tableName, $info);
    }

    function enrollStudent($courseId, $studentId) {
      $name = "students_courses";
      $info = ["student_id" => $studentId, "course_id" => $course_id];
      $this->db->saveArray($name, $info);
    }

    function disenrollStudent($courseId, $studentId) {
      $name = "students_courses";
      $query = "DELETE FROM " . $name . " WHERE course_id = " . $courseId . " AND student_id = " . $student_id;
      $result = $this->db->fetchArray($query);
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
