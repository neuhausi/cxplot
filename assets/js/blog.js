$(document).ready(function() {
    setInterval(() => {
        console.log("SUCCESS")
        $.ajax({
            url: '../action/blog_action.php',
            type: 'POST',
            data: {
                type: "blog_read", 
            },
            dataType: 'json',
            success: function(response) {
                display(response);
            }
        })
    }, 1000);

    $('input#blog-title').keydown(function () {
        $("span#blogTitle-validator").css('display', 'none')
    });
    $('input#blog-description').keydown(function () {
        $("span#blogDescription-validator").css('display', 'none')
    });
})
function display(response) {
    dataHtml = '';
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
