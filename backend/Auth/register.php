<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register • cxplot</title>
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
  <div class="register-container">
    <div class="header">
      <div class="title">
        <h2>Create a free account</h2>
        <p class="create-account-introduction">Creating an account allows you to customize your experience and tailor it to your interests. Creating an account allows you to build a personalized profile, connect with others who share similar interests, and access exclusive content.With the rise of online shopping, social media, and e-commerce, having an account has become essential for staying connected and accessing exclusive content</p>
      </div>
    </div>
    <div class="main">
      <div class="main-body flex">
        <div class="main-part1">
          <div class="name-part">
            <label for="name">Your name</label>
            <input type="text" name="register-name" id="registerName" class="validator-none" placeholder="Name">
            <span id="name-validate">Please enter your name to register.</span>
          </div>
          <div class="register-email-address-part">
            <label for="Email Address">Your email address</label>
            <input type="email" name="registerEmail" id="registerEmail" class="validator-none" placeholder="Email Address">
            <span id="email-validate">Please enter your email address to register.</span>
          </div>
        </div>
        <div class="main-part2">
          <div class="register-password-part">
            <label for="Password">Your password</label>
            <input type="password" name="register-password" id="registerPassword" class="validator-none" placeholder="Password">
            <span id="password-validate">Password is required.</span>
          </div>
          <div class="register-confirmpassword-part">
            <label for="confirm-password">Your confirm password</label>
            <input type="password" name="confirm-register-password" id="confirmRegisterPassword" class="validator-none" placeholder="Confirm Password">
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
  <script src='../../assets/js/jquery.min.js'></script>
  <script src='../../assets/js/script.js'></script>
</body>

</html>