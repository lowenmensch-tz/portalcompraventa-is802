/*
    @author kenneth.cruz@unah.hn
    @date   2021/07/29
    @version 0.1.0
*/

// Ready de la función
window.onload = function(){
    sessionCheck();
    loadDataListProductPublisher();
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
    - status
    - raiting
    - product
    - name
*/

function loadDataListProductPublisher(){
    let data = {
                    url: window.location.pathname
                };

    const url = "ajax/listProductPublisher" ;

    const option = {
        method: "POST",
        body: JSON.stringify(data),
        headers:{
            'Content-Type': 'application/json'
          }
    };
    
    fetch(url, option)
        .then(response => response.json())
        .catch(error => console.log(error))
        .then(response => {
            loadProfile(response.name);
            loadProducts(response.product, true);
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
function loadProducts(products, visible){
    console.log(products);
    
    var gridProduct = document.getElementById('published-product');
    var rows; 
    
    if (products.length !== 0) {
        
        let index = 0;
        gridProduct.innerHTML = "";
        //document.getElementById('rows-product');
        for (let i = 0; i < Math.ceil(products.length/3); i++) { //Cantidad de filas
            
            gridProduct.innerHTML += `
                <div class="container-fluid">
                    <div class="row align-items-end" id="rows-product-${i}">
                    </div>
                </div>
                <br>
            `; 
            
            rows = document.getElementById(`rows-product-${i}`);

            for (let j = 0; j < 3; j++) {
                
                //if (j < products.length-1){ //ESTA MAL ESTA CONDICION
                    
                    let url = JSON.parse(products[index][products[index].length-1]) //path de imágenes asociadas a cada producto
    
                    rows.innerHTML += `
                        <div class="col col-lg-4"">
                            <div class="card">
                                <div class="card-header">
                    
                                <div class="row justify-content-between h-10">
                                        <div class="col-6">
                                            ${products[index][1].slice(0, 35) + "..."}  
                                        </div>
                                        <div id="ghost-product-card-header" style="display:none">${products[index][0]}</div>
                                        <div class="col-1" id="updateProduct-${index}"></div> 
                                        <div class="col-1" id="deleteProduct-${index}"></div>
                                    </div>
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
                        </div><!-- /.col -->
                    `;

                    //Delete product
                    // data-target="#deleteProduct"
                    // data-toggle="modal"                    
                    if (visible) {

                        document.getElementById(`deleteProduct-${index}`).innerHTML = `
                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            width="24" height="24"
                            viewBox="0 0 172 172"

                            class="close"
                            type="button"
                            onclick="drawModalDeleteProduct(this)"
                            
                            style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#666666"><path d="M33.73372,23.59961l-10.13411,10.13411l52.26628,52.26628l-52.26628,52.26628l10.13411,10.13411l52.26628,-52.26628l52.26628,52.26628l10.13411,-10.13411l-52.26628,-52.26628l52.26628,-52.26628l-10.13411,-10.13411l-52.26628,52.26628z"></path></g></g></svg>
                        `;

                        document.getElementById(`updateProduct-${index}`).innerHTML = `
                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            width="24" height="24"
                            viewBox="0 0 172 172"

                            class="close"
                            type="button"
                            onclick="drawModalUpdateProduct(this)"

                            style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#666666"><path d="M86,17.2c-35.99295,0 -65.57744,27.81618 -68.50885,63.06667h-17.49115l22.93333,34.4l22.93333,-34.4h-16.92005c2.86771,-29.02255 27.25977,-51.6 57.05339,-51.6c14.23815,0 27.21,5.16053 37.23308,13.72865c1.54499,1.41681 3.73999,1.87758 5.72428,1.20164c1.9843,-0.67594 3.44157,-2.38084 3.80039,-4.44617c0.35882,-2.06533 -0.43802,-4.16185 -2.07806,-5.46745c-12.01586,-10.27162 -27.6597,-16.48333 -44.67969,-16.48333zM149.06667,57.33333l-22.93333,34.4h16.92005c-2.86772,29.02256 -27.25978,51.6 -57.05339,51.6c-14.23815,0 -27.21,-5.16053 -37.23307,-13.72864c-1.54499,-1.41681 -3.73999,-1.87758 -5.72428,-1.20165c-1.9843,0.67594 -3.44157,2.38084 -3.80039,4.44617c-0.35882,2.06533 0.43802,4.16185 2.07806,5.46745c12.01586,10.27162 27.6597,16.48333 44.67969,16.48333c35.99294,0 65.57744,-27.81618 68.50886,-63.06667h17.49114z"></path></g></g></svg>
                        `;

                    }
    
                // }   //end if
                // else{
                //     console.log("Metiendo columnas vacías");

                //     rows.innerHTML += `
                //         <div class="col-2">
                //             <div class="card-header">
                //                 <div class="card-body">
                //                 </div>
                //             </div>
                //         </div>
                //     `;
                // }

                index++;
            } //end for
        }

    }
}


function loadProfile(name){
    document.getElementById("name-publisher").innerHTML = `${name}, su lista de productos:`;
}


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
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


function showModal(modalName){
    $(modalName).modal('show');
}


function closeModal(modalName){
    $(modalName).modal('hide');
}


function drawModalDeleteProduct(objetc){
    
    var nameProduct = String(objetc.parentNode.parentNode.firstChild.nextSibling.innerHTML).replace(/^\s+|\s+$/g, ''); 
    var idProduct =  parseInt( objetc.parentNode.parentNode.childNodes[3].innerHTML.replace(/^\s+|\s+$/g, '') );

    console.log("drawModal");
    console.log(idProduct);

    document.getElementById("modal-text-content").innerHTML = `
    ¿Desea eliminar <strong class="alert-link">${nameProduct}</strong> de su lista de productos?
    `;

    document.getElementById("ghost-product-modal").innerHTML = `${idProduct}`;
    document.getElementById("ghost-product-modal").style.display = "none";

    showModal("#modalDeleteProduct");

}


function deleteProduct(idProduct){

    var idProduct = parseInt( idProduct.parentNode.firstChild.nextElementSibling.innerHTML.replace(/^\s+|\s+$/g, '') );

    var data = new FormData();
    data.append("idProduct", idProduct);

    const url = "ajax/deleteProductPublisher";

    const option = {
        method: "POST",
        body: data
    };

    fetch(url, option)
        .then( response =>  response.json())
        .catch( error => console.log(error))
        .then(response => {

            console.log(response);
            if(response.status == "Success"){
                console.log("Eliminado con éxito!");
                loadDataListProductPublisher();
                closeModal("#modalDeleteProduct");
            }
            else{
                console.log("Error al eliminar");
            }

        });

}


function drawModalUpdateProduct(objetc){
    var nameProduct = String(objetc.parentNode.parentNode.firstChild.nextSibling.innerHTML).replace(/^\s+|\s+$/g, ''); 
    var idProduct =  parseInt( objetc.parentNode.parentNode.childNodes[3].innerHTML.replace(/^\s+|\s+$/g, '') );

    console.log("drawModal");
    console.log(idProduct);

    drawFormInModal();
    getDetailProduct(idProduct);

    document.getElementById("ghost-update-product-modal").innerHTML = `${idProduct}`;
    document.getElementById("ghost-update-product-modal").style.display = "none";

    showModal("#modalUpdateProduct");
}


function updateProduct(idProduct){

}


function getDetailProduct(idProduct){

    var data = new FormData();
    data.append("idProduct", idProduct);

    const url = "ajax/getDetailProduct";

    const option = {
        method: "POST",
        body: data
    };

    fetch(url, option)
        .then( response =>  response.json())
        .catch( error => console.log(error))
        .then(response => {

            console.log(response);
            if(response.status == "Success"){
                fillForm(response.product[0]);   
            }
            else{
                console.log("Error al obtener los datos del producto");
            }

        });
}


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
function fillForm(product){
    console.log("MIS PRODUCTOS:\n");
    console.log(product);
    document.getElementById("titleProduct").value = `${product[1]}`;
    document.getElementById("descriptionProduct").value = `${product[8]}`;
    document.getElementById("categoryProduct").value = `${product[2]}`;
    document.getElementById("stateProduct").value = `${product[3]}`;
    document.getElementById("municipalityProduct").value = `${product[4]}`;
    document.getElementById("priceProduct").value = `${product[5].replaceAll(/(,)|(\.0{2})/g,'')}`;
    document.getElementById("avalaibleProduct").value = `${product[6]}`;
    // document.getElementById("imageProduct").value = `${product[product.length-1]}`;

}


function drawFormInModal(){
    
    document.getElementById("modal-text-content-update-product").innerHTML = `
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="titleProduct">Nombre del producto</label>
                    <input type="text" class="form-control validate" id="titleProduct" placeholder="Nombre del producto" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="descriptionProduct">Descripción del producto</label>
                    <textarea class="form-control validate" id="descriptionProduct" rows="3" required></textarea>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="categoryProduct">Categoría</label>
                    <input type="text" class="form-control validate" readonly id="categoryProduct" placeholder="Categoría" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="stateProduct">Estado</label>
                    <select class="form-control validate" readonly id="stateProduct" required>
                        <option id=""></option>
                    </select>
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="municipalityProduct">Municipio</label>
                    <select class="form-control validate" readonly id="municipalityProduct" required>
                        <option></option>
                    </select>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="priceProduct">Precio</label>
                    <input type="text" class="form-control validate" id="priceProduct" placeholder="Precio" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="avalaibleProduct">Cantidad Disponible</label>
                    <input type="text" class="form-control validate" id="avalaibleProduct" placeholder="Cantidad Disponible" required>
                    
                    
                </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-primary btn-user btn-block btn-rounded mb-4" onclick="updateProduct(this)">Actualizar Datos</button>
                    </div>
                    <!-- <button type="button" class="btn btn-primary btn-user btn-block" onclick="updateProduct(this)">Actualizar Datos</button> -->
            </div> 
    `;
}