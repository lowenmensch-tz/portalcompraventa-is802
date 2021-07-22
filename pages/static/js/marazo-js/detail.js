window.onload = function(){
    sessionCheck();
    loadData();
    // loadComments();
    // showComments();
};

var comentarios;
var count = 1;

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
            }else{
                $('#contact-review-forms').hide();
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
            $('#productName').html(data.title); //Nombre del producto

            // El promedio de valoraciones se calcula en el backend
            $('#productDetailRating').rateit({max: 5, step: 1, value : parseFloat(data.rating), resetable : false , readonly : true}); // Promedio de Valoraciones
            
            // data.comment.length == undefined ? rate = 0 : rate = data.comment.length;

            // $('#reviewCount').html(`(${rate} Reseñas)`); // Cantidad de Reseñas recibidas
        
            $('#productDescription').html(`<p>${data.description}</p>
            `); //Descripción del Producto
        
            $('#productPrice').html(`HNL ${data.price}`);
        
            $('#publisher').val(`${data.name}`);
            $('#publisherEmail').val(`${data.email}`);
            $('#publisherPhone').val(`${data.phone}`);
            $('#publisherAddress').val(`${data.address}`);



            $('#owl-single-product').html('');
            $('#owl-single-product-thumbnails').html('');

            $('#owl-single-product').append(`
                <div class="single-product-gallery-item" id="slide1">
                    <a data-lightbox="image-1" data-title="Galeria" href="${data.image.photo0}">
                        <img class="img-responsive" alt="" src="https://drive.google.com/uc?export=view&id=1kWdiW6kBydwbjkmhzdLtcfq0YsbvmmWT" data-echo="${data.image.photo0}">
                    </a>
                </div>
            `);
            
            console.log(data.comment)
            for (i=0; i<Object.keys(data.comment).length/2; i++){

                $('#commentsRow').append(`
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
                `);
                
            }
            $('#commentsRow').append(`<div style="background-color: white;" class="post-load-more col-md-12"><a style="background-color: white;" class="btn btn-upper btn-primary" onclick="" >&nbsp;</a></div>`);
        }
    });
}

function updateReviews(){
    // Calcular las estrellas
    quality = parseInt($('input[name="quality"]:checked').val());
    price = parseInt($('input[name="price"]:checked').val());
    status = parseInt($('input[name="status"]:checked').val());

    rate = (parseInt(quality)+parseInt(price)+parseInt(status))/3;
    
    $.ajax({
        type: "POST",
        url:  `ajax/userReview`,
        data: {
            comentario: $('#exampleInputReview').val(),
            calificacion: rate,
            correoVendedor: $('#publisherEmail').val(),
        },
        success: function(data) {
            console.log(data);
        }
    });
    
    comment = $('#exampleInputReview').val();
    console.log(comment);

    // Aquí se envían los datos a la base de datos y este responde con el nuevo cálculo y un nuevo listado de comentarios que sea guardará en la variable comentarios
    oldComments = $('#commentsRow').html();
    $('#commentsRow').html(`
    <div class="col-md-2 col-sm-2">
        <img src="https://avatarfiles.alphacoders.com/280/thumb-280983.png" alt="Responsive image" class="img-rounded img-responsive">
    </div>
    <div class="col-md-10 col-sm-10">
        <div class="blog-comments inner-bottom-xs outer-bottom-xs">
            <h4>Lisa</h4>
            <span class="review-action pull-right">
                <div class="rating rateit-small"></div>
            </span>
            <p>${comment}</p>
        </div>
    </div>
    `+oldComments);
}

function loadComments(){
    // Trae todos los comentarios de este producto y los guarda en la variable comentarios
    console.log('Lista con todos los comentarios')
}

function showComments(){
    //Aqui se cargan en la vista los comentarios desde la variable comentarios
}
