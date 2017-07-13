<?php
  require_once "../../Models/Database/db.class.php";
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
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["name" => $name];
        $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../../#/difficulty-levels/' . $id . '/details');
        exit();
      } else {
        header('Location: ' . '../../#/home');
        exit();
      }
    }

    function edit($id, $name) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["id" => $id, "name" => $name];
        $result = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../../#/difficulty-levels/' . $id . '/details');
        exit();
      } else {
        header('Location: ' . '../../#/home');
        exit();
      }
    }

    function delete($id) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $result = $this->db->deleteRow($this->tableName, $id, "id");
      } else {
        header('Location: ' . '../../#/home');
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
