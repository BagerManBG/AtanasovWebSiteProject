<?php

$name = $_POST['name'];

$email = $_POST['email'];

$message = $_POST['message'];

$from = $email;

$to = "vzhuhov@gmail.com";

$subject = "Atnasko";

$emailbody = "";
$emailbody .= "Full name: " . $name . "\n";
$emailbody .= "Email: " . $email . "\n";
$emailbody .= "Message: " . $message . "\n";

$header = "";
$header .= "From:" . $from . " \n";
$header .= "Content-Type:text/plain;charset=utf-8";


$success = mail($to, $subject, $emailbody, $header);

if ($success){
    echo "string";
}
else{
    echo "no string";
}
?>