<?php

	require_once "db.class.php";

	echo "<pre>";
	print_r($_POST);

	$data = $_POST;
	$files = $_FILES;
	$hasError = false;
	$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
	$media_path = dirname(dirname($actual_link)) . "/media/";

	foreach($data as $k=>$v)
	{
		$data[$k] = trim($data[$k]);
	}
	
	$hasError = 0;
	
	
	$query = "SELECT * FROM `users` WHERE `email` = '".$data['email']."' ";
	
	$result = $db->fetchArray($query);
	
	if(!empty($result))
	{
		$hasError=true;
	}	
	
	if(strlen($data['password']) < 6)
	{
		$hasError=true;
	}
	
	if($data['password'] != $data['password_2'])
	{
		$hasError=true;
	}

	if(strlen($data['special_key'] < 4))
	{
		$hasError=true;
	}

	$target_dir = dirname(dirname(__FILE__)) . "\media\\";
	$file_name = $files["image"]["name"];
	$target_file = $target_dir . basename($file_name);
	$uploadOk = 1;
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	// Check if image file is a actual image or fake image
		
	if(isset($_POST["submit"])) {
		$check = getimagesize($files["image"]["tmp_name"]);
		if($check !== false) {
		    echo "File is an image - " . $check["mime"] . ".";
		    $uploadOk = 1;
		} else {
		    echo "File is not an image.";
		    $uploadOk = 0;
		}
	}


	function GUID()
	    {
			if (function_exists('com_create_guid') === true)
			{
			    return trim(com_create_guid(), '{}');
			}

			return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
		}


	$new_name = GUID();

	$target_file = $target_dir .  $new_name . "." .$imageFileType;
	$file_name = $new_name . "." .$imageFileType;

	// Check if file already exists
	while (file_exists($target_file)) {
		/*echo "Sorry, but file exist!";
		$hasError=true;*/
		$new_name = GUID();

		$target_file = $target_dir .  $new_name . "." .$imageFileType;
		$file_name = $new_name . "." .$imageFileType;
	}

	// Check file size
	if ($files["image"]["size"] > 5000000) {
		echo "Sorry, but the file is too big";
		$hasError=true;
	}
	// Allow certain file formats
	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
		$hasError = 1;	
	}
	// Check if $uploadOk is set to 0 by an error
	if ($hasError == true) {
		/*echo "Sorry, your file was not uploaded.";*/
		$file_name =  "\profile_default_image.jpg" ;
		/*echo "in";*/
		$hasError = false;
		// if everything is ok, try to upload file
	} else {
		if (move_uploaded_file($files["image"]["tmp_name"], $target_file)) {
		    echo "The file ". basename($file_name). " has been uploaded.";
		} else {
		    echo "Sorry, there was an error uploading your file.";
		}
	}
	

	if($hasError == false)
	{
		unset($data['password_2']);
		$data['password'] = md5($data['password']);
		$data['avatar'] = $media_path . $file_name;
		$db->saveArray('users', $data);
		header('Location: ../index.html');
       	echo 'no error';
    }
    else
    {
        echo 'error';
    }

?>