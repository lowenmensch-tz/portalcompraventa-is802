currentDateOrder = 'DESC';

jQuery(document).ready(function() {
    gatherProducts();
    "use strict";

/*===================================================================================*/
/*	OWL CAROUSEL
/*===================================================================================*/
jQuery(function () {
    var dragging = true;
    var owlElementID = "#owl-main";

    function fadeInReset() {
        if (!dragging) {
            jQuery(owlElementID + " .caption .fadeIn-1, " + owlElementID + " .caption .fadeIn-2, " + owlElementID + " .caption .fadeIn-3").stop().delay(800).animate({ opacity: 0 }, { duration: 400, easing: "easeInCubic" });
        }
        else {
            jQuery(owlElementID + " .caption .fadeIn-1, " + owlElementID + " .caption .fadeIn-2, " + owlElementID + " .caption .fadeIn-3").css({ opacity: 0 });
        }
    }

    function fadeInDownReset() {
        if (!dragging) {
            jQuery(owlElementID + " .caption .fadeInDown-1, " + owlElementID + " .caption .fadeInDown-2, " + owlElementID + " .caption .fadeInDown-3").stop().delay(800).animate({ opacity: 0, top: "-15px" }, { duration: 400, easing: "easeInCubic" });
        }
        else {
            jQuery(owlElementID + " .caption .fadeInDown-1, " + owlElementID + " .caption .fadeInDown-2, " + owlElementID + " .caption .fadeInDown-3").css({ opacity: 0, top: "-15px" });
        }
    }

    function fadeInUpReset() {
        if (!dragging) {
            jQuery(owlElementID + " .caption .fadeInUp-1, " + owlElementID + " .caption .fadeInUp-2, " + owlElementID + " .caption .fadeInUp-3").stop().delay(800).animate({ opacity: 0, top: "15px" }, { duration: 400, easing: "easeInCubic" });
        }
        else {
            $(owlElementID + " .caption .fadeInUp-1, " + owlElementID + " .caption .fadeInUp-2, " + owlElementID + " .caption .fadeInUp-3").css({ opacity: 0, top: "15px" });
        }
    }

    function fadeInLeftReset() {
        if (!dragging) {
            jQuery(owlElementID + " .caption .fadeInLeft-1, " + owlElementID + " .caption .fadeInLeft-2, " + owlElementID + " .caption .fadeInLeft-3").stop().delay(800).animate({ opacity: 0, left: "15px" }, { duration: 400, easing: "easeInCubic" });
        }
        else {
            jQuery(owlElementID + " .caption .fadeInLeft-1, " + owlElementID + " .caption .fadeInLeft-2, " + owlElementID + " .caption .fadeInLeft-3").css({ opacity: 0, left: "15px" });
        }
    }

    function fadeInRightReset() {
        if (!dragging) {
            jQuery(owlElementID + " .caption .fadeInRight-1, " + owlElementID + " .caption .fadeInRight-2, " + owlElementID + " .caption .fadeInRight-3").stop().delay(800).animate({ opacity: 0, left: "-15px" }, { duration: 400, easing: "easeInCubic" });
        }
        else {
            jQuery(owlElementID + " .caption .fadeInRight-1, " + owlElementID + " .caption .fadeInRight-2, " + owlElementID + " .caption .fadeInRight-3").css({ opacity: 0, left: "-15px" });
        }
    }

    function fadeIn() {
        jQuery(owlElementID + " .active .caption .fadeIn-1").stop().delay(500).animate({ opacity: 1 }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeIn-2").stop().delay(700).animate({ opacity: 1 }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeIn-3").stop().delay(1000).animate({ opacity: 1 }, { duration: 800, easing: "easeOutCubic" });
    }

    function fadeInDown() {
        jQuery(owlElementID + " .active .caption .fadeInDown-1").stop().delay(500).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInDown-2").stop().delay(700).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInDown-3").stop().delay(1000).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
    }

    function fadeInUp() {
        jQuery(owlElementID + " .active .caption .fadeInUp-1").stop().delay(500).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInUp-2").stop().delay(700).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInUp-3").stop().delay(1000).animate({ opacity: 1, top: "0" }, { duration: 800, easing: "easeOutCubic" });
    }

    function fadeInLeft() {
        jQuery(owlElementID + " .active .caption .fadeInLeft-1").stop().delay(500).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInLeft-2").stop().delay(700).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInLeft-3").stop().delay(1000).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
    }

    function fadeInRight() {
        jQuery(owlElementID + " .active .caption .fadeInRight-1").stop().delay(500).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInRight-2").stop().delay(700).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
        jQuery(owlElementID + " .active .caption .fadeInRight-3").stop().delay(1000).animate({ opacity: 1, left: "0" }, { duration: 800, easing: "easeOutCubic" });
    }

    jQuery(owlElementID).owlCarousel({

        autoPlay: 5000,
        stopOnHover: true,
        navigation: true,
        pagination: true,
        singleItem: true,
        addClassActive: true,
        transitionStyle: "fade",
        navigationText: ["<i class='icon fa fa-angle-left'></i>", "<i class='icon fa fa-angle-right'></i>"],

        afterInit: function() {
            fadeIn();
            fadeInDown();
            fadeInUp();
            fadeInLeft();
            fadeInRight();
        },

        afterMove: function() {
            fadeIn();
            fadeInDown();
            fadeInUp();
            fadeInLeft();
            fadeInRight();
        },

        afterUpdate: function() {
            fadeIn();
            fadeInDown();
            fadeInUp();
            fadeInLeft();
            fadeInRight();
        },

        startDragging: function() {
            dragging = true;
        },

        afterAction: function() {
            fadeInReset();
            fadeInDownReset();
            fadeInUpReset();
            fadeInLeftReset();
            fadeInRightReset();
            dragging = false;
        }

    });

if (jQuery(owlElementID).hasClass("owl-one-item")) {
    jQuery(owlElementID + ".owl-one-item").data('owlCarousel').destroy();
}

jQuery(owlElementID + ".owl-one-item").owlCarousel({
    singleItem: true,
    navigation: false,
    pagination: false
});




jQuery('.home-owl-carousel').each(function(){

    var owl = $(this);
    var  itemPerLine = owl.data('item');
    if(!itemPerLine){
        itemPerLine = 5;
    }
    owl.owlCarousel({
        items : itemPerLine,
       itemsDesktop : [1199,3],
        itemsTablet:[991,2],
        navigation : true,
        pagination : false,

        navigationText: ["", ""]
    });
});

jQuery('.homepage-owl-carousel').each(function(){

    var owl = $(this);
    var  itemPerLine = owl.data('item');
    if(!itemPerLine){
        itemPerLine = 4;
    }
    owl.owlCarousel({
        items : itemPerLine,
        itemsTablet:[991,2],
        itemsDesktop : [1199,3],
        navigation : true,
        pagination : false,

        navigationText: ["", ""]
    });
});

jQuery(".blog-slider").owlCarousel({
    items : 3,
    itemsDesktopSmall :[979,2],
    itemsDesktop : [1199,3],
    navigation : true,
    slideSpeed : 300,
    pagination: false,
    navigationText: ["", ""]
});

jQuery(".best-seller").owlCarousel({
    items : 3,
    navigation : true,
    itemsDesktopSmall :[979,2],
    itemsDesktop : [1199,2],
    slideSpeed : 300,
    pagination: false,
    paginationSpeed : 400,
    navigationText: ["", ""]
});

jQuery(".sidebar-carousel").owlCarousel({
    items : 1,
    itemsTablet:[978,1],
    itemsDesktopSmall :[979,2],
    itemsDesktop : [1199,1],
    navigation : true,
    slideSpeed : 300,
    pagination: false,
    paginationSpeed : 400,
    navigationText: ["", ""]
});

jQuery(".brand-slider").owlCarousel({
    items :6,
    navigation : true,
    slideSpeed : 300,
    pagination: false,
    paginationSpeed : 400,
    navigationText: ["", ""]
});    
jQuery("#advertisement").owlCarousel({
    items : 1,
	itemsTablet:[978,1],
    itemsDesktopSmall :[979,1],
    itemsDesktop : [1199,1],
    navigation : true,
    slideSpeed : 300,
    pagination: true,
    paginationSpeed : 400,
    navigationText: ["", ""]
});    



});

/*===================================================================================*/
/*  LAZY LOAD IMAGES USING ECHO
/*===================================================================================*/
jQuery(function(){
    echo.init({
        offset: 100,
        throttle: 250,
        unload: false
    });
});

/*===================================================================================*/
/*  RATING
/*===================================================================================*/

// jQuery(function(){
//     jQuery('.rating').rateit({max: 5, step: 1, value : 3.5, resetable : false , readonly : true});
// });

/*===================================================================================*/
/* PRICE SLIDER
/*===================================================================================*/
jQuery(function () {

// Price Slider
if (jQuery('.price-slider').length > 0) {
    jQuery('.price-slider').slider({
        min: 100,
        max: 700,
        step: 10,
        value: [200, 500],
        handle: "square"

    });

}

});


/*===================================================================================*/
/* SINGLE PRODUCT GALLERY
/*===================================================================================*/
jQuery(function(){
    jQuery('#owl-single-product').owlCarousel({
        items:1,
        itemsTablet:[768,3],
        itemsDesktop : [1199,1],
        itemsTablet : [992,1],
        itemsDesktopSmall : [768,3]

    });

    jQuery('#owl-single-product-thumbnails').owlCarousel({
        items: 4,
        pagination: true,
        rewindNav: true,
        itemsTablet : [992,4],
        itemsDesktopSmall :[768,4],
        itemsDesktop : [992,1]
    });

    jQuery('#owl-single-product2-thumbnails').owlCarousel({
        items: 6,
        pagination: true,
        rewindNav: true,
        itemsTablet : [768, 4],
        itemsDesktop : [1199,3]
    });

    jQuery('.single-product-slider').owlCarousel({
        stopOnHover: true,
        rewindNav: true,
        singleItem: true,
        pagination: true
    });

  
});

/*===================================================================================*/
/*  WOW 
/*===================================================================================*/

jQuery(function () {
    new WOW().init();
});


/*===================================================================================*/
/*  TOOLTIP 
/*===================================================================================*/
jQuery("[data-toggle='tooltip']").tooltip(); 




})


/* Custom Javascript */

function mostrarMunicipios(){
    var municipio = $('#deptoDropdown').val();

    if (municipio==06){
        $('#municipioDropdown').html('');
        $('#municipioDropdown').append(`
            <option value="00" selected> Munucipio</option>
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
        $('#municipioDropdown').show();
    }else if(municipio==08){
        $('#municipioDropdown').html('');
        $('#municipioDropdown').append(`
            <option value="00" selected> Munucipio</option>
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
        $('#municipioDropdown').show();
    }else{
        $('#municipioDropdown').hide(); 
    }
    gatherProducts();
}

function changeCategory(category){
    $('#msjCategoria').html("<strong>"+category.text+"</strong>");
    $('#msjCategoria').data('category',category.dataset.category)
    gatherProducts();

    //Función Ajax para Pedir los productos a mostrar por categoría
}

function gatherProducts(){

    /*
        Aquí se pedirán los productos al backend enviando un JSON con distintos filtros.
        Filtros:
                Categoría
                Departamento
                Municipio
                Precio
                    Menor a Mayor o Mayor a Menor
                Fecha de Publicación
                    Mas Reciente a Mas antiguo o viceversa
    */
    category = $('#msjCategoria').data('category');
    department = $('#deptoDropdown').val();
    console.log(department);
    town = $('#municipioDropdown').val();
    min = $('#minValue').val();
    max = $('#maxValue').val();


    category == "" ? category = '%' : category = category.replaceAll(/(<strong>)|(<\/strong>)/ig,'');
    department == 00 ? department = '%' : department = department;
    town == 00 ? town = '%' : town = town;

    $.ajax({
        url : "ajax/findProducts",
        type : "POST", 
        data : {
            categoria : category, 
            departamento: department, 
            municipio : town,
            preciomin : min, 
            preciomax: max, 
            fechaPublicacion : currentDateOrder.replaceAll(/'/ig,'')
            },

        // Success
        success : function(data) {
            if (data.data == undefined){
                $('#prodcutsShowcase').html('NO SE ENCONTRARON PRODUCTOS');
            }else{
                showProducts(data.data);
            }
        },

        // Non-Success
        error : function() {
            console.error("An error Ocurred");
        }
    });

}

function dateOrder(){
    currentDateOrder == 'DESC' ? currentDateOrder = 'ASC' : currentDateOrder = 'DESC';
    gatherProducts();
}

function showProducts(data){

    //Aquí se mostrarán los productos obtenidos de la consulta a la base de datos

    /**
     *  0 = id articulo
     *  1 = nombre
     *  2 = precio
     *  3 = descripción
     *  4 = fecha
     *  5 = departamento
     *  6 = municipio
     *  7 = cantidad disponible
     *  8 = usuario
     *  9 = imagen
     */
    $('#prodcutsShowcase').html('');
    for (i=0; i<data.length;i++){
        $('#prodcutsShowcase').append(`
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="item">
                    <div class="products">
                        <div class="product">
                            <div class="product-image">
                                <div class="image">

                                    <a href="detail.html"> <!-- Aquí va la url del detalle del producto -->

                                    <img src="${data[i][9]}" alt="">
                                    <img src="${data[i][9]}" alt="" class="hover-image">
                                    </a>
                                </div>
                            </div>
        
                            <div class="product-info text-left">
                                <h3 class="name"><a href="details">${data[i][1]}</a></h3>
                                <div class="rating rateit-small"></div>
                                <div class="description">${data[i][3]}</div>
                                <div class="product-price"> <span class="price"> HNL ${data[i][2]} </span> </div>
                            </div>

                            <div class="cart clearfix animate-effect">
                                <div class="action">
                                    <ul class="list-unstyled">
                                        <li style="margin-left:100%;" class="lnk wishlist"> <a class="add-to-cart" href="details.html" title="Agregar a Favoritos"> <i class="icon fa fa-heart"></i> </a> </li>
                                    </ul>
                                </div>
                            </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        `);
    }

}

function priceRange(){
    console.log($('#minValue').val());
    console.log($('#maxValue').val());
}

function sortPriceButton(){
    if ($('#sortButton').val()=='0'){
        $('#anchorButtonSortPrice').html('');
        $('#anchorButtonSortPrice').html('<i id="sortButton" class="icon fa fa-sort-amount-asc"></i>');
        $('#sortButton').val('1');
    }else{
        $('#anchorButtonSortPrice').html('');
        $('#anchorButtonSortPrice').html('<i id="sortButton" class="icon fa fa-sort-amount-desc"></i>');
        $('#sortButton').val('0');
    }
}

/* SLIDER */
(function () {
	var parent = document.querySelector("#rangeSlider");
	if (!parent) return;

	var rangeS = parent.querySelectorAll("input[type=range]"),
		numberS = parent.querySelectorAll("input[type=number]");

	rangeS.forEach(function (el) {
		el.oninput = function () {
			var slide1 = parseFloat(rangeS[0].value),
				slide2 = parseFloat(rangeS[1].value);

			if (slide1 > slide2) {
				[slide1, slide2] = [slide2, slide1];
				// var tmp = slide2;
				// slide2 = slide1;
				// slide1 = tmp;
			}

			numberS[0].value = slide1;
			numberS[1].value = slide2;
		};
	});

	numberS.forEach(function (el) {
		el.oninput = function () {
			var number1 = parseFloat(numberS[0].value),
				number2 = parseFloat(numberS[1].value);

			if (number1 > number2) {
				var tmp = number1;
				numberS[0].value = number2;
				numberS[1].value = tmp;
			}

			rangeS[0].value = number1;
			rangeS[1].value = number2;
		};
	});
})();