<?php 
session_start();
unset($_SESSION['logged_user']);
header("Location: ../../Resources/Templates/login_register.html");

?>