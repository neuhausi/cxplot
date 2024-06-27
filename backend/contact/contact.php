<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact • cxplot</title>
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
              <a href="/backend/download.php">Download</a>
            </li>
            <li>
              <a href="/backend/Auth/login.php">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </header>
  <div class="contact-container flex">
    <div class="touch-part">
      <h1 class="get-in-touch">Send us a message</h1>
      <form id="contact-form">
        <input type="text" name="name" placeholder="Name">
        <input type="email" name="email" id="email" placeholder="Email">
        <input type="text" name="subject" placeholder="Subject">
        <textarea name="message" rows="7" cols="50" placeholder="Your message..."></textarea>
        <input type="submit" value="Send" id="send" class="send-button">
        <a href="../Auth/login.php" class="back text-center" id="cancel">Back</a>
      </form>
    </div>
    <div class="contact-part">
      <div class="contact-main">
        <h1 class="contact-us">Contact Us</h1>
        <p>Welcome to our contact page!<br /> We are always here to help and look forward to hearing from you.</p>
        <!--
        <div class="address">
          <i class="fa fa-address-book" aria-hidden="true"></i>
          <p><strong>Address: </strong>198 West 21th Street, Suite 721 New York NY 10016</p>
        </div>
        <div class="phone">
          <i class="fa fa-phone-square" aria-hidden="true"></i>
          <p><strong>Phone: </strong>1234567890</p>
        </div>
        -->
        <div class="email">
          <i class="fa fa-paper-plane" aria-hidden="true"></i>
          <p><strong>E-mail: </strong>jonathan@canvasxpress.org</p>
        </div>
        <div class="website">
          <i class="fa fa-globe" aria-hidden="true"></i>
          <p><strong>Website: </strong>cxplot.com</p>
        </div>
      </div>
    </div>
  </div>
  <div id="response"></div>
  <script src='../../assets/js/jquery.min.js'></script>
  <script src='../../assets/js/script.js'></script>
</body>

</html>