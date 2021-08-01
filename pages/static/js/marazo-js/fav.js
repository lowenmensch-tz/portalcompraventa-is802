window.onload = function(){
    /*loadMyWishlist();*/
    getMyWishlist()
    sessionCheck2();
    
};
var articulo;
var id_articulo;
function setArticulo(articulo, id_articulo){
    document.querySelector("#Modal-wishlist").innerHTML = '<button class="btn btn-primary" onclick="deleteItem();" data-dismiss="modal">Aceptar</button>&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>';
    this.articulo = articulo;
    this.id_articulo = id_articulo;
}
function getArticulo(){
    return this.articulo;
}
function getId_Articulo(){
    return this.id_articulo;
}

function getMyWishlist(){
    $.ajax({
        type: "POST",
        url: "ajax/showWishList",
        success: function(data) {
            console.log(data);

            if (data.data == undefined){
                $('#wishlistTable').html('NO TIENE FAVORITOS AÑADIDOS A LA LISTA AÚN');
            }else{
                loadMyWishlist(data.data);
            }
        }
    });
}



function loadMyWishlist(data){
    /*
    0: id_articulo
    1: nombre
    2: descripcion
    3: precio
    4: enlace imagen
    5: fecha_publicación
    6: id_usuario publicador*/

    /* nombreProducto = 'Tanque para Padres';
    arreglo = [
        ['Galaxy S20','https://www.65ymas.com/uploads/s1/31/00/99/los-tele-fonos-mo-viles-ma-s-innovadores-de-este-2020-samsung-galaxy-s20-y-s20.jpeg','Celular1',9000.00],
        ['Redmi','https://i.blogs.es/1593fb/diseno-xiaomi-redmi/450_1000.jpg','El mejor celular del mundo mundial', 5000.00],
        ['Nokia 3000','https://i.blogs.es/b54f0b/nokia-1110/1366_2000.jpg','Nokia',100.00],
        ['Iphone 9','https://m.media-amazon.com/images/I/61CnvZzhNOL._AC_SX466_.jpg', 'iPhone', 18000.00]
    ]*/
    //Petición al back
    // $.ajax({
    //     type: "POST",
    //     url: "",
    //     data: {var1:nombreProducto},

    //     success: function(data) {
    //        console.log('success');
    //     }
    // });

    for (i=0; i<((data.length)/2);i++){
        document.getElementById('wishlistTable').innerHTML += `
            <tbody id="articulo${i}">
                <tr>
                    <td class="col-md-2 col-sm-6 col-xs-6"><img src='${data[i][4]}'></td>
                    <td class="col-md-7 col-sm-6 col-xs-6">
                        <div class="product-name"><a href="details/${convertURL(data[i][1], data[i][0])}">${data[i][1]}</a></div>
                        <div id="rating${i}" class="rating rateit-small">
          
                            <span class="pull-right">&nbsp;&nbsp;(06 reseñas)</span>
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
        $(`#rating${i}`).rateit({max: 5, step: 1, value : parseFloat(data[i+5]), resetable : false , readonly : true});
        //document.getElementById(`#rating${i}`).rateit({max: 5, step: 1, value : parseFloat(3.5), resetable : false , readonly : true});
    }

    b = document.getElementById('wishlistTable');
    
}



function deleteItem(){

    deleteFromWishlist(getId_Articulo());
    b.removeChild(getArticulo());
}

function deleteFromWishlist(id_articulo){
    $.ajax({
        type: "POST",
        url: "ajax/deleteFromWishList",
        data: {'id_articulo': id_articulo},
        success: function(data) {
            console.log(data);

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

/*function modal(number_id){
}*/
    
if(document.getElementById("btnModal")){
    var modal = document.getElementById("tvesModal");
    var btn = document.getElementById("btnModal");
    var span = document.getElementsByClassName("close")[0];
    var body = document.getElementsByTagName("body")[0];

    btn.onclick = function() {
        modal.style.display = "block";

        body.style.position = "static";
        body.style.height = "100%";
        body.style.overflow = "hidden";
    }

    span.onclick = function() {
        modal.style.display = "none";

        body.style.position = "inherit";
        body.style.height = "auto";
        body.style.overflow = "visible";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";

            body.style.position = "inherit";
            body.style.height = "auto";
            body.style.overflow = "visible";
        }
    }
}
