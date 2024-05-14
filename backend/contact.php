<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="../assets/css/all.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <div class="contact-container flex">
        <div class="touch-part">
            <h1 class="get-in-touch">Send us a message</h1>
            <form id="contact-form">
                <input type="text" name="name" placeholder="Name">
                <input type="email" name="email" id="email" placeholder="Email">
                <input type="text" name="subject" placeholder="Subject">
                <textarea name="message" rows="7" cols="50" placeholder="Your message..."></textarea>
                <input type="submit" value="Send" id="send" class="send-button">
            </form>
        </div>
        <div class="contact-part">
            <div class="contact-main">
                <h1 class="contact-us">Contact Us</h1>
                <div class="address">
                    <i class=""></i>
                    <p><strong>Address: </strong>198 West 21th Street, Suite 721 New York NY 10016</p>
                </div>
                <div class="phone">
                    <i class=""></i>
                    <p><strong>Phone: </strong>+ 1235 2355 98</p>
                </div>
                <div class="email">
                    <i class=""></i>
                    <p><strong>E-mail: </strong>info@yoursite.com</p>
                </div>
                <div class="website">
                    <i class=""></i>
                    <p><strong>Website: </strong>yoursite.com</p>
                </div>
            </div>
        </div>
    </div>
    <div id="response"></div>
    <script src='../assets/js/jquery.min.js'></script>
    <script src='../assets/js/script.js'></script>
</body>
</html>