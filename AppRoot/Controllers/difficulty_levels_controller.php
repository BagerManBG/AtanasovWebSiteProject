<?php
  require_once "../db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new DifficultyLevelController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["name"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["name"]);
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

  class DifficultyLevelController {
    function __construct($db) {
      $this->db = $db;
      $this->tableName = "difficulty_levels";
    }

    function create($name) {
      #$query = "INSERT INTO difficulty_levels(name) VALUES('" . $name . "')";
      $info = ["name" => $name];
      $this->db->saveArray($this->tableName, $info);
    }

    function edit($id, $name) {
      $info = ["id" => $id, "name" => $name];
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
