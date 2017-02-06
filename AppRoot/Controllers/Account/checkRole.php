<?php
session_start();
if (isset($_SESSION['logged_user'])) {
  $result = $_SESSION["logged_user"]["role"];
  echo $result;
}
else {
  echo "nope";
}
?>
