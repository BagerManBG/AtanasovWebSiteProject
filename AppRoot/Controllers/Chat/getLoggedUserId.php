<?php

require_once "../../Models/Database/db.class.php";

if(isset($_SESSION['logged_user']))
{
	$id = $_SESSION['logged_user']['id'];
	echo $id;
}
else
{
	echo 'error';
}

?>
