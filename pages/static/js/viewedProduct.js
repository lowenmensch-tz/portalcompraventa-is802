/**
 * @author kenneth.cruz@unah.hn
 * @version 0.1.0
 * @date 2021/08/14
 * */


var id_product;

function drawModalDeleteProduct(idProduct){
    //var nameProduct = String(objetc.parentNode.parentNode.firstChild.nextSibling.innerHTML).replace(/^\s+|\s+$/g, ''); 

    console.log("drawModal");
    console.log(idProduct);

    drawFormDeleteProductInModal();
    getDetailProduct(idProduct);

    document.getElementById("ghost-update-product-modal").innerHTML = `${idProduct}`;
    document.getElementById("ghost-update-product-modal").style.display = "none";

    $("#modalDeleteProduct").modal("show");
    id_product = idProduct;
}


function getDetailProduct(idProduct){

    var fd = new FormData();
    fd.append("idProduct", idProduct);

    const url = "ajax/getDetailProduct";

    const option = {
        method: "POST",
        body: fd
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
    carouselContainer(product[product.length-1]);

}


function drawFormDeleteProductInModal(){
    
    document.getElementById("modal-text-content-delete-product").innerHTML = `
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="titleProduct">Nombre del producto</label>
                    <input type="text" class="form-control validate" id="titleProduct" readonly placeholder="Nombre del producto" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="descriptionProduct">Descripción del producto</label>
                    <textarea class="form-control validate" id="descriptionProduct" rows="3" readonly required></textarea>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="categoryProduct">Categoría</label>
                    <input type="text" class="form-control validate" readonly id="categoryProduct" placeholder="Categoría" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="stateProduct">Estado</label>
                    <input type="text" class="form-control validate" readonly id="stateProduct" required>
        
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="municipalityProduct">Municipio</label>
                    <input type="text" class="form-control validate" readonly id="municipalityProduct" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="priceProduct">Precio</label>
                    <input type="text" class="form-control validate" id="priceProduct" readonly placeholder="Precio" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="avalaibleProduct">Cantidad Disponible</label>
                    <input type="text" class="form-control validate" id="avalaibleProduct" readonly placeholder="Cantidad Disponible" required>
                    
                    
                </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-danger btn-user btn-block btn-rounded mb-4" onclick="$('#modalConfirmDeleteProduct').modal('show');">Eliminar Producto</button>
                    </div>
                    <!-- <button type="button" class="btn btn-danger btn-user btn-block" onclick="updateProduct(this)">Actualizar Datos</button> -->
            </div> 
    `;
}


function carouselContainer(images){
    var urls = JSON.parse(images);
    var ol = document.getElementById("ol-carouselModalDeleteProduct");
    var div = document.getElementById("carousel-inner-carouselModalDeleteProduct");

    ol.innerHTML = "";
    div.innerHTML = "";

    for(let i = 1; i < urls.length; i++){
        ol.innerHTML += `
            <li data-target="#carouselModalDeleteProduct" data-slide-to="${i}"></li>
        `;   
    }

    for(let i = 0; i < urls.length; i++){
        
        i == 0 ? 
            div.innerHTML +=`<div class="item active"><img src="${urls[i].url}" alt="Los Angeles"></div>` : 
            div.innerHTML +=`<div class="item"><img src="${urls[i].url}" alt="Los Angeles"></div>`
        ;
    }

}


function deleteProduct(){

    var url = "ajax/deleteArticle";

    var fd = new FormData();
    fd.append("id_articulo", id_product);

    var option = {
        method: 'POST', 
        body: fd
    };

    
    fetch(url, option)
        .then(response => response.json())
        .catch(error => console.log(error))
        .then(response => {

            if (response.status == "Success"){
                
                $('#modalConfirmDeleteProduct').modal('hide');
                $('#modalDeleteProduct').modal('hide');
                
				var table = $('#productTable').DataTable();
				table.row(`#articulo${id_product}`).remove().draw( false );
            }else{
                console.log('Error no se cargaron los artículos')
            }

        });
}