/*
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
*/

// Ready de la función
window.onload = function(){
    sessionCheck();
    setLinkSeeMore();
    loadData();
};

function sessionCheck(){
    var response;
    $.ajax({
        type: "GET",
        url: "http://localhost:8000/details/0-A/ajax/loggedValidator",
        success: function(data) {
            response = data.logged;
            console.log(response);

            if (response == 'true'){
                document.getElementById('cerrar-sesion').style.display = 'block';
                document.getElementById('mi-perfil').style.display = 'block';
                document.getElementById('iniciar-sesion').style.display = 'none';
                document.getElementById('registrarse').style.display = 'none';
                /*$('#cerrar-sesion').show();*/
            }else{
                document.getElementById('cerrar-sesion').style.display = 'none';
                document.getElementById('mi-perfil').style.display = 'none';
                document.getElementById('iniciar-sesion').style.display = 'block';
                document.getElementById('registrarse').style.display = 'block';
            }
        }
    });
}

/*
    Carga los datos personales del vendedor en la vista
*/

function loadData(){
    //raiting: $("#raiting").val(),
    let data = {
                url: window.location.pathname.replaceAll(/(\/details\/)|(\/)/g,"") 
    }

    $.ajax({

        type: "POST",
        url:  `ajax/sellerProfileDescription`,
        data: data,
        success: function(data) {

            loadProfile(data.profile[0]);
            loadProducts(data.product);
            //loadRaiting(data.raiting);
            loadComment(data.comment);
        }
    });
}


/*
    Carga los productos del vendedor en la vista

     Contenido del parámetro product: 
        id,
        Title,
        Category,
        State,
        Municipality,
        Price,
        AS Quantity,
        AS CHAR) AS Date,
        AS Description,
        Image --> [{'key':'value'}, {'key':'value'}]
*/
function loadProducts(products){
    console.log(products);

    if (products.length !== 0) {
        
        $("#see-more").show();
        $("#published-product").empty();

        for (let index = 0; index < products.length; index++) {
            
            if (index < 2){
                let url = JSON.parse(products[index][products[index].length-1])

                $("#published-product").append(`
                    <div class="card">
                        <div class="card-header">
                            ${products[index][1]}
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <img class="card-img-top" src="${url["0"]}" style="padding-top:2rem;">
                                </div>
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <ul>
                                        <li>${products[index][2]}</li>
                                        <li>${products[index][3]}</li>
                                        <li>${products[index][4]}</li>
                                        <li>${products[index][5]}</li>
                                    </ul>
                                    <a href="http://localhost:8000/details/${convertURL(products[index][1], products[index][0])}" class="btn btn-primary btn-user btn-block">Ver Más</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>
                `);
            }
            
        }

    }
    else{
        
        $("#see-more").hide();

        $("#published-product").append(`
            <div class="card">
                <div class="card-header">
                    No ha publicado productos.
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <img class="card-img-top" src="https://content.optimumnutrition.com/i/on/on-on-C101148_Image_01?locale=en-us,en-gb,*&layer0=$PDP_002$" style="padding-top:2rem;">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                        </div>
                    </div>
                </div>
            </div>
        `);

    }   
}


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}

/*
    Carga los datos personales del vendedor
*/
function loadProfile(profile){

    $("#Sellerfirstname").val(`${profile[0]}`);
    $("#Sellerlastname").val(`${profile[1]}`);
    $("#Sellerphone").val(`${profile[4]}`);
    $("#Selleremail").val(`${profile[2]}`);
    $("#Selleraddress").val(`${profile[5]}`);
    $("#Sellerdepartment").val(`${profile[3]}`);
}



/*
    Se encarga de cargar los comentarios asociados al vendedor
*/
function loadComment(comments){

    if( comments.length == 0 ){
        document.getElementById('commentsRow').innerHTML += `
        <div class="container my-1 py-1 text-dark" style="width:100vw;">
        <div class="row d-flex justify-content-center">
        <div class="col-md-11 col-lg-9 col-xl-7">
            <div class="d-flex flex-start mb-4">
            <div class="card w-100">
                <div class="card-body p-4">
                <div class="">
                    <h5>Dinos que piensas sobre este vendedor.</h5>
                    <p class="small"></p>

                    <div class="d-flex justify-content-between align-items-center">

                    </div>
                </div>
                </div>
            </div>
            </div>
            
        </div>
        </div>
    </div>
            `; 
    } else{
        document.getElementById('commentsRow').innerHTML = "";

        for (let index = 0; index < comments.length; index++) {
            
            document.getElementById('commentsRow').innerHTML += `
                <div class="container my-1 py-1 text-dark" style="width:100vw;">
                    <div class="row d-flex justify-content-center">
                    <div class="col-md-11 col-lg-9 col-xl-7">
                        <div class="d-flex flex-start mb-4">
                        <img
                            class="rounded-circle shadow-1-strong me-3"
                            src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png"
                            alt="avatar"
                            width="65"
                            height="65"
                        />
                        <div class="card w-100">
                            <div class="card-body p-4">
                            <div class="">
                                <h5>${comments[index][0]}</h5>
                                <p class="small"></p>
                                <p>
                                ${comments[index][1]}
                                </p>

                                <div class="d-flex justify-content-between align-items-center">

                                </div>
                            </div>
                            </div>
                        </div>
                        </div>
                        
                    </div>
                    </div>
                </div>
            `;
        }
    }
}


// Carga la calificación (como un promedio ponderado) del vendedor
function loadRaiting(){

    let id = "#rating-";
    let rating = 0;
    for(let index = 1; index < 6; index++){
        
        if( $(`${id}${index}`).is(':checked') ){
            rating = parseInt( $(`${id}${index}`).val() ); 
        }
    }

    return rating;
}



/*
    Esta función se encarga de enviar hacia la base de datos un nevo comentario y la calificación publicado por un cliente. 
*/

function ratingAndComment(){

    console.log("Probando. 2:09am");

    var data = { 
        comment: $("#Ratecomment").val(),
        rating: loadRaiting(),
        email: $("#Selleremail").val()
    };

    console.log('DATA: ', data);

    //peticion que espera una variable text
    //url: "ajax/sellerRaitingAndComment",
    $.ajax({

    type: "POST",
    url: "ajax/ratingAndComment",
    data: data,

    success: function(data) {

        console.log(data);
        console.log("Agregado con éxito!");

        if (data.status == "Success") {

            rateformSuccess();
            loadData();
            $('#calificacionmodal').modal('toggle');

        } else {
            rateformError();
            ratesubmitMSG(false, data);
        }
    }
    });

}


function rateformSuccess() {
    alert("Se ha calificado con éxito!");
    $("#rateForm")[0].reset();
    ratesubmitMSG(true, "Ha calificado a vendedor éxitosamente!");
    $("input").removeClass('notEmpty'); // resets the field label after submission
}

function rateformError() {
    alert("Hubo un error no se pudo calificar al vendedor");
    $("#rateForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        $(this).removeClass();
    });
}

function ratesubmitMSG(valid, msg) {
    if (valid) {
        var msgClasses = "h3 text-center tada animated";
    } else {
        var msgClasses = "h3 text-center";
    }
    $("#ratemsgSubmit").removeClass().addClass(msgClasses).text(msg);
}


function setLinkSeeMore(){
    
    const url = window.location.pathname.split('/');
    document.getElementById('see-more').setAttribute('href', `${url[0]}/seller-product/${url[url.length-1]}` );
}


/*
$(function(){

    //*************************************************************
    $("#rateForm").validator().on("submit", function(event) {
        if (event.isDefaultPrevented()) {
            // handle the invalid form...
            rateformError();
            ratesubmitMSG(false, "Please fill all fields!");
        } else {
            // everything looks good!
            event.preventDefault();
            ratesubmitForm();
        }
    });
        function ratesubmitForm() {
        // Los datos estaticos son datos que se deben precargar: departamento, municipio
        // y categoria
        // initiate variables with form content

        var data = { 
                    comment: $("#Ratecomment").val(),
                    raiting: $("#raiting").val(),
                    email: $("#Uemail").val() 
            };

        //peticion que espera una variable text
        //url: "ajax/sellerRaitingAndComment",
        $.ajax({

            type: "POST",
            url: "ajax/ratingAndComment",
            data: data,

            success: function(data) {

                console.log(data);
                console.log("Agregado con éxito!");

                if (text.status == "Success") {

                    rateformSuccess();
                    location.reload();

                } else {
                    rateformError();
                    ratesubmitMSG(false, text);
                }
            }
        });
    }
    //}


    
    //*************************************************************

});
*/