<?php

require_once "../../Models/Database/db.class.php";

// FirstName
// LastName
// Email

$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$password =$_POST['password'];
$password_2 =$_POST['password_2'];
$skype = $_POST['skypeName'];
$google_acc = $_POST['google_acc'];



    /*if($password =$_POST['password'] == $password_2 =$_POST['password_2'])
        {
        $user_id = $_SESSION['logged_user']['id'];

        $q = "SELECT * FROM `users` WHERE `id` = '$user_id'";

        $user_data = $db->fetchArray($q);
        if(!empty($password))
        {
        $data = [
            'id' => $user_data[0]['id'],
            'first_name' => $first_name,
            'last_name' => $last_name,
            'email' => $email,
            'password' => md5($password)
            
            ];
            }
         else{
           $data = [
            'id' => $user_data[0]['id'],
            'first_name' => $first_name,
            'last_name' => $last_name,
            'email' => $email,
            
            ];
         }   
        $db->saveArray('users', $data);

        $_SESSION['logged_user']['first_name'] = $first_name;
        $_SESSION['logged_user']['last_name'] = $last_name;
        $_SESSION['logged_user']['email'] = $email;

        header('location: ../../index.html');
        }
        else{

                 echo"<script language='javascript'>
                    alert('passwords must matches ')
        </script>
        ";*/

if(empty($password)) {

    $user_id = $_SESSION['logged_user']['id'];

    $q = "SELECT * FROM `users` WHERE `id` = '$user_id'";

    $user_data = $db->fetchArray($q);

    $data = [
        'id' => $user_data[0]['id'],
        'first_name' => $first_name,
        'last_name' => $last_name,
        'email' => $email,
        'skype' => $skype,
        'google_acc' => $google_acc
    ];

    $db->saveArray('users', $data);

    $_SESSION['logged_user']['first_name'] = $first_name;
    $_SESSION['logged_user']['last_name'] = $last_name;
    $_SESSION['logged_user']['email'] = $email;
    $_SESSION['logged_user']['skype'] = $skype;
    $_SESSION['logged_user']['google_acc'] = $google_acc;

    header('location: ../../#/profile');             
} else {

    if($password  == $password_2 ) {

        $user_id = $_SESSION['logged_user']['id'];

        $q = "SELECT * FROM `users` WHERE `id` = '$user_id'";

        $user_data = $db->fetchArray($q);

        $data = [
            'id' => $user_data[0]['id'],
            'first_name' => $first_name,
            'last_name' => $last_name,
            'email' => $email,
            'password' => md5($password)
        ];

        $db->saveArray('users', $data);

        $_SESSION['logged_user']['first_name'] = $first_name;
        $_SESSION['logged_user']['last_name'] = $last_name;
        $_SESSION['logged_user']['email'] = $email;

        header('location: ../../index.html');
    } else {

        echo"<script language='javascript'>
                alert('passwords must matches ')
             </script>";
    }
}
        
?>