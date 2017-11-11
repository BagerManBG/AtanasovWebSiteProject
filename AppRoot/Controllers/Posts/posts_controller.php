<?php
  require_once "../../Models/Database/db.class.php";
  $data = $_POST;
  $files = $_FILES;
  $method = $_POST["action"];
  $controller = new PostsController($db);

  switch ($method) {
    case 'create':
      $controller->create($data["type"], $data, $data["index"], $files);
      break;
    case 'edit':
      $controller->edit($data["id"], $data["type"], $data, $data["index"], $files);
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

    function create($type, $data, $index, $files) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $content;

        if ($type == 2) {
          $content = $this->uploadFile($files);
        } else {
          $content = $data["content"];
        }

        $info = ["type" => $type, "content" => $content, "post_index" => $index];
        $id = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../../#/home');
        exit();
      } else {
        header('Location: ' . '../../#/home');
        exit();
      }
    }

    function edit($id, $type, $data, $index, $files) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $content;

        if ($type == 2) {
          $content = $this->uploadFile($files);
        } else {
          $content = $data["content"];
        }

        $info = ["id" => $id, "type" => $type, "content" => $content, "post_index" => $index];
        $result = $this->db->saveArray($this->tableName, $info);
        header('Location: ' . '../../#/home');
        exit();
      } else {
        header('Location: ' . '../../#/home');
        exit();
      }
    }

    function delete($id) {
      if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
        $record = $this->db->getBy($this->tableName, "id", $id);
        print_r($record);

        if ($record[0]["type"] == 2) {
          unlink(realpath("../../" . $record[0]["content"]));
        }

        $this->db->deleteRow($this->tableName, $id, "id");
      } else {
        header('Location: ' . '../../#/posts');
      }
    }

    function uploadFile($files) {
      $target_dir = "Resources/Images/Posts/";
      $target_file = $target_dir . basename($_FILES["content"]["name"]);

      if (move_uploaded_file($files["content"]["tmp_name"], "../../" . $target_file)) {
        return $target_file;
      } else {
        return "bad image";
      }
    }
  }
?>
