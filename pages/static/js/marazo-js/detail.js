window.onload = function(){
    sessionCheck();
    loadData();
    // loadComments();
    // showComments();
};

var comentarios;
var count = 1;

function sessionCheck(){

    var response = true;
    // Petición para saber si el usuario está logueado
    // $.ajax({
    //     type: "POST",
    //     url: "",
    //     data: data,
    //     success: function(data) {
    //        console.log('success');
    //     }
    // });

    if (response == true){
        $('#contact-review-forms').show();
    }else{
        $('#contact-review-forms').hide();
    }
}

function loadData(){

    // Esta petición es del tipo GET ya que se pasan los parámetros por URL para saber la información del Artículo y del Vendedor

    // $.ajax({
    //     type: "GET",
    //     url: "",
    //     data: data,
    //     success: function(data) {
    //        console.log('success');
    //     }
    // });

    // Con los datos obtenidos se colocarán los datos en sus respectivos lugares

    //Galería de Imágenes 

    imagenes = [
        'https://danbooru.donmai.us/data/sample/da/f4/__jean_genshin_impact_drawn_by_kai1up__sample-daf449492b42c9a88dd086c3da3fcabb.jpg',
        'https://wallpapercave.com/wp/wp7648650.jpg',
        'https://images2.alphacoders.com/111/thumb-1920-1110623.png',
        'https://i2.wp.com/www.gameoverla.com/wp-content/uploads/2021/06/E2stFIqVIAAbrVi.jpg?fit=2048%2C945&ssl=1',
        'https://wallpapersmug.com/download/2248x2248/fb20d9/xiao-enshin-impact.jpeg'
    ]

    // "Cargar" las imágenes dentro del div

    // for (i=1;i<imagenes.length;i++){
    //     $('#owl-single-product').append(`
    //         <div class="single-product-gallery-item" id="slide${i+1}">
    //             <a data-lightbox="image-1" data-title="Galeria" href="${imagenes[i]}">
    //                 <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="${imagenes[i]}">
    //             </a>
    //         </div>
    //     `);

        // $('#owl-single-product').append(`<p>Hola</p>`);
        // $('#owl-single-product-thumbnails').append(`<p>Hola</p>`);

    //     $('#owl-single-product-thumbnails').append(`
    //         <div class="item">
    //             <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="${i+1}" href="#slide${i+1}">
    //                 <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="${imagenes[i]}">
    //             </a>
    //         </div>
    //     `);
    // }


    $('#productName').html('Este es el nombre del producto'); //Nombre del producto

    // El promedio de valoraciones se calcula en el backend
    $('#productDetailRating').rateit({max: 5, step: 1, value : 5, resetable : false , readonly : true}); // Promedio de Valoraciones

    $('#reviewCount').html('(4 Reseñas)'); // Cantidad de Reseñas recibidas

    $('#productDescription').html(`<p>Aquí va la descripción del Producto</p>
    <p>Id tempor dolor velit culpa exercitation et occaecat quis aute id. Amet eu dolor ut Lorem fugiat cupidatat adipisicing consequat cillum officia pariatur esse. Reprehenderit duis ullamco aliqua irure reprehenderit ea ea mollit aliquip.</p>
    `); //Descripción del Producto

    $('#productPrice').html('HNL 900.00');

    $('#publisher').val('USER');
    $('#publisherEmail').val('EMAIL');
    $('#publisherPhone').val('PHONE NUMBER');
    $('#publisherAddress').val('ADDRESS');
    
    
}

function updateReviews(){
    // Calcular las estrellas
    quality = parseInt($('input[name="quality"]:checked').val());
    price = parseInt($('input[name="price"]:checked').val());
    status = parseInt($('input[name="status"]:checked').val());

    rate = (parseInt(quality)+parseInt(price)+parseInt(status))/3;
    console.log(rate);
    
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
