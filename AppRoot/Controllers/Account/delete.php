<?php
  require_once "../../Models/Database/db.class.php";

  if (isset($_SESSION["logged_user"]) && $_SESSION["logged_user"]["role"] == "admin") {
    $id = $_POST["id"];
    $q = "DELETE FROM users WHERE id = " . $id;
    $result = $db->fetchArray($q);
      header('Location: ' . '../../#/users');
  } else {
    header('Location: ' . '../../#/home');
  }
?>
