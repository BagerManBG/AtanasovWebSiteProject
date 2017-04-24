<?php
  require_once "../Models/Database/db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new PostsController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["type"], $data["content"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["type"], $data["content"]);
      break;
  }

  class PostsController {
    function __construct($db) {
      $this->db = $db;
      $this->tableName = "posts";
    }

    function create($type, $content) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["type" => $type, "content" => $content, "date" => date()];
        $id = $this->db->saveArray($this->tableName, $info);

        header('Location: ' . '../#/home');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function edit($id, $type, $content) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["id" => $id, "type" => $type, "content" => $content];
        $result = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../#/home');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }
  }
?>
