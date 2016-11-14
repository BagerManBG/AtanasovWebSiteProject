<!DOCTYPE HTML>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Contact form - Website Title</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="contact-form">
<form method="post" action="php/index.php">
    <label>Full name:</label>
    <input name="name" placeholder="John Smith">

    <label>Email:</label>
    <input name="email" type="email" placeholder="info@narhir.com">

    <label>Message</label>
    <textarea name="message" placeholder="Write message here"></textarea>

    <input id="submit" name="submit" type="submit" value="Send Message">

</form>
</div>
</body>

</html>