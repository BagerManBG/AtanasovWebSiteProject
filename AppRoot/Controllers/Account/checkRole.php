<?php

require_once "../../Models/Database/db.class.php";

if (isset($_SESSION['logged_user'])) {
  $result = $_SESSION["logged_user"]["role"];
  echo $result;
}
else {
  echo "nope";
}
?>
