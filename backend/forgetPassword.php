<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/assets/css/tidyverse.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <header>
        <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom p-10"" role="navigation">
            <div class="navbar-header">
                <div class="navbar-brand-container">
                    <a class="navbar-brand" href="/index.html">cxplot</a>
                </div>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="./login.php">Login</a>
                    </li>
                    <li>
                        <a href="./register.php">Register</a>
                    </li>
                    <li>
                        <a href="./contact.php">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="forget-password-container">
        <div class="header">
            <div class="title">
                <h2>Password Reset Request</h2>
                <p class="create-account-introduction">Enter the email address you use to log in to this site. If there is an account associated with that email address, we will email you a link to reset your password. Make sure to check your spam</p>
            </div>
        </div>
        <div class="main">
            <div class="main-body">
                <div class="email-address-part">
                    <label for="Email Address">Your email address</label>
                    <input type="mail" name="forgetEmail" id="forgetEmail" class="validator-none" placeholder="Email Address" >
                    <span id="email-validate">Please enter your email address.</span>
                </div>
            </div>
            <div class="forget-button-part text-center">
                <input type="button" value="SEND REQUEST" id="forget-button" class="forget-button">
                <p class="return-login">Return to <a href="./login.php">Login Page</a></p>
            </div>
        </div>
    </div>
    <script src='../assets/js/jquery.min.js'></script>
    <script src='../assets/js/script.js'></script>
</body>
</html>