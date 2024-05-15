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
    <div class="register-container">
        <div class="header">
            <div class="title">
                <div class="flex">
                    <h2>Create a free account</h2>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="main-body flex">
                <div class="main-part1">
                    <div class="name-part">
                        <label for="name">Your name</label>
                        <input type="mail" name="register-name" id="registerName" class="validator-none" placeholder="Name" >
                        <span id="name-validate">Please enter your name to register.</span>
                    </div>
                    <div class="email-address-part">
                        <label for="Email Address">Your email address</label>
                        <input type="mail" name="registerEmail" id="registerEmail" class="validator-none" placeholder="Email Address" >
                        <span id="email-validate">Please enter your email address to register.</span>
                    </div>
                    
                </div>
                <div class="main-part2">
                    <div class="password-part">
                        <label for="Password">Your password</label>
                        <input type="password" name="register-password" id="registerPassword" class="validator-none" placeholder="Password" >
                        <span id="password-validate">Password is required.</span>
                    </div>
                    <div class="password-part">
                        <label for="confirm-password">Your password confirm</label>
                        <input type="password" name="confirm-register-password" id="confirmRegisterPassword" class="validator-none" placeholder="Confirm Password" >
                        <span id="confirm-password-validate">Wrong Password.</span>
                    </div>
                </div>
            </div>
            <div class="register-button-part flex">
                <input type="button" value="Create account" id="register-button" class="register-button">
                <a href="./login.php" class="cancel text-center" id="cancel">Cancel</a>
            </div>
        </div>
    </div>
    <script src='../assets/js/jquery.min.js'></script>
    <script src='../assets/js/script.js'></script>
</body>
</html>