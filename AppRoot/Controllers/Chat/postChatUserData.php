<?php 

require_once('../../Models/Database/db.class.php');

$data = $_POST['data'];

$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$media_path = dirname(dirname(dirname($actual_link))) . "/Resources/Images/Profile/";
$file_name =  "profile_default_image.jpg";

$data['avatar'] = $media_path . $file_name;
$data['role'] = 2;
$data['last_time_online'] = time();

$db->saveArray('chat_users', $data);
?>