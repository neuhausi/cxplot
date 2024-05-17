<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../assets/css/all.min.css">
    <link href="/assets/css/tidyverse.css" rel="stylesheet">
    <link rel="stylesheet" href="../../assets/css/style.css">
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
                    <a href="../Auth/login.php">Login</a>
                </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="blog-container">
        <div class=" text-center">
            <h1 class="blog-title">Our Blog</h1>
            <p class="blog-introduction">Welcome to our blog page, where we share our thoughts, experiences, and insights on cxplot. Our blog is a platform for us to connect with others who share similar interests and passions, and to share our knowledge and expertise in a way that is engaging and easy to understand.</p>
        </div>
        <div class="main flex">
            <form action="../action/blog_post_action.php" method="post" enctype="multipart/form-data" class="form-blog-post">
                <div class="form-group blog-part2">
                    <input type="file" id="fileInput" name="file">
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
                        <input type="submit" value="POST" id="blog-post" class="blog-button">
                        <a href="./blog.php" class="back text-center" id="cancel">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src='../../assets/js/jquery.min.js'></script>
    <script src='../../assets/js/blog.js'></script>
</body>
</html>