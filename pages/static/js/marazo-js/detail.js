window.onload = function(){
    sessionCheck();
    loadData();
    // loadComments();
    // showComments();
};

var comentarios;
var count = 1;
var commentPublisher;


function sessionCheck(){
    var response;

    $.ajax({
        type: "GET",
        url: "ajax/loggedValidator",
        success: function(data) {
            response = data.logged;
            console.log(response);

            if (response == 'true'){
                $('#contact-review-forms').show();
                document.getElementById('cerrar-sesion').style.display = 'block';
                document.getElementById('mi-perfil').style.display = 'block';
                document.getElementById('iniciar-sesion').style.display = 'none';
                document.getElementById('registrarse').style.display = 'none';
            }else{
                $('#contact-review-forms').hide();
                document.getElementById('cerrar-sesion').style.display = 'none';
                document.getElementById('mi-perfil').style.display = 'none';
                document.getElementById('iniciar-sesion').style.display = 'block';
                document.getElementById('registrarse').style.display = 'block';
            }
        }
    });
}

function loadData(){

    // Esta petición es del tipo GET ya que se pasan los parámetros por URL para saber la información del Artículo y del Vendedor
    rate = 0;

    $.ajax({
        type: "POST",
        url:  `ajax/productDetailsDescription`,
        data: {
            url: window.location.pathname.replaceAll(/(\/details\/)|(\/)/g,"")
        },
        success: function(data) {
        
            let url = "seller/" + convertURL(data.name, data.idPublisher); 
            console.log(data)
            commentPublisher = data.publisher[0];

            document.getElementById("url-seller").onclick = function(){
                location.href = "http://localhost:8000/" + url;
            };

            document.getElementById('productName').innerHTML = data.title; //Nombre del producto

            console.log(data.rating)
            $('#productDetailRating').rateit({max: 5, step: 1, value : parseFloat(data.rating), resetable : false , readonly : true}); // Promedio de Valoraciones
        
            document.getElementById('productDescription').innerHTML = `<p>${data.description}</p>`; //Descripción del Producto
        
            document.getElementById('productPrice').innerHTML = `HNL ${data.price}`;
            document.getElementById('publisher').value = `${data.name}`;
            document.getElementById('publisherPhone').value = `${data.phone}`;
            document.getElementById('publisherEmail').value = `${data.email}`;
            document.getElementById('publisherAddress').value = `${data.address}`;


            document.getElementById('owl-single-product').innerHTML = '';
            document.getElementById('owl-single-product-thumbnails').innerHTML = '';
            
            document.getElementById('owl-single-product').innerHTML += `
                <div class="single-product-gallery-item" id="slide1">
                    <a data-lightbox="image-1" data-title="Galeria" href="${data.image.photo0}">
                        <img class="img-responsive" alt="" src="https://drive.google.com/uc?export=view&id=1kWdiW6kBydwbjkmhzdLtcfq0YsbvmmWT" data-echo="${data.image.photo0}">
                    </a>
                </div>
            `;
            document.getElementById('addToFavorite').innerHTML +=`
            <div  class="favorite-button m-t-5">
                <a onclick="addWish(${data.id_articulo});" class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Agregar a Favoritos" href="#">
                <i class="fa fa-heart"></i>
                </a>
                </a>
            </div>`;

            for (i=0; i<Object.keys(data.comment).length/2; i++){

                if (data.comment['userCommenting0'] != undefined){
                    document.getElementById('commentsRow').innerHTML += `
                    <div class="col-md-2 col-sm-2">
                        <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="Responsive image" class="img-rounded img-responsive">
                    </div>
                    <div class="col-md-10 col-sm-10 blog-comments outer-bottom-xs">
                        <div class="blog-comments inner-bottom-xs">
                            <h4>${data.comment[`userCommenting${i}`]}</h4>
                            <span class="review-action pull-right">
                                <div class="rating rateit-small"></div>
                                <!-- <a href="#"> Repost</a> &sol;
                                <a href="#"> Reply</a> -->
                            </span>
                            <p>${data.comment[`comment${i}`]}</p>
                        </div>
                    </div>
                `;
                }else{
                    document.getElementById('commentsRow').innerHTML += `
                    <div id="noHayComentarios">
                    <div class="col-md-2 col-sm-2">
                    </div>
                    <div class="col-md-10 col-sm-10 blog-comments outer-bottom-xs">
                        <div class="blog-comments inner-bottom-xs">
                            <h1>AUN NO HAY COMENTARIOS, SE EL PRIMERO!</h1>
                        </div>
                    </div>
                    </div>
                    `; 
                }
                
            }

            $('#commentsRow').append(`<div style="background-color: white;" id = "pincheMarazo" class="post-load-more col-md-12"><a style="background-color: white;" class="btn btn-upper btn-primary" onclick="" >&nbsp;</a></div>`);
        }
    });
}

function updateReviews(){
    // Calcular las estrellas
    $.ajax({
        type: "POST",
        url:  `ajax/review`,
        data: {
            comentario: $('#exampleInputReview').val(),
            correoVendedor: $('#publisherEmail').val()
        },
        success: function(data) {
            comment = $('#exampleInputReview').val();
            $('#exampleInputReview').val('');
            
            try {
                document.getElementById('noHayComentarios').parentNode.removeChild(document.getElementById('noHayComentarios'));
              }
              catch(err) {}
            document.getElementById('pincheMarazo').parentNode.removeChild(document.getElementById('pincheMarazo'));
            

            document.getElementById('commentsRow').innerHTML += `
            <div class="col-md-2 col-sm-2">
                <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" alt="Responsive image" class="img-rounded img-responsive">
            </div>
            <div class="col-md-10 col-sm-10">
                <div class="blog-comments inner-bottom-xs outer-bottom-xs">
                    <h4>${commentPublisher}</h4>
                    <span class="review-action pull-right">
                        <div class="rating rateit-small"></div>
                    </span>
                    <p>${comment}</p>
                </div>
            </div>`;

            $('#commentsRow').append(`<div style="background-color: white;" id = "pincheMarazo" class="post-load-more col-md-12"><a style="background-color: white;" class="btn btn-upper btn-primary" onclick="" >&nbsp;</a></div>`);
        }
    });
    
    

    // Aquí se envían los datos a la base de datos y este responde con el nuevo cálculo y un nuevo listado de comentarios que sea guardará en la variable comentarios

    
}

function loadComments(){
    // Trae todos los comentarios de este producto y los guarda en la variable comentarios
    console.log('Lista con todos los comentarios')
}

function showComments(){
    //Aqui se cargan en la vista los comentarios desde la variable comentarios
}


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}



function addWish(id_articulo){
    $.ajax({
        type: "POST",
        url: "ajax/addWishList",
        data: {'id_articulo': id_articulo},
        success: function(data) {
            console.log(data);

            if (data.status == "Success"){
                alert('Se agregó a la lista de favoritos');
            }else if(data.status == "favoritoRepetido"){
                alert('Usted ya cuenta con ese artículo en la lista de favoritos');
            }else{
                alert('Error, no se agregó la lista de favoritos');
            }
        }
    });
}