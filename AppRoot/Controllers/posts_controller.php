<?php
  require_once "../Models/Database/db.class.php";
  $data = $_POST;
  $method = $_POST["action"];
  $controller = new PostsController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["type"], $data["content"], $data["index"]);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["type"], $data["content"], $data["index"]);
      break;
    case 'delete':
      $controller->delete($data["id"]);
      break;
  }

  class PostsController {
    function __construct($db) {
      $this->db = $db;
      $this->tableName = "posts";
    }

    function create($type, $content, $index) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["type" => $type, "content" => $content, "post_index" => $index];
        $id = $this->db->saveArray($this->tableName, $info);

        header('Location: ' . '../#/home');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function edit($id, $type, $content, $index) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $info = ["id" => $id, "type" => $type, "content" => $content, "post_index" => $index];
        $result = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../#/home');
        exit();
      } else {
        header('Location: ' . '../#/home');
        exit();
      }
    }

    function delete($id) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $result = $this->db->deleteRow($this->tableName, $id, "id");
      } else {
        header('Location: ' . '../#/posts');
        exit();
      }
    }
  }
?>
