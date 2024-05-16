<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/assets/css/tidyverse.css" rel="stylesheet">
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom p-10" role="navigation">
            <div class="navbar-header">
                <div class="navbar-brand-container">
                    <a class="navbar-brand" href="../../index.php">cxplot</a>
                </div>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="../contact/contact.php">Contact Us</a>
                    </li>
                    <li>
                        <a href="./register.php">Register</a>
                    </li>
                    <li>
                        <a href="./login.php">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="login-container flex">
        <div class="login-image">
            <img src="../../assets/images/login.png" alt="">
        </div>
        <div class="login-part">
            <div class="header">
                <div class="title">
                    <p class="login-create-account">
                        Login <span>or</span>
                        <a href="./register.php">Create a free account</a>
                    </p>
                </div>
            </div>
            <div class="main">
                <div class="main-body">
                    <div class="email-address-part">
                        <label for="Email Address">Your email address</label>
                        <input type="mail" name="userEmail" id="userEmail" class="validator-none" placeholder="Email Address" >
                        <span id="email-validate">Please enter your email address to sign in.</span>
                    </div>
                    <div class="password-part">
                        <label for="Password">Your password</label>
                        <input type="password" name="password" id="password" class="validator-none" placeholder="Password" >
                        <span id="password-validate">Password is required.</span>
                    </div>
                    <div class="forgot-password">
                        <a href="./forgetPassword.php">Forgot Your Password?</a>
                    </div>
                    <div class="login-button-part text-center">
                        <input type="button" value="Continue with email" id="login-button" class="login-button">
                        <span id="error-validate">This account does not exist. Please create your account.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src='../../assets/js/jquery.min.js'></script>
    <script src='../../assets/js/script.js'></script>
</body>
</html>