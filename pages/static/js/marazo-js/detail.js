thumbStep = -285;
thumbTotalPages = 0;

window.onload = function(){
    sessionCheck();
    loadData();
};

var comentarios;
var count = 1;
var commentPublisher;

/**
 * Verifica si el usuario está logeado
 */
function sessionCheck(){
    var response; //Variable que guarda la respuesta del servidor

    //Petición ajax para obtener las validaciones del usuario
    $.ajax({
        type: "GET",
        url: "ajax/loggedValidator",
        success: function(data) {
            response = data.logged;

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

/**
 * Carga todos los datos del producto, vendedor, Imágenes y Comentarios
 */
function loadData(){

    rate = 0;

    $.ajax({
        type: "POST",
        url:  `ajax/productDetailsDescription`,
        data: {
            url: window.location.pathname.replaceAll(/(\/details\/)|(\/)/g,"")
        },
        success: function(data) {
            
            let url = "seller/" + convertURL(data.profilePublisher[0][1], data.profilePublisher[0][0]); 
            commentPublisher = data.customer[0];
            document.getElementById("url-seller").onclick = function(){
                location.href = "http://localhost:8000/" + url;
            };

            document.getElementById('productName').innerHTML = data.title; //Nombre del producto
            console.log(data.rating);
            $('#productDetailRating').rateit({max: 5, step: 1, value : parseFloat(data.rating), resetable : false , readonly : true}); // Promedio de Valoraciones
        
            document.getElementById('productDescription').innerHTML = `<p>${data.description}</p>`; //Descripción del Producto
        
            document.getElementById('productPrice').innerHTML = `HNL ${data.price}`; //Precio del producto
            document.getElementById('publisher').value = `${data.profilePublisher[0][1]}`; //Vendedor
            document.getElementById('publisherPhone').value = `${data.profilePublisher[0][3]}`;  //Teléfono del vendedor
            document.getElementById('publisherEmail').value = `${data.profilePublisher[0][2]}`; // Correo del vendedor
            document.getElementById('publisherAddress').value = `${data.profilePublisher[0][4]}`; // Dirección del vendedor

            // Cargar Imágenes
            cuadroImagenes = '';
            thumbImagenes = '';

            cuadroImagenes =`<div class="owl-wrapper-outer"><div class="owl-wrapper" style="width: 7020px; left: 0px; display: block; transform: translate3d(0px, 0px, 0px);">`;
            thumbImagenes = `<div class="owl-wrapper-outer"><div id="thumb-translate" class="owl-wrapper" style="width: 1764px; left: 0px; display: block; transform: translate3d(0px, 0px, 0px); transition: all 200ms ease 0s;">`;

            // Convertir el JSON de imágenes en una lista
            imagenes = []
            for (image in data.image){
                imagenes.push(data.image[image])
            }

            // Insertar cada imágen y thumbnails
            for (i = 0; i< imagenes.length; i++){
                cuadroImagenes += `
                    <div class="owl-item" style="width: 390px;">
                        <div class="single-product-gallery-item" id="slide${i+1}">
                            <a data-lightbox="image-1" data-title="Galeria" href="${imagenes[i]}">
                                <img class="img-responsive" alt="" src="https://drive.google.com/uc?export=view&id=1kWdiW6kBydwbjkmhzdLtcfq0YsbvmmWT" data-echo="${imagenes[i]}">
                            </a>
                        </div>
                    </div>
                `;
                if (i==0){
                    thumbImagenes +=`
                        <div class="owl-item" style="width: 98px;">
                            <div class="item">
                                <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="${i+1}" href="#slide${i+1}">
                                    <img class="img-responsive" alt="" src="https://drive.google.com/uc?export=view&id=1kWdiW6kBydwbjkmhzdLtcfq0YsbvmmWT" data-echo="${imagenes[i]}" />
                                </a>
                            </div>
                        </div>
                    `;
                }else{
                    thumbImagenes +=`
                        <div class="owl-item" style="width: 98px;">
                            <div class="item">
                                <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="${i+1}" href="#slide${i+1}">
                                    <img class="img-responsive" alt="" src="https://drive.google.com/uc?export=view&id=1kWdiW6kBydwbjkmhzdLtcfq0YsbvmmWT" data-echo="${imagenes[i]}"/>
                                </a>
                            </div>
                        </div>
                    `;
                }
                
            }

            cuadroImagenes +=`</div></div>`;
            thumbImagenes +=`</div></div><div class="owl-controls clickable"><div class="owl-pagination"><div id="thumbPage0" data-page="0" onclick="moveThumb(this);" class="owl-page active"><span class=""></span></div>`;
            
            // Paginador del Carrusel
            thumbPages = Math.ceil(imagenes.length/3);
            thumbTotalPages = thumbPages;

            for (i=1; i<thumbPages;i++){
                thumbImagenes += `
                    <div id="thumbPage${i}" data-page="${i}" onclick="moveThumb(this);" class="owl-page"><span class=""></span></div>
                `;
            }
            thumbImagenes += `</div></div>`;

            document.getElementById('owl-single-product').innerHTML = cuadroImagenes;
            document.getElementById('owl-single-product-thumbnails').innerHTML = thumbImagenes;

            // Favoritos
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

/**
 * Actualiza los estilos del paginador y mueve el carrusel de imágenes
 * @param {Object} e Objeto que contiene la página seleccionada
 */
function moveThumb(e){
    document.getElementById('thumb-translate').style = `width: 1764px; left: 0px; display: block; transform: translate3d(${parseInt(e.dataset.page)*thumbStep}px, 0px, 0px); transition: all 200ms ease 0s;`;
    for(i=0;i<thumbTotalPages;i++){
        document.getElementById(`thumbPage${i}`).className = "owl-page";
    }
    e.className = "owl-page active";
}

/**
 * Actualiza los comentarios que se han ingresado
 */
function updateReviews(){

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
    
}

/**
 * Utiliza el nombre y el id del producto para generar una url única y dinámica
 * @param {String} nameProduct Nombre del producto
 * @param {Integer} idProduct Id del producto
 * @returns 
 */
function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}


/**
 * Agrega a la lista de favoritos un nuevo artículo
 * @param {Integer} id_articulo Id del articulo
 */
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