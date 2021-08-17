window.onload = function(){
    getMyWishlist()
    sessionCheck2();
    getAllCategories();
    
};
var articulo;
var id_articulo;
var categoria;
var id_categoria;
var nombreCate;
var contadorMisCategorias;
var contadorDisponibles;

function setArticulo(articulo, id_articulo){
    document.querySelector("#Modal-wishlist").innerHTML = '<button class="btn btn-primary" onclick="deleteItem();" data-dismiss="modal">Aceptar</button>&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>';
    this.articulo = articulo;
    this.id_articulo = id_articulo;

}
function setCategoria(id_categoria, nombreCate){
    console.log('estoy en la funcion');
    document.querySelector("#mensajeModalDelete").innerHTML = `<h5>Se <b>dejaran</b> de enviar correos con la información de los productos más recientes en la categoría <b>${nombreCate}</b>.</h5>`;
    document.querySelector('#Modal-categorie-delete').innerHTML = '<button class="btn btn-primary" onclick="deleteCategorie();" data-dismiss="modal">Aceptar</button>&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>';
    this.id_categoria = id_categoria;

}
function setCategoriaDelete(id_categoria, nombreCate){
    document.querySelector("#mensajeModalAdd").innerHTML = `<h5>Se <b>enviaran</b> correos con la información de los productos más recientes en la categoría <b>${nombreCate}</b>.</h5>`;
    document.querySelector('#Modal-categorie-add').innerHTML = '<button class="btn btn-primary" onclick="addCategorie();" data-dismiss="modal">Aceptar</button>&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>';
    this.id_categoria = id_categoria;
}

function getArticulo(){
    return this.articulo;
}
function getId_Articulo(){
    return this.id_articulo;
}
function getId_Categoria(){
    return this.id_categoria;
}


function getMyWishlist(){
    $.ajax({
        type: "POST",
        url: "ajax/showWishList",
        success: function(data) {
            //console.log(data);

            if (data.data == undefined){
                $('#wishlistTable').html('NO TIENE FAVORITOS AÑADIDOS A LA LISTA AÚN');
            }else{
                loadMyWishlist(data.data, data.data2);
            }
        }
    });
}

function loadMyWishlist(data, data2){
    /*
    0: id_articulo
    1: nombre
    2: descripcion
    3: precio
    4: enlace imagen
    5: fecha_publicación
    6: id_usuario publicador*/

    document.getElementById('wishlistTable').innerHTML +=`
        <thead>
        <tr>
            <th colspan="4" class="heading-title">Mis Favoritos</th>
        </tr>
        </thead>`

    for (i=0; i<((data.length)/2);i++){
        document.getElementById('wishlistTable').innerHTML += `

            <tbody id="articulo${i}">
                <tr>
                    <td class="col-md-2 col-sm-6 col-xs-6"><img src='${data[i][4]}'></td>
                    <td class="col-md-7 col-sm-6 col-xs-6">
                        <div class="product-name"><a href="details/${convertURL(data[i][1], data[i][0])}">${data[i][1]}</a></div>
                        <div id="rating${i}" class="rating rateit-small">
          
                            <span class="pull-right">&nbsp;&nbsp;(${data2[i][0][0]} reseñas)</span>
                        </div>
                        <div class="price">HNL ${data[i][3]}</div>
                    </td>

                    <td class="col-md-2 ">
                        <!-- <a href="details/${convertURL(data[i][1], data[i][0])}" class="btn-upper btn btn-primary">Add to cart</a> -->
                    </td>

                    <td class="col-md-1 close-btn">
                    <a data-toggle="modal" data-target="#delete-wishlist" href="#delete-wishlist" class="d-none d-sm-inline-block btn btn-sm btn-alert shadow-sm" onclick="setArticulo(articulo${i},${data[i][0]});" aria-label="Close"><span aria-hidden="true"><strong>X<strong></span></a>
                    </td>
                </tr>
            </tbody>
            
        `
        $(`#rating${i}`).rateit({max: 5, step: 1, value : parseFloat(data[i+(data.length/2)]), resetable : false , readonly : true});
    }

    b = document.getElementById('wishlistTable');
    
}



function deleteItem(){
    deleteFromWishlist(getId_Articulo());
    b.removeChild(getArticulo());
}

function deleteCategorie(){
    deleteFromCategorie(getId_Categoria());
    $(`#categoriesusc${getId_Categoria()}`).css({'display':'none'});
    $(`#categorienos${getId_Categoria()}`).css({'display':''});
}

function addCategorie(){
    addFromCategorie(getId_Categoria());
    $(`#categoriesusc${getId_Categoria()}`).css({'display':''});
    $(`#categorienos${getId_Categoria()}`).css({'display':'none'});
    $("#msgNoSuscrito").css({'display':'none'});
}

function deleteFromCategorie(id_categoria){
    $.ajax({
        type: "POST",
        url: "ajax/deleteUserCategories",
        data: {'id_categoria': id_categoria},
        success: function(data){
            if (data.status == "Success"){
                console.log("Suscripcion eliminada con exito");
            }else{
                console.log("La suscripcion no pudo ser eliminada");

            }
        }
    });
}

function addFromCategorie(id_categoria){
    $.ajax({
        type: "POST",
        url: "ajax/addUserCategories",
        data: {'id_categoria': id_categoria},
        success: function(data){
            if (data.status == "Success") {
                console.log("Suscripcion agregada con exito")
            }else{
                console.log("La suscripcion no pudo ser agregada")
            }
        } 
    });
}

function getAllCategories(){
    $.ajax({
        type: "POST",
        url: "ajax/getCategories",
        data: {},
        success: function(data){
            if (data.status == "Success"){
                for (i=0; i<((data.data).length); i++){
                    //nombre = data.data[i][1];
                    document.getElementById('suscrito').innerHTML += `<li id=categoriesusc${data.data[i][0]} style="display:none;"><a data-toggle="modal" data-target="#delete-categorie" href="#delete-categorie" 
                    class="etiqueta" onclick="setCategoria(${data.data[i][0]},'${data.data[i][1]}');">${data.data[i][1]}</a></li>`

                    document.getElementById('nosuscrito').innerHTML += `<li id=categorienos${data.data[i][0]} style="display:none;"><a data-toggle="modal" data-target="#add-categorie" href="#add-categorie" 
                    class="etiqueta2" onclick="setCategoriaDelete(${data.data[i][0]},'${data.data[i][1]}');">${data.data[i][1]}</a></li>`
                }
                
                $.ajax({
                    type: "POST",
                    url: "ajax/getUserCategories",
                    success: function(data){
                        if (data.status == "Success"){
                            console.log('###### Suscrito a ########')
                            console.log(data.data1)
                            console.log('###### NO suscrito a ########')
                            console.log(data.data2)
                            //loadMyCategories(data.data1, data.data2)
                            for (i=0; i<((data.data1).length); i++){
                                $(`#categoriesusc${data.data1[i][0]}`).css({'display':''});
                                
                            }
                            
                            for (i=0; i<((data.data2).length); i++){
                                $(`#categorienos${data.data2[i][0]}`).css({'display':''});
                            }
                            
                        }else if (data.status == "Empty"){
                            //console.log("No esta suscrito a ninguna categoría")
                            $("#msgNoSuscrito").css({'display':''});
                            for (i=0; i<((data.data2).length); i++){
                                $(`#categorienos${data.data2[i][0]}`).css({'display':''});
                            }
                                                        
                        }
                    }
                });
                

            }else{
                document.getElementById('suscrito').innerHTML = 'No existen categorías en el sistema';
                document.getElementById('nosuscrito').innerHTML = 'No existen categorías en el sistema';
            }
        }
    });
}

function deleteFromWishlist(id_articulo){
    $.ajax({
        type: "POST",
        url: "ajax/deleteFromWishList",
        data: {'id_articulo': id_articulo},
        success: function(data) {
            //console.log(data);

            if (data.status == "Success"){
                console.log("Articulo borrado con exito");
            }else{
                console.log("Articulo no pudo ser borrado");

            }
        }
    });
}

function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}


const btnToggle = document.querySelector('.toogle-btn');
btnToggle.addEventListener('click', function (){
    document.getElementById('sidebar').classList.toggle('active');
});

const btnFav = document.querySelector('.fav');
btnFav.addEventListener('click', function(){
    document.getElementById('conten_categorias').classList.add('active');
    document.getElementById('wishlistTable').classList.remove("active");
});

const btncategories = document.querySelector('.categorias');
btncategories.addEventListener('click', function(){
    document.getElementById('wishlistTable').classList.add('active');
    document.getElementById('conten_categorias').classList.remove("active"); 
});