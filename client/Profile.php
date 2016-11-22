<?php session_start(); ?>
<html lang="en">
    <head>
        <title>Atanasoff</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css" media="screen" title="no title">
            <link rel="icon" href="img/logo.png">
            <link href="css/profile.css" rel="stylesheet" />
            <link href="css/nav.css" rel="stylesheet" />

    </head>
    <body>
          <nav>
            <ul id="top" class="nav-ul">
                <li><a href="index.php">Home</a></li>
                <li><a href="#">Q&A</a></li>
                <li><a href="#">Lessons</a></li>
                <li><a href="#">Feedback</a></li>
                <li><a href="#">Login</a></li>
            </ul>
        </nav>
        <section>
            <div class="profile">
                <div class="profileImage"> 
                    <img class="paperclip" src="img/paperclip.png">
                    <img class="avatar" src="<?php echo  "".$_SESSION['logged_user']['avatar']. "" ?>" >
                </div>
                
                <div class="profileInfo">
                    <div class= "profileHeader" >
                        <h2>Profile</h2>
                    </div>

                    <input class="firstName" type="text"  placeholder= <?php echo  "".$_SESSION['logged_user']['first_name']. "" ?> />
                
                </div>    

                <!-- <div class="labels">
                        <label>First Name: <?php echo  "".$_SESSION['logged_user']['first_name']. "" ?> </label>
                        <label>Second Name: <?php echo  "".$_SESSION['logged_user']['last_name']. "" ?> </label>
                        <label>Email: <?php echo  "".$_SESSION['logged_user']['email']. "" ?> </label>
                        <label>Rank:  Noob </label> 

 
                </div> -->
            </div>
        </section>    
    </body>    
