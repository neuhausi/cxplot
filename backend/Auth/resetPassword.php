<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password • cxplot</title>
  <!-- favicons -->
  <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicon-16x16.png">
  <link rel="icon" type="image/png" sizes="32x32" href="/assets/images/favicon-32x32.png">
  <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="/assets/images/apple-touch-icon.png">
  <link rel="apple-touch-icon" type="image/png" sizes="120x120" href="/assets/images/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" type="image/png" sizes="76x76" href="/assets/images/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" type="image/png" sizes="60x60" href="/assets/images/apple-touch-icon-60x60.png">
  <!-- jquery -->
  <script src="/assets/js/jquery.min.js" crossorigin="anonymous"></script>
  <!-- Bootstrap -->
  <link href="/assets/css/tidyverse.css" rel="stylesheet">
  <script src="/assets/js/bootstrap.min.js" crossorigin="anonymous"></script>
  <!-- Font Awesome icons -->
  <link rel="stylesheet" href="/assets/css/all.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="/assets/css/v4-shims.min.css" crossorigin="anonymous">
  <!-- clipboard.js -->
  <script src="/assets/js/clipboard.min.js" crossorigin="anonymous"></script>
  <!-- headroom.js -->
  <script src="/assets/js/headroom.min.js" crossorigin="anonymous"></script>
  <script src="/assets/js/jQuery.headroom.min.js" crossorigin="anonymous"></script>
  <!-- pkgdown -->
  <link href="/assets/css/pkgdown.css" rel="stylesheet">
  <link rel="stylesheet" href="/assets/css/homepage.css">
  <!-- CanvasXpress -->
  <link rel="stylesheet" href="/assets/css/canvasXpress.css" type="text/css" />
  <script type="text/javascript" src="/assets/js/canvasXpress.min.js"></script>
  <!-- Google -->
  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-XWN5F9X8DS"></script>
  <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'G-XWN5F9X8DS');
  </script>
  <!--optional theme-->
  <meta property="og:image" content="/assets/images/logo.png">
  <meta name="twitter:card" content="summary">
</head>

<body>
  <header>
    <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="navbar-brand-container">
            <a class="navbar-brand" href="/index.php">cxplot</a>
          </div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="https://github.com/neuhausi/cxplot" class="external-link">
                <span class="fab fa-github fa-lg"></span>
              </a>
            </li>
            <li>
              <a href="/backend/blog/blog.php">Blog</a>
            </li>
            <li>
              <a href="/backend/contact/contact.php">Contact Us</a>
            </li>
            <li>
              <a href="/backend/Auth/register.php">Register</a>
            </li>
            <li>
              <a href="/backend/Auth/login.php">Login</a>
            </li>
          </ul>
        </div>
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
          <input type="email" name="resetEmail" id="resetEmail" class="validator-none" placeholder="Email Address">
          <span id="reset-email-validate">Please enter your email address.</span>
        </div>
        <div class="resetPassword-part">
          <label for="resetPassword">Your password</label>
          <input type="password" name="resetPassword" id="resetPassword" class="validator-none" placeholder="Password">
          <span id="password-validate">Password is required.</span>
        </div>
        <div class="resetpassword-part">
          <label for="confirm-resetpassword">Your confirm password</label>
          <input type="password" name="confirm-resetPassword" id="confirmResetPassword" class="validator-none" placeholder="Confirm Password">
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