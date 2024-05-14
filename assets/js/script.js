$(document).ready(function() {
    $("#login-button").on('click', function() {
        var userEmail = $('#userEmail').val();
        var password = $('#password').val();
        console.log(userEmail, password);
        $('input#userEmail').keydown(function () {
            $('span#email-validate').css("display", "none");
        });
        $('input#password').keydown(function () {
            $('span#password-validate').css("display", "none");
        });

        if(userEmail == '') {
            $("span#email-validate").css("display","block");
        } 
        if(password == '') {
            $("span#password-validate").css("display","block");
        } else{
            $.ajax({
                url: "action.php",
                type: "post",
                data: {
                    type: "login",
                    userEmail: userEmail,
                    password: password,
                },
                dataType: "json",
                success: function(dataResult) {
                    if(dataResult == "SUCCESS") {
                        console.log(dataResult);
                        location.href = "../../index.php";
                        localStorage.setItem("myString", dataResult);
                    } else if(dataResult == "Error") {
                        $("span#password-validate").css("display","block");
                    }
                }
            })
        }
    })
    $("#contact-form").submit(function(e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: 'contact_action.php',
            data: $(this).serialize(),
            success: function(response) {
                console.log(response);
                // $("#response").html(response);
            }
        });
    });
})