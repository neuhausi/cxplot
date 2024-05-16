$(document).ready(function() {
    setTimeout(function() {
        console.log("SUCCESS")
        $.ajax({
            url: '../action/blog_action.php',
            type: 'GET',
            data: {
                type: "blog_read", 
            },
            dataType: 'json',
            success: function(response) {
                display(response);
            }
        })
    }, 2000);
    $('input#blog-title').keydown(function () {
        $("span#blogTitle-validator").css('display', 'none')
    });
    $('input#blog-description').keydown(function () {
        $("span#blogDescription-validator").css('display', 'none')
    });
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
