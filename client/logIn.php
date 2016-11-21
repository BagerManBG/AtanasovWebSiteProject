<?php session_start(); ?>
<!DOCTYPE html>
<html ng-app="application">
<head>
    <title>Atanasoff</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css" media="screen" title="no title">
    <link rel="icon" href="img/logo.png">
    <link href="css/logIn.css" rel="stylesheet"/>
    <link href="css/nav.css" rel="stylesheet"/>
</head>
<body>
<nav>
    <ul id="top" class="nav-ul">
        <li><a href="index.html">Home</a></li>
        <li><a href="#">Q&A</a></li>
        <li><a href="#">Lessons</a></li>
        <li><a href="#">Feedback</a></li>
    <?php 
        if(!isset($_SESSION['logged_user']))
        {
          echo "<li><a href=''>Login</a></li>";
        }
        else 
        {
          echo "
          <li><a href='Profile.html'>Profile</a></li>
          <li><a href='php/logout.php'>Log out</a><li>";
        }
        ?>
    </ul>
</nav>
<div class="logForm">

    <div class="changeForm">
        <button class="positionLeft">Login</button>
        <button class="positionRight">Register</button>
    </div>

    <div class="logAction">
        <div class="title">Login</div>
        <form method="post" action="php/login_db.php">
            <!--<input type="text" name="email_log" placeholder="Email" required="required"/>-->
            <!--<label class="logvalidation"></label>-->

            <input type="text"
                   class="form-control"
                   name="email_log" tabindex="1" placeholder="Email" ng-model="log.email" required validator="email"
                   email-error-message="Wrong Email"
                   email-success-message="Good Email" message-id="log_emailWatch" id="email_log">
            <span id="log_emailWatch"><p class="validation-invalid ng-scope">Wrong Email</p></span>

            <input class="form-control" id="logPassword" type="password" tabindex="2"
                   name="password_log" placeholder="Password" ng-model="log.password" validator="required"
                   valid-method="blur"
                   minlength="6" required-error-message="Please enter at least 6 symbols for password">

            <br>
            <!--<input id='log1' type="password" name="password_log" placeholder="Password" required="required"/>-->
            <!--<label id='log2' class="logvalidations"></label>-->



            <br>
            <button class="loginButton" id='logDis' type="submit" value="Login now!">Login now!</button>
        </form>
    </div>


    <div class="regAction">
        <div class="title">Register now for free!</div>

        <div class="sign">
            <form name="RegForm" id="signup" method="post" action="php/register_db.php" enctype="multipart/form-data">

                <input type="text" name="first_name" required="required" id="first_name" tabindex="1"
                       class="form-control form-validation" placeholder="First Name" value=""
                       ng-model="form.firstName" validator="required" valid-method="blur"
                       required-error-message="Please enter first name">

                <input type="text" name="last_name" required="required" id="second_name" tabindex="2"
                       class="form-control form-validation" placeholder="Last Name" value=""
                       ng-model="form.lastName" validator="required" valid-method="blur"
                       required-error-message="Please enter last name">

                <!-- <input type="text"
                       class="form-control"
                       name="email" tabindex="3" placeholder="Email" ng-model="form.email" required validator="email"
                       email-error-message="Wrong Email"
                       email-success-message="Good Email" message-id="emailWatch" id="email">
                <span id="emailWatch"><p class="validation-invalid ng-scope">Wrong Email</p></span> -->

                <div class="white_space">
                    <input class="validation form-control" type="email" name="email" placeholder="email" required="required" />
                    <label class="validation-info"></label>
                </div>

                <input class="form-control" id="regPassword" type="password" tabindex="4"
                       name="password" placeholder="Password" ng-model="form.password" validator="required"
                       valid-method="blur"
                       minlength="6" required-error-message="Please enter at least 6 symbols for password">

                <input class="form-control" id="regPassword2" type="password" tabindex="5"
                       name="password_2" placeholder="Confirm Password" ng-model="form.password_2" validator="required"
                       valid-method="blur"
                       minlength="6" required-error-message="Please enter password that matches the first one">

                <h4 class="imgInfo">Enter a unique word(can be used for recovoring account).</h4>

                <input class="form-control" name="special_key" placeholder="Special Key" required="required">

                <h4 class="imgInfo">Choose profile picture(optional).</h4>
                <input type="file" name='image' id="image">

                <button class="regButton"  id='regDis' type="submit" value="Register now!">Register now!</button>
            </form>
        </div>

    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="js/jquery.js"></script>
<script src="bower_components/angular/angular.js"></script>
<script src="bower_components/angular-validation/dist/angular-validation.js"></script>
<script src="bower_components/angular-validation/dist/angular-validation-rule.js"></script>
<script src="js/app/app.js"></script>
<script src="js/login.js"></script>

</body>
</html>