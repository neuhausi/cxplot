<?php
session_start();
if(!$_SESSION['userEmail']){
  header("Location: ../Auth/login.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link href="/assets/css/tidyverse.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom p-10" role="navigation">
            <div class="navbar-header">
                <div class="navbar-brand-container">
                    <a class="navbar-brand" href="/index.php">cxplot</a>
                </div>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="../download.php">Download</a>
                </li>
                <li>
                    <a href="../Auth/logout.php">Logout</a>
                </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="blog-first-container">
        <div class="blog-page-button-part">
            <a href="./createBlog.php" class="post-button">Post</a>
            <p class="blog-first-introduction">Curious about cxplot? So are we! Our blog page is a place where we explore the latest developments and trends in Blog, as well as share our own experiences and insights. We believe that blogging is a powerful way to connect with others who share similar interests and passions, and we hope you'll find something useful and enjoyable in our blog posts</p>
        </div>
        <div id="page" class="blog-page">
        </div>
    </div>
    
    <script src='../../assets/js/jquery.min.js'></script>
    <script src='../../assets/js/blog.js'></script>
</body>
</html>