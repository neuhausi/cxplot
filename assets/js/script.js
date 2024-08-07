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
        } else if(password == '') {
            $("span#password-validate").css("display","block");
        } else{
            $.ajax({
                url: "../action/action.php",
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
                        $("span#error-validate").css("display","block");
                    }
                }
            })
        }
    })

    $("#register-button").on('click', function(){
        var registerName = $("#registerName").val();
        var registerEmail = $("#registerEmail").val();
        var registerPassword = $("#registerPassword").val();
        var confirmRegisterPassword = $("#confirmRegisterPassword").val();
        
        $('input#registerName').keydown(function () {
            $('span#name-validate').css("display", "none");
        });
        $('input#registerEmail').keydown(function () {
            $('span#email-validate').css("display", "none");
        });
        $('input#registerPassword').keydown(function () {
            $('span#password-validate').css("display", "none");
        });
        $('input#confirmRegisterPassword').keydown(function () {
            $('span#confirm-password-validate').css("display", "none");
        });
        if(!registerName) {
            $('span#name-validate').css("display", "block");
            return;
        }
        if(!registerEmail) {
            $('span#email-validate').css("display", "block");
            return;
        }
        if(!registerPassword) {
            $('span#password-validate').css("display", "block");
            return;
        }
        if(registerPassword != confirmRegisterPassword){
            $("span#confirm-password-validate").css("display","block");
            return;
        }
        $.ajax({
            url: "../action/action.php",
            type: "post",
            data: {
                type: "register",
                registerName,
                registerEmail,
                registerPassword,
            },
            success: function(response) {
                console.log(response);
                if(response == "SUCCESS") {
                    location.href = "../../backend/Auth/login.php";
                }
            }
        })
    })

    $("#contact-form").submit(function(e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: '../action/contact_action.php',
            data: $(this).serialize(),
            success: function(response) {
                console.log(response);
                // $("#response").html(response);
            }
        });
    });

    $("input#forget-button").on('click', function() {
        var forgetEmail = $("input#forgetEmail").val();
        $('input#forgetEmail').keydown(function () {
            $('span#forget-email-validate').css("display", "none");
        });
        if(!forgetEmail) {
            $('span#forget-email-validate').css("display", "block");
            return;
        }
        $.ajax({
            url: "../action/action.php",
            type: "POST",
            data: {
                type: "forgetPassword",
                forgetEmail,
            },
            success: function(response) {
                if(response == 'SUCCESS') {
                    location.href = "../../backend/Auth/resetPassword.php";
                } else if(response == "Error") {
                    $('span#forget-email-validate').css("display", "block");
                    return;
                }
            }
        })
    })

    $("input#reset-button").on('click', function() {
        var resetEmail = $("input#resetEmail").val();
        var resetPassword = $("input#resetPassword").val();
        var resetConfirmPassword = $("input#confirmResetPassword").val();
        $('input#forgetEmail').keydown(function () {
            $('span#reset-email-validate').css("display", "none");
        });
        $('input#resetPassword').keydown(function () {
            $('span#password-validate').css("display", "none");
        });
        $('input#confirmResetPassword').keydown(function () {
            $('span#confirm-password-validate').css("display", "none");
        });
        if(!resetEmail) {
            $('span#reset-email-validate').css("display", "block");
            return;
        }
        if(!resetPassword) {
            $('span#password-validate').css("display", "block");
            return;
        }
        if(!resetConfirmPassword) {
            $('span#confirm-password-validate').css("display", "block");
            return;
        }
        if(resetConfirmPassword != resetPassword) {
            $('span#confirm-password-validate').css("display", "block");
            return;
        }
        console.log(resetEmail, resetPassword, resetConfirmPassword);
        $.ajax({
            url: '../action/action.php',
            type: 'POST',
            data: {
                type: 'resetPassword',
                resetEmail,
                resetPassword,
                resetConfirmPassword,
            },
            success: function(response) {
                console.log(response);
                if(response == "SUCCESS") {
                    location.href = "../../index.php";
                }
            }
        })
    })
})