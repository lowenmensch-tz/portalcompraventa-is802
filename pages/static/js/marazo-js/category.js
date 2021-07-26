currentDateOrder = 'DESC';
currentPage = 1;

window.onload = function(){
    gatherProducts();
    sessionCheck2();
};

/* * * * * * * * * * * * * * * * *
 * Pagination
 * javascript page navigation
 * * * * * * * * * * * * * * * * */

var Pagination = {

    code: '',

    // --------------------
    // Utility
    // --------------------

    // converting initialize data
    Extend: function(data) {
        data = data || {};
        Pagination.size = data.size || 90;
        Pagination.page = data.page || 1; 
        Pagination.step = data.step || 20;
    },

    // add pages by number (from [s] to [f])
    Add: function(s, f) {
        for (var i = s; i < f; i++) {
            Pagination.code += '<a>' + i + '</a>';
        }
    },

    // add last page with separator
    Last: function() {
        Pagination.code += '<i>...</i><a>' + Pagination.size + '</a>';
    },

    // add first page with separator
    First: function() {
        Pagination.code += '<a>1</a><i>...</i>';
    },



    // --------------------
    // Handlers
    // --------------------

    // change page
    Click: function() {
        Pagination.page = +this.innerHTML;
        Pagination.Start();
        gatherProducts();
    },

    // previous page
    Prev: function() {
        Pagination.page--;
        if (Pagination.page < 1) {
            Pagination.page = 1;
        }
        Pagination.Start();
        gatherProducts();
    },

    // next page
    Next: function() {
        Pagination.page++;
        if (Pagination.page > Pagination.size) {
            Pagination.page = Pagination.size;
        }
        Pagination.Start();
        gatherProducts();
    },



    // --------------------
    // Script
    // --------------------

    // binding pages
    Bind: function() {
        var a = Pagination.e.getElementsByTagName('a');
        for (var i = 0; i < a.length; i++) {
            if (+a[i].innerHTML === Pagination.page) a[i].className = 'current';
            a[i].addEventListener('click', Pagination.Click, false);
        }
    },

    // write pagination
    Finish: function() {
        Pagination.e.innerHTML = Pagination.code;
        Pagination.code = '';
        Pagination.Bind();
    },

    // find pagination type
    Start: function() {
        if (Pagination.size < Pagination.step * 2 + 6) {
            Pagination.Add(1, Pagination.size + 1);
        }
        else if (Pagination.page < Pagination.step * 2 + 1) {
            Pagination.Add(1, Pagination.step * 2 + 4);
            Pagination.Last();
        }
        else if (Pagination.page > Pagination.size - Pagination.step * 2) {
            Pagination.First();
            Pagination.Add(Pagination.size - Pagination.step * 2 - 2, Pagination.size + 1);
        }
        else {
            Pagination.First();
            Pagination.Add(Pagination.page - Pagination.step, Pagination.page + Pagination.step + 1);
            Pagination.Last();
        }
        Pagination.Finish();
    },



    // --------------------
    // Initialization
    // --------------------

    // binding buttons
    Buttons: function(e) {
        var nav = e.getElementsByTagName('a');
        nav[0].addEventListener('click', Pagination.Prev, false);
        nav[1].addEventListener('click', Pagination.Next, false);
    },

    // create skeleton
    Create: function(e) {

        var html = [
            '<a>&#9668;</a>', // previous button
            '<span></span>',  // pagination container
            '<a>&#9658;</a>'  // next button
        ];

        e.innerHTML = html.join('');
        Pagination.e = e.getElementsByTagName('span')[0];
        Pagination.Buttons(e);
    },

    // init
    Init: function(e, data) {
        Pagination.Extend(data);
        Pagination.Create(e);
        Pagination.Start();
    }
};

function mostrarMunicipios(){
    var municipio = $('#deptoDropdown').val();
    Pagination.page = 1;
    if (municipio==06){
        $('#municipioDropdown').html('');
        $('#municipioDropdown').append(`
            <option value="00" selected> Municipio</option>
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
            <option value="00" selected> Municipio</option>
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
    $('#msjCategoria').data('category',category.dataset.category);
    Pagination.page = 1;
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


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
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


// *****************************************************************************




/* * * * * * * * * * * * * * * * *
* Initialization
* * * * * * * * * * * * * * * * */

// var init = function() {
//     Pagination.Init(document.getElementById('pagination'), {
//         size: 30,
//         page: 1, 
//         step: 3   
//     });
// };


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

    productsPerPage = 12;
    len = 0;

    Pagination.Init(document.getElementById('pagination'), {
        size: Math.ceil(data.length/productsPerPage) , // pages size
        page: Pagination.page,  // selected page
        step: 3   // pages before and after current
    });

    data.length < productsPerPage*Pagination.page ? len = data.length : len = productsPerPage*(Pagination.page);

    $('#prodcutsShowcase').html('');
    for (i=(productsPerPage*(Pagination.page-1)); i<len;i++){
        $('#prodcutsShowcase').append(`
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="item">
                    <div class="products">
                        <div class="product">
                            <div class="product-image">
                                <div class="image">

                                <!-- <a href="detail.html">  Aquí va la url del detalle del producto -->
                                    <a href="details/${convertURL(data[i][1], data[i][0])}"> <!-- Aquí va la url del detalle del producto -->

                                    <img src="${data[i][9]}" alt="">
                                    <img src="${data[i][9]}" alt="" class="hover-image">
                                    </a>
                                </div>
                            </div>
        
                            <div class="product-info text-left">
                                <h3 class="name"><a href="details/${convertURL(data[i][1], data[i][0])}">${data[i][1]}</a></h3>
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
