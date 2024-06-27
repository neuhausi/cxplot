<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login • cxplot</title>
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
  <div class="login-container flex">
    <div class="login-image">
      <img src="../../assets/css/logo.svg" alt="">
    </div>
    <div class="login-part">
      <div class="header">
        <div class="title text-center">
          <p class="login-create-account">
            Login Account
          </p>
          <p class="font-size-11">To access cxplot, you need to log in with your username and password. This page is designed to provide a secure and convenient way to authenticate your identity and grant access to the protected areas of the website or application.</p>
        </div>
      </div>
      <div class="main">
        <div class="main-body">
          <div class="email-address-part">
            <label for="Email Address">Your email address</label>
            <div class="flex">
              <input type="email" name="userEmail" id="userEmail" class="validator-none" placeholder="Email Address">
              <div class="login-user-icon">
                <i class="fa fa-user" aria-hidden="true"></i>
              </div>
            </div>
            <span id="email-validate">Please enter your email address to sign in.</span>
          </div>
          <div class="password-part">
            <label for="Password">Your password</label>
            <div class="flex">
              <input type="password" name="password" id="password" class="validator-none" placeholder="Password">
              <div class="login-password-icon">
                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
              </div>
            </div>
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