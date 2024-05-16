<?php
session_start();
if(!$_SESSION['userEmail']){
  header("Location: login.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/all.min.css">
    <link href="/assets/css/tidyverse.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">
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
                    <a href="login.php">Download</a>
                </li>
                <li>
                    <a href="logout.php">Logout</a>
                </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="blog-container">
        <div class=" text-center">
            <h1 class="blog-title">Our Blog</h1>
            <p class="blog-introduction">Welcome to our blog page, where we share our thoughts, experiences, and insights on cxplot. Our blog is a platform for us to connect with others who share similar interests and passions, and to share our knowledge and expertise in a way that is engaging and easy to understand. Whether you're looking for inspiration, advice, or simply a fresh perspective, we hope you'll find something valuable in our blog posts</p>
        </div>
        <div class="main flex">
            <div class="form-group">
                <div class="avatar-wrapper">
                    <img class="profile-pic" src="../assets/images/1177568.png" />
                    <div class="upload-button">
                        <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
                    </div>
                    <input type="hidden" id="image-src" value="">
                    <input class="file-upload" type="file" accept="image/*"/>
                </div>
                <span id="imageValue-validator">Please Select Your Avatar</span>
            </div>
            <div class="blog-part2">
                <div class="form-group">
                    <label for="title">Title: </label>
                    <input type="text" name="blog-title" class="blog-title" id="blog-title">
                    <span id="blogTitle-validator">Please enter your title.</span>
                </div>
                <div class="form-group">
                    <label for="description">Description: </label>
                    <textarea name="blog-description" id="blog-description" rows="4" cols="50"></textarea>
                    <span id="blogDescription-validator">Please enter your description</span>
                </div>
                <div class="form-group flex">
                    <input type="button" value="POST" id="blog-post" class="blog-button">
                    <a href="../index.php" class="back text-center" id="cancel">Back</a>
                </div>
            </div>
        </div>
    </div>
    <script src='../assets/js/jquery.min.js'></script>
    <script src='../assets/js/blog.js'></script>
</body>
</html>