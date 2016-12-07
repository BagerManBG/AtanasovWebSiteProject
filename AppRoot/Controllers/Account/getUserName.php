<?php 

session_start();

if(isset($_SESSION['logged_user']))
{
	$firstName = $_SESSION['logged_user']['first_name'];
	$lastName = $_SESSION['logged_user']['last_name'];

	echo $firstName.' '.$lastName;
}

?>