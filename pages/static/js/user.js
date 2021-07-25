window.onload = function(){
    sessionCheck();
};

$(function() {
    loadData(); // Carga datos iniciales al formulario del perfil de usuario

    /* Add Product Form */
    $("#ProductForm").validator().on("submit", function(event) {
        if (event.isDefaultPrevented()) {
            // handle the invalid form...
            PformError();
            PsubmitMSG(false, "Please fill all fields!");
        } else {
            // everything looks good!
            event.preventDefault();
            PsubmitForm();
        }
    });


    function loadData(){
        
        $.ajax({
            type: "POST",
            url:  `user-profile`,     
            data: {},       
            success: function(data) {
                
                console.log("-----Datos del perfil del usuario-----");
                console.log(data);

                profile(data.profile[0]);
                loadProduct(data.product);
                
                //$("#Ustate").val(`${data.state}`);
            }
        });
    }
    
    /*
         Agrega un nuevo producto
    */ 
    function PsubmitForm() {
        // Los datos estaticos son datos que se deben precargar: departamento, municipio
        // y categoria
        // initiate variables with form content
        var name = $("#Pname").val();
        var price = $("#Pprice").val();
        var description = $("#Pdescription").val();
        var state = 2;
        var municipio = 2;
        var quantity = $("#Pcantidad").val();
        var category = 3;
        var url_img1 = $("#Pimage1").val();
        var url_img2 = $("#Pimage2").val();
        var url_img3 = $("#Pimage3").val();

        var data = { 'nombre': name, 'precio' : price, 'descripcion': description, 'fk_departamento': state,
            'fk_municipio': municipio, 'cantidad_disponible': quantity, 'fk_categoria': category, 'link_imagen1': url_img1,
            'link_imagen2': url_img2, 'link_imagen3': url_img3};

        //peticion que espera una variable text
        $.ajax({
            type: "POST",
            url: "ajax/almacenarArticulo",
            data: data,
            success: function(text) {
                console.log(text);
                if (text.status == "Success") {
                    PformSuccess();
                } else {
                    PformError();
                    PsubmitMSG(false, text);
                }
            }
        });

        loadData();
    }
    //}


    function PformSuccess() {
        alert("El producto se guardo");
        $("#ProductForm")[0].reset();
        PsubmitMSG(true, "Sign Up Submitted!");
        $("input").removeClass('notEmpty'); // resets the field label after submission
    }

    function PformError() {
        alert("El producto no se guardo");
        $("#ProductForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
            $(this).removeClass();
        });
    }

    function PsubmitMSG(valid, msg) {
        if (valid) {
            var msgClasses = "h3 text-center tada animated";
        } else {
            var msgClasses = "h3 text-center";
        }
        $("#PmsgSubmit").removeClass().addClass(msgClasses).text(msg);
    }


    // Carga los elementos del perfil del usuario en el template.
    function profile(profile){
        
        $("#Ufirstname").val(`${profile[0]}`);
        $("#Ulastname").val(`${profile[1]}`);
        $("#Uemail").val(`${profile[2]}`);
        $("#Upassword").val(`${profile[3]}`);
        $("#Uphone").val(`${profile[4]}`);
        $("#Uaddress").val(`${profile[5]}`);
    }


    // Carga la información del producto en la vista del ususario. 
    /*
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
    function loadProduct(product){

        //${data.comment[`comment${i}`]}
        //let url = product.slice(product.length-1, product.length);

        console.log(product);

        if (product.length !== 0) {
            
            $("#see-more").show();
            $("#published-product").empty();

            for (let index = 0; index < product.length; index++) {
                
                if (index < 2){
                    let url = JSON.parse(product[index][product[index].length-1])
                    console.log( url );            

                    $("#published-product").append(`
                        <div class="card">
                            <div class="card-header">
                                ${product[index][1]}
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <img class="card-img-top" src="${url["0"]}" style="padding-top:2rem;">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <ul>
                                            <li>${product[index][2]}</li>
                                            <li>${product[index][3]}</li>
                                            <li>${product[index][4]}</li>
                                            <li>${product[index][5]}</li>
                                        </ul>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">Ver Mas</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br>
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

});

function mostrarMunicipios(){
    var municipio = $('#Pstate').val();
    if (municipio==06){
        $('#Pmunicipio').html('');
        $('#Pmunicipio').append(`
            <option value="00" selected> Municipio</option>
            <option value="29">San Pedro Sula</option>
            <option value="30">Choloma</option>
            <option value="31">La Lima</option>
            <option value="32">Omoa</option>
            <option value="33">Pimienta</option>
            <option value="34">Potrerillos</option>
            <option value="35">Puerto Cortés</option>
            <option value="36">San Antonio de Córtes</option>
            <option value="37">San Francisco de Yojoa</option>
            <option value="38">San Manuel</option>
            <option value="39">Santa Cruz de Yojoa</option>
            <option value="40">Villanueva</option>
        `);
        $('#Pmunicipio').show();
    }else if(municipio==08){
        $('#Pmunicipio').html('');
        $('#Pmunicipio').append(`
            <option value="00" selected> Municipio</option>
            <option value="01">Distrito Central</option>
            <option value="02">Alubarén</option>
            <option value="03">Cantarranas</option>
            <option value="04">Cedros</option>
            <option value="05">Curarén</option>
            <option value="06">El Porvenir</option>
            <option value="07">Guaimaca</option>
            <option value="08">La Libertad</option>
            <option value="09">La Venta</option>
            <option value="10">Lepaterique</option>
            <option value="11">Maraita</option>
            <option value="12">Marale</option>
            <option value="13">Nueva Armenia</option>
            <option value="14">Ojojona</option>
            <option value="15">Orica</option>
            <option value="16">Reitoca</option>
            <option value="17">Sabanagrande</option>
            <option value="18">San Antonio de Oriente</option>
            <option value="19">San Buenaventura</option>
            <option value="20">San Ignacio</option>
            <option value="21">San Miguelito</option>
            <option value="22">Santa Ana</option>
            <option value="23">Santa Lucía</option>
            <option value="24">Talanga</option>
            <option value="25">Tatumbla</option>
            <option value="26">Valle de Ángeles</option>
            <option value="27">Vallecillo</option>
            <option value="28">Villa de San Francisco</option>
        `);
        $('#Pmunicipio').show();
    }else{
        $('#Pmunicipio').hide(); 
    }
}

function logout(){
    $.ajax({
            type: "POST",
            url: "logout",
            data: {},
            success: function(text) {
                window.location.href = "/";
            }
        });
}

function sessionCheck(){
    var response;
    $.ajax({
        type: "GET",
        url: "details/0-A/ajax/loggedValidator",
        success: function(data) {
            response = data.logged;
            console.log(response);

            if (response == 'true'){
                alert("Bienvenido");
            }else{
                window.location.href = "login";
            }
        }
    });
}