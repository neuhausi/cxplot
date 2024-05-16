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
        <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom p-10"" role="navigation">
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
    <div class="forget-password-container">
        <div class="header">
            <div class="title text-center">
                <h2>Password Reset Request</h2>
                <p class="create-account-introduction">Resetting a password is a crucial process that allows users to regain access to their accounts when they have forgotten their password or want to change it.</p>
            </div>
        </div>
        <div class="main">
            <div class="main-body">
                <div class="resetEmail-address-part">
                    <label for="Email Address">Your email address</label>
                    <input type="mail" name="resetEmail" id="resetEmail" class="validator-none" placeholder="Email Address" >
                    <span id="reset-email-validate">Please enter your email address.</span>
                </div>
                <div class="resetPassword-part">
                    <label for="resetPassword">Your password</label>
                    <input type="password" name="resetPassword" id="resetPassword" class="validator-none" placeholder="Password" >
                    <span id="password-validate">Password is required.</span>
                </div>
                <div class="resetpassword-part">
                    <label for="confirm-resetpassword">Your confirm password</label>
                    <input type="password" name="confirm-resetPassword" id="confirmResetPassword" class="validator-none" placeholder="Confirm Password" >
                    <span id="confirm-password-validate">Wrong Password.</span>
                </div>
            </div>
            <div class="resetPassword-button-part text-center">
                <input type="button" value="Reset Password" id="reset-button" class="reset-button">
                <p class="return-login">Return to <a href="./login.php">Login Page</a></p>
            </div>
        </div>
    </div>
    <script src='../../assets/js/jquery.min.js'></script>
    <script src='../../assets/js/script.js'></script>
</body>
</html>