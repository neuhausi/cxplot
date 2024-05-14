<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="title">
                <div class="flex">
                    <img src="../assets/css/logo.svg" alt="">
                    <h2>Welcome</h2>
                </div>
                <p class="login-create-account">
                    Login <span>or</span>
                    <a href="">Create a free account</a>
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
                    <a href="">Forgot Your Password?</a>
                </div>
                <div class="login-button-part">
                    <input type="button" value="Continue with email" id="login-button" class="login-button">
                </div>
            </div>
        </div>
    </div>
    <script src='../assets/js/jquery.min.js'></script>
    <script src='../assets/js/script.js'></script>
</body>
</html>