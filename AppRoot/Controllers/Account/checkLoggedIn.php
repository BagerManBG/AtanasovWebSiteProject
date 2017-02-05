<?php
  session_start();
  if (isset($_SESSION["logged_user"])) {
    echo "logged";
  } else {
    echo "nope";
  }
?>
