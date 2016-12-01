<?php 

require_once('../../Models/Database/db.class.php');

$q = "SELECT * FROM `chat_users` WHERE `role_id` <> 1";

$result = $db->fetchArray($q);

foreach ($result as $key => $value) 
{
	echo '
		<div class="user">
            <img src="'.$value['avatar'].'" alt="userPic">

            <p class="name">'.$value['first_name'].' '.$value['last_name'].'</p>
        </div>
	';
}

?>