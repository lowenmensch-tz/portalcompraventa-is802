window.onload = function(){
    sessionCheck();
    
};

$(function() {
    loadData(); // Carga datos iniciales al formulario del perfil de usuario
    inputTitleImageFile(); // Carga las fotos del perfil de usuario
    getCategories();

    /* Add Product Form */
    $("#ProductForm").validator().on("submit", function(event) {
        if (event.isDefaultPrevented()) {
            // handle the invalid form...
            PformError();
            PsubmitMSG(false, "Por favor llene todos los campos!");
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
                
                /*console.log("-----Datos del perfil del usuario-----");
                console.log(data);*/

                profile(data.profile[0]);
                //product data, url user 
                loadProduct(data.product, convertURL(
                        `${data.profile[0][0]} ${data.profile[0][1]}`, 
                        data.profile[0][data.profile[0].length-1])
                    );
                
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
        var state = $("#Pstate").val();
        var municipio = $("#Pmunicipio").val();
        var quantity = $("#Pcantidad").val();
        var category = $("#Pcategoria").val();


        municipio == 00 ? municipio = 299 : municipio = municipio;
        
        var data = { 
            'nombre': name, 
            'precio' : price, 
            'descripcion': description, 
            'fk_departamento': state,
            'fk_municipio': municipio, 
            'cantidad_disponible': quantity, 
            'fk_categoria': category 
        };

        

        //peticion que espera una variable text
        $.ajax({
            type: "POST",
            url: "ajax/almacenarArticulo",
            data: data,
            success: function(text) {
                //console.log(text);
                if (text.status == "Success") {
                    loadImage(); // Envia el o los archivos al backend para ser procesados y almacenados
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
        window.location.href = "user"
        $("#ProductForm")[0].reset();
        PsubmitMSG(true, "El producto se guardo con éxito!");
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

    //*************************************************************
    $("#UpdateForm").validator().on("submit", function(event) {
        if (event.isDefaultPrevented()) {
            // handle the invalid form...
            UformError();
            UsubmitMSG(false, "Por favor llene todos los campos!");
        } else {
            // everything looks good!
            event.preventDefault();
            UsubmitForm();
        }
    });
        function UsubmitForm() {
        // initiate variables with form content
        var firstname = $("#Ufirstname").val();
        var lastname = $("#Ulastname").val();
        var phone = $("#Uphone").val();
        var address = $("#Uaddress").val();
        var password = $("#Upassword").val();

        var data = { 'primer_nombre': firstname, 'apellido' : lastname, 'telefono': phone, 'direccion': address,
            'contrasenia': password };

        //peticion que espera una variable text
        $.ajax({
            type: "POST",
            url: "ajax/updateUser",
            data: data,
            success: function(text) {
                //console.log(text);
                if (text.status == "Success") {
                    UformSuccess();
                    window.location.href = "user";
                } else {
                    UformError();
                    UsubmitMSG(false, text);
                }
            }
        });
    }
    //}


    function UformSuccess() {
        alert("Se han actualizado tus datos");
        $("#UpdateForm")[0].reset();
        UsubmitMSG(true, "Se actualizaaron los datos correctamente!");
        $("input").removeClass('notEmpty'); // resets the field label after submission
    }

    function UformError() {
        alert("Los datos no se pudieron actualizar");
        $("#UpdateForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
            $(this).removeClass();
        });
    }

    function UsubmitMSG(valid, msg) {
        if (valid) {
            var msgClasses = "h3 text-center tada animated";
        } else {
            var msgClasses = "h3 text-center";
        }
        $("#umsgSubmit").removeClass().addClass(msgClasses).text(msg);
    }
    //*************************************************************


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
    function loadProduct(product, url){

        //${data.comment[`comment${i}`]}
        //let url = product.slice(product.length-1, product.length);

        //console.log(product);

        if (product.length !== 0) {
            
            $("#see-more").show();
            $("#published-product").empty();

            for (let index = 0; index < product.length; index++) {
                
                if (index < 2){
                    let url = JSON.parse(product[index][product[index].length-1])
                    //console.log( url );            

                    $("#published-product").append(`
                        <div class="card">
                            <div class="card-header">
                                ${product[index][1]}
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <img class="card-img-top" src="http://localhost:8000${url["0"]}" style="padding-top:2rem;">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <ul>
                                            <li>${product[index][2]}</li>
                                            <li>${product[index][3]}</li>
                                            <li>${product[index][4]}</li>
                                            <li>${product[index][5]}</li>
                                        </ul>
                                        <a href="http://localhost:8000/details/${convertURL(product[index][1], product[index][0])}" class="btn btn-primary btn-user btn-block">Ver Más</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br>
                    `);
                }
                
            } // end for

            document.getElementById("see-more").setAttribute(
                                                    "href", 
                                                    `http://localhost:8000/seller-product/${url}`
                                                )

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


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}


function mostrarMunicipios(){
    var municipio = $('#Pstate').val();
    var firstMunicipio;
    var lastMunicipio;
    switch(municipio){
        case "1":
            firstMunicipio = 42;
            lastMunicipio = 49;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "2":
            firstMunicipio = 104;
            lastMunicipio = 119;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "3":
            firstMunicipio = 50;
            lastMunicipio = 59;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "4":
            firstMunicipio = 60;
            lastMunicipio = 80;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "5":
            firstMunicipio = 81;
            lastMunicipio = 103;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "6":
            firstMunicipio = 29;
            lastMunicipio = 41;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "7":
            firstMunicipio = 120;
            lastMunicipio = 138;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "8":
            firstMunicipio = 1;
            lastMunicipio = 28;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "9":
            firstMunicipio = 139;
            lastMunicipio = 144;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "10":
            firstMunicipio = 145;
            lastMunicipio = 161;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "11":
            firstMunicipio = 162;
            lastMunicipio = 165;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "12":
            firstMunicipio = 166;
            lastMunicipio = 184;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "13":
            firstMunicipio = 185;
            lastMunicipio = 211;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "14":
            firstMunicipio = 212;
            lastMunicipio = 227;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "15":
            firstMunicipio = 228;
            lastMunicipio = 250;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "16":
            firstMunicipio = 251;
            lastMunicipio = 278;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "17":
            firstMunicipio = 279;
            lastMunicipio = 287;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "18":
            firstMunicipio = 288;
            lastMunicipio = 299;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "00":
            $('#Pmunicipio').hide();
            document.getElementById('Pmunicipio').innerHTML = "";
            document.getElementById('Pmunicipio').innerHTML = "<option value='00' selected> Municipio</option>";
            break;
        default:
            //alert('Sorry debe seleccionar un departamento');
            document.getElementById('Pmunicipio').innerHTML = "";
            document.getElementById('Pmunicipio').innerHTML = "<option value='00' selected> Municipio</option>";
    }
}
function getherMunicipio(firstMunicipio, lastMunicipio){
    $('#Pmunicipio').show();
    $.ajax({
        type: "POST",
        url: "ajax/getMunicipios",
        data: {'firstMunicipio': firstMunicipio, 'lastMunicipio':lastMunicipio},
        success: function(data){
            
            if (data.status == "Success"){
                document.getElementById('Pmunicipio').innerHTML = "";
                // document.getElementById('Pmunicipio').innerHTML = "<option value='00' selected> Municipio</option>";
                for(i=0;i<(data.data).length;i++){
                    document.getElementById('Pmunicipio').innerHTML +=`
                        <option value="${data.data[i][0]}">${data.data[i][1]}</option>
                    `
                }
            }else{
                alert('Sorry no existen municipios');
            }
        }
    });
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
            //console.log(response);

            if (response == 'true'){
                
            }else{
                window.location.href = "login";
            }
        }
    });
}


//Carga el nombre de la imagen en el input
function inputTitleImageFile(){
    
    //console.log("HOLA");

    $('input[type="file"]').on("change", function() {
        let filenames = [];
        let files = this.files;

        if (files.length > 1) {

          filenames.push("Archvios Totales (" + files.length + ")");

          for (let i in files) {
              sizeValidImageFile(files[i]);
              formatValidImage(files[i]);
          }

        } else {

          for (let i in files) {

            if (files.hasOwnProperty(i)) {
                filenames.push(files[i].name);
              }

              sizeValidImageFile(files[i]);
              formatValidImage(files[i]);
          }
        }
        
        $(this)
          .next(".custom-file-label")
          .html(filenames.join(","));
      });
}


//Tamaño valido de la imagen 2MB
function sizeValidImageFile(file){
    
    var size = file.size;
    var maxSize = 1024 * 1024 * 2; // 2MB Máximo

    if (size > maxSize) {
        alert(`El archivo "${file.name}", es demasiado grande.`);
        return false;
    }
    return true;
}


// Validar solo archivos con formato de imagen  jpeg|png|gif|bmp|jpg
function formatValidImage(file){

    var type = file.type;
    let pattern = /^image\/(jpeg|png|gif|jpg|bmp)$/i;

    /*console.log(type);
    console.log("¿TIPO?");*/

    if (type !== undefined) {

        if (!type.match(pattern)) {
            alert(`El archivo "${file.name}", no es un formato acepato.`);
            return false;
        }
        return true;

    }
}


/*
    Se encarga de obtener los objetos de tipo imagen para ser enviados al backend
*/
function loadImage(){
            
    var input = document.querySelector('input[type="file"]');

    var data = new FormData();
    
    if (input.files.length > 0) {

        for (let index = 0; index < input.files.length; index++) {
            
            data.append(`file-${index}`, input.files[index]);

        }
    }

    //console.log("Se ejecuta?");
    
    const url = 'ajax/loadImage';

    const option = {
        method: 'POST',
        body: data,
    };

    fetch(url, option)
        .then(response => response.json())
        .then(response => {
            //console.log(response);
        });
}

function getCategories(){
    $.ajax({
        type: "POST",
        url: "ajax/getCategories",
        data: {},
        success: function(data){
            
            if (data.status == "Success"){
                console.log(data.data);
                document.getElementById('Pcategoria').innerHTML = '';
                document.getElementById('Pcategoria').innerHTML = '<option value="00" selected>Categoria</option>';
                for(i=0; i<(data.data).length; i++){
                    document.getElementById('Pcategoria').innerHTML += `<option value="${data.data[i][0]}"> ${data.data[i][1]}</option>`
                }
                //loadCategories(data.data);
            }else{
                alert('No existen categorias');
            }
        }
    });
}