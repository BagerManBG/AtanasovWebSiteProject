<?php

$data = $_POST;
$result = array(
    "color"=> "#f1404b",
    "text"=> "",
    "status"=> 0 
);

if ($data["name"] == "email") {
    $result = emailValidation($data["value"], $result);
}
else{
    echo "string";
}



if($result["text"] != ""){
    $result["color"] = "#f1404b";
    $result["status"] = 1;
}
echo json_encode($result);




function emailValidation($data, $result){
    require_once("db.class.php");
    
    if(strlen($data) == 0)
    {
        $result["text"] = 'Its Empty!';
    }
    elseif (!filter_var($data, FILTER_VALIDATE_EMAIL)) 
    {
      $result["text"]='Its not real email';
    }
    else   
    {
        $query = "SELECT * FROM `users` WHERE `email` = '".$data."'";
        $result_ = $db->fetchArray($query);
        if(count($result_)>0){
            $result["text"] ='This email is already taken';
        }
    }

    return $result;
}



?>