<?php

require_once('../../Models/Database/db.class.php');

$q = "SELECT u.* FROM messages m INNER JOIN users u ON m.sender_id = u.id WHERE u.role_id = 2 GROUP BY u.id ORDER BY m.send_time DESC";

$result = $db->fetchArray($q);

foreach ($result as $key => $value)
{
	echo '
		<div class="user" id="'.$value['id'].'">
            <img src="Resources/Images/ProfilePics/profile_default_image.jpg" alt="userPic">

            <p class="name">'.$value['first_name'].' '.$value['last_name'].'</p>
        </div>
	';
}

?>
