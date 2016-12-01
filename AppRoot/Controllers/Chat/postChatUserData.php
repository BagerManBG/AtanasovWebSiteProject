<?php 

require_once('../../Models/Database/db.class.php');

$data = $_POST['data'];

$data['avatar'] = 'http://localhost/AtanasovWebSiteProject-master/AppRoot/Resources/Images/Profile/profile_default_image.jpg'; //change this
$data['last_time_online'] = time();
$data['role'] = 2;

$db->saveArray('chat_users', $data);
?>