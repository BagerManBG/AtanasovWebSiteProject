<?php

	require_once "../../Models/Database/db.class.php";

	echo "<pre>";
	print_r($_POST);
	print_r($_FILES);

	$data = $_POST;
	$files = $_FILES;
	$hasError = false;
	$hasFileError = false;
	$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
	$media_path = dirname(dirname(dirname($actual_link))) . "/Resources/Images/Profile/";

	foreach($data as $k=>$v)
	{
		$data[$k] = trim($data[$k]);
	}
	
	$query = "SELECT * FROM `users` WHERE `email` = '".$data['email']."' ";
	
	$result = $db->fetchArray($query);
	print_r($result);
	
	if(!empty($result))
	{
		$hasError = true;
	}	
	
	if(strlen($data['password']) < 6)
	{
		$hasError = true;
	}
	
	if($data['password'] != $data['password_confirm'])
	{
		$hasError = true;
	}

	//Check if user actually uploaded something
	if ($files["image"]["size"] == 0) {
	
		$file_name =  "profile_default_image.jpg";
		$hasFileError = true;
	} 
	else {

		$target_dir = dirname(dirname(__FILE__)) . "\media\\";
		$file_name = $files["image"]["name"];
		$target_file = $target_dir . basename($file_name);
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		
		// Allow certain file formats
		if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
		&& $imageFileType != "gif" && $imageFileType != "JPG" && $imageFileType != "PNG" && $imageFileType != "JPEG"
		&& $imageFileType != "GIF") 
		{
			$hasFileError = true;
		} 

		$new_name = GUID();
		
		$target_file = $target_dir .  $new_name . "." .$imageFileType;
		$file_name = $new_name . "." .$imageFileType;

		// Check if file already exists
		while (file_exists($target_file)) {
			
			$new_name = GUID();

			$target_file = $target_dir .  $new_name . "." .$imageFileType;
			$file_name = $new_name . "." .$imageFileType;
		}

		// Check file size
		if ($files["image"]["size"] > 5000000) {

			$hasFileError = true;
		}
	}

	
	
	if($hasError == false)
	{
		if($hasFileError == false)
		{
			if(!move_uploaded_file($files["image"]["tmp_name"], $target_file))
			{
				$file_name =  "profile_default_image.jpg";
			}
		}
		else
		{
			$file_name =  "profile_default_image.jpg";
		}	

		unset($data['password_confirm']);
		$data['password'] = md5($data['password']);
		$data['avatar'] = $media_path . $file_name;
		$db->saveArray('users', $data);
		echo '<pre>';
		print_r($data);
    }

    header('Location: ../../Resources/Templates/login_register.html');

    function GUID() //create random name
    {
		if (function_exists('com_create_guid') === true)
		{
		    return trim(com_create_guid(), '{}');
		}

		return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
	}
?>