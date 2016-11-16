<?php

	require_once "db.class.php";

	echo "<pre>";
	print_r($_POST);

	$data = $_POST;
	$files = $_FILES;
	$hasError=false;
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
	
	// Check if file already exists
	if (file_exists($target_file)) {
		echo "Sorry, but file exist!";
		$hasError=true;
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
	if (	$hasError == true) {
	    echo "Sorry, your file was not uploaded.";
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