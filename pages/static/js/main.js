$(function() {
	/* Sign Up Form */
    $("#registerForm").validator().on("submit", function(event) {
    	if (event.isDefaultPrevented()) {
            // handle the invalid form...
            sformError();
            ssubmitMSG(false, "Please fill all fields!");
        } else {
            // everything looks good!
            event.preventDefault();
            ssubmitForm();
        }
    });

    function ssubmitForm() {
        // initiate variables with form content
		var firstname = $("#rfirstname").val();
		var lastname = $("#rlastname").val();
		var email = $("#remail").val();
		var password = $("#rpassword").val();
        var passwordr = $("#rpasswordr").val();
        var phone = $("#rphone").val();
        var address = $("#raddress").val();
        //var state = $("#rstate").val();
        var terms = $('#rcustomCheck').is(':checked');
        var data = { firstname : firstname, lastname : lastname, email: email, password: password, passwordr: passwordr, phone: phone, address: address, terms: terms };

        //peticion que espera una variable text
        $.ajax({
            type: "POST",
            url: "ajax/registerUser",
            data: data,
            success: function(text) {
                console.log(text);
                if (text.status == "Success") {
                    //sformSuccess();
                    window.location.replace("/login");
                } else if (text.status == "userFailed"){
                    document.getElementById("registerCatchError").innerHTML = "Ya existe un usuario con este Correo";
                    document.getElementById("registerCatchError").style.display = "block";
                    $("#remail").val('');
                    setTimeout(function() {
                        document.getElementById("registerCatchError").style.display = "none";
                    }, 3000);
                } else if (text.status == "passwordFailed"){
                    document.getElementById("registerCatchError").innerHTML = "Las Contraseñas no Coinciden";
                    document.getElementById("registerCatchError").style.display = "block";
                    $("#rpassword").val('');
                    $("#rpasswordr").val('');
                    setTimeout(function() {
                        document.getElementById("registerCatchError").style.display = "none";
                    }, 3000);
                } else {
                    sformError();
                    ssubmitMSG(false, text);
                }
            }
        });
	}

    function sformSuccess() {
        $("#signUpForm")[0].reset();
        ssubmitMSG(true, "Sign Up Submitted!");
        $("input").removeClass('notEmpty'); // resets the field label after submission
    }

    function sformError() {
        $("#signUpForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
            $(this).removeClass();
        });
	}

    function ssubmitMSG(valid, msg) {
        if (valid) {
            var msgClasses = "h3 text-center tada animated";
        } else {
            var msgClasses = "h3 text-center";
        }
        $("#smsgSubmit").removeClass().addClass(msgClasses).text(msg);
    }


    /* Log In Form */
    $("#loginForm").validator().on("submit", function(event) {
    	if (event.isDefaultPrevented()) {
            // handle the invalid form...
            lformError();
            lsubmitMSG(false, "Please fill all fields!");
        } else {
            // everything looks good!
            event.preventDefault();
            lsubmitForm();
        }
    });

    function lsubmitForm() {
        // initiate variables with form content
		var email = $("#lemail").val();
		var password = $("#lpassword").val();
        var remember = $('#customCheck').is(':checked');
        var data = { email: email, password: password, remember: remember };

        $.ajax({
            type: "POST",
            url: "ajax/loginValidation",
            data: data,
            success: function(text) {
                if (text.status == "Success") {
                    //lformSuccess();
                    window.location.replace("/");
                } else if (text.status == "Failed"){
                    document.getElementById("loginCatchError").innerHTML = "Usuario o Contraseña no Válida";
                    document.getElementById("loginCatchError").style.display = "block";
                    setTimeout(function() {
                        document.getElementById("loginCatchError").style.display = "none";
                    }, 3000);
                } else {
                    lformError();
                    console.error(text)
                    lsubmitMSG(false, text);
                }
            }
        });
	}

    function lformSuccess() {
        $("#logInForm")[0].reset();
        lsubmitMSG(true, "Log In Submitted!");
        $("input").removeClass('notEmpty'); // resets the field label after submission
    }

    function lformError() {
        $("#logInForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
            $(this).removeClass();
        });
	}

    function lsubmitMSG(valid, msg) {
        if (valid) {
            var msgClasses = "h3 text-center tada animated";
        } else {
            var msgClasses = "h3 text-center";
        }
        $("#lmsgSubmit").removeClass().addClass(msgClasses).text(msg);
    }
});