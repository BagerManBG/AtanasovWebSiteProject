<!DOCTYPE HTML>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Contact form - Website Title</title>
<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css" media="screen" title="no title">
<link href="css/feedback.css" rel="stylesheet" />
<link href="css/nav.css" rel="stylesheet" />

</head>

<body>
    <nav>
        <ul id="top" class="nav-ul">
            <li><a href="index.html">Home</a></li>
            <li><a href="#">Q&A</a></li>
            <li><a href="#">Lessons</a></li>
            <li><a href="#">Feedback</a></li>
            <li><a href="#">Login</a></li>
        </ul>
    </nav>
<section class="logForm">
    <div id="contact-form">
        <form method="post" action="php/index.php">
        <label>Full name:</label>
        <input name="name" placeholder="Your name" required="required">

        <label>Email:</label>
        <input name="email" type="email" placeholder="Email" required="required">

        <label>Message</label>
        <textarea name="message" placeholder="Write message here" required="required"></textarea>

        <input id="logDis" id="submit" name="submit" type="submit" value="Send Message">

        </form>
    </div>
</section>    
</body>

</html>