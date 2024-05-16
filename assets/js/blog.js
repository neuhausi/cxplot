$(document).ready(function() {
    setTimeout(function() {
        console.log("SUCCESS")
        $.ajax({
            url: 'blog_action.php',
            type: 'POST',
            data: {
                type: "blog_read", 
            },
            dataType: 'json',
            success: function(response) {
                display(response);
            }
        })
    }, 2000);

    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.profile-pic').attr('src', e.target.result);
                $("input#image-src").val(e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-upload").on('change', function(){
        readURL(this);
    });
    
    $(".upload-button").on('click', function() {
       $(".file-upload").click();
       $("span#imageValue-validator").css('display', 'none')
    });
    $('input#blog-title').keydown(function () {
        $("span#blogTitle-validator").css('display', 'none')
    });
    $('input#blog-description').keydown(function () {
        $("span#blogDescription-validator").css('display', 'none')
    });
    $("input#blog-post").click(function() {
        var imageValue = $("input#image-src").val();
        var blogTitle = $("input#blog-title").val();
        var blogDescription = $("textarea#blog-description").val();
        if(!imageValue){
            $("span#imageValue-validator").css('display', 'block');
            return;
        }
        if(!blogTitle){
            $("span#blogTitle-validator").css('display', 'block');
            return;
        }
        if(!blogDescription){
            $("span#blogDescription-validator").css('display', 'block');
            return;
        }
        $.ajax({
            url: "blog_action.php",
            type: "POST",
            data: {
                type: "blogPost",
                imageValue,
                blogTitle,
                blogDescription,
            },
            success: function(response){
                console.log(response);
                if(response == "SUCCESS") {
                    location.href = "../../backend/blog.php";
                }
            }
        })
    })
})
dataHtml = '';
function display(response) {
    response.map((value, index) => {
        dataHtml += "<div id='" + value.id + "' class='blog-content left'>";
        dataHtml += "<img src='" + value.picture + "' class='blog-picture'>" +
                    "<p class='blog-date'>" + value.created_at +  "</p>" +
                    "<h1 class='blog-title'>" + value.title + "</h1>" + 
                    "<p class='blog-description'>" + value.description + "</p>" + 
                    "<button type='button' class='blog-read-button' id='read-more-button'>Read More</button>";
        dataHtml += "</div>";
    })
    $("div#page").html(dataHtml);
}
