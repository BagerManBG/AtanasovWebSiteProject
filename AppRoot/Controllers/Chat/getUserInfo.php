<?php 

require_once('../../Models/Database/db.class.php');

$id = $_POST['id'];

$q = "SELECT * FROM `chat_users` WHERE `id` = $id";

$result = $db->fetchArray($q);

if(!empty($result))
{
	foreach ($result as $key => $value) 
	{
		echo '
			<div id="profilePic">
                <img src="'.$value['avatar'].'">
            </div>
            <div class="description">
                <h2 id="Name">'.$value['first_name'].' '.$value['last_name'].'</h2>

                <p id="email">'.$value['email'].'</p>
            </div>
		';
	}
}
else
{
	echo 'error';
}

?>