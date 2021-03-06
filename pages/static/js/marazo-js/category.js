currentDateOrder = 'DESC';
currentPriceOrder = 'ASC';
currentMinPrice = 10;
currentMaxPrice = 100000;
currentPage = 1;

window.onload = function(){
    gatherProducts();
    sessionCheck2();
    getCategories();
    //obtenerIcono();
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
    var firstMunicipio;
    var lastMunicipio;
    Pagination.page = 1;
    switch(municipio){
        case "1":
            firstMunicipio = 42;
            lastMunicipio = 49;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "2":
            firstMunicipio = 104;
            lastMunicipio = 119;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "3":
            firstMunicipio = 50;
            lastMunicipio = 59;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "4":
            firstMunicipio = 60;
            lastMunicipio = 80;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "5":
            firstMunicipio = 81;
            lastMunicipio = 103;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "6":
            firstMunicipio = 29;
            lastMunicipio = 41;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "7":
            firstMunicipio = 120;
            lastMunicipio = 138;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "8":
            firstMunicipio = 1;
            lastMunicipio = 28;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "9":
            firstMunicipio = 139;
            lastMunicipio = 144;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "10":
            firstMunicipio = 145;
            lastMunicipio = 161;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "11":
            firstMunicipio = 162;
            lastMunicipio = 165;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "12":
            firstMunicipio = 166;
            lastMunicipio = 184;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "13":
            firstMunicipio = 185;
            lastMunicipio = 211;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "14":
            firstMunicipio = 212;
            lastMunicipio = 227;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "15":
            firstMunicipio = 228;
            lastMunicipio = 250;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "16":
            firstMunicipio = 251;
            lastMunicipio = 278;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "17":
            firstMunicipio = 279;
            lastMunicipio = 287;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "18":
            firstMunicipio = 288;
            lastMunicipio = 299;
            getherMunicipio(firstMunicipio, lastMunicipio);
            break;
        case "00":
            console.log(municipio);
            $('#municipioDropdown').hide();
            document.getElementById('municipioDropdown').innerHTML = "";
            document.getElementById('municipioDropdown').innerHTML = "<option value='00' selected> Municipio</option>";
            //document.getElementById('municipioDropdown').innerHTML = "<option value='00' selected> Municipio</option>";
            break;
        default:
            //alert('Sorry debe seleccionar un departamento');
            document.getElementById('municipioDropdown').innerHTML = "";
            document.getElementById('municipioDropdown').innerHTML = "<option value='00' selected> Municipio</option>";
    }
    gatherProducts();
}

function getherMunicipio(firstMunicipio, lastMunicipio){
    $('#municipioDropdown').show();
    $.ajax({
        type: "POST",
        url: "ajax/getMunicipios",
        data: {'firstMunicipio': firstMunicipio, 'lastMunicipio':lastMunicipio},
        success: function(data){
            
            if (data.status == "Success"){
                document.getElementById('municipioDropdown').innerHTML = "";
                document.getElementById('municipioDropdown').innerHTML = "<option value='00' selected> Municipio</option>";
                for(i=0;i<(data.data).length;i++){
                    document.getElementById('municipioDropdown').innerHTML +=`
                        <option value="${data.data[i][0]}">${data.data[i][1]}</option>
                    `
                }
            }else{
                alert('Sorry no existen municipios');
            }
        }
    });
}

function changeCategory(category){
    $('#msjCategoria').html("<strong>"+category.text+"</strong>");
    $('#msjCategoria').data('category',category.dataset.category);
    Pagination.page = 1;
    gatherProducts();

    //Funci??n Ajax para Pedir los productos a mostrar por categor??a
}

function gatherProducts(){

    /*
        Aqu?? se pedir??n los productos al backend enviando un JSON con distintos filtros.
        Filtros:
                Categor??a
                Departamento
                Municipio
                Precio
                    Menor a Mayor o Mayor a Menor
                Fecha de Publicaci??n
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
            fechaPublicacion : currentDateOrder.replaceAll(/'/ig,''),
            priceOrder: currentPriceOrder
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
    gatherProducts();
}

function sortPriceButton(){
    if ($('#sortButton').val()=='0'){
        $('#anchorButtonSortPrice').html('');
        $('#anchorButtonSortPrice').html('<i id="sortButton" class="icon fa fa-sort-amount-asc"></i>');
        $('#sortButton').val('1');
        currentPriceOrder = 'ASC';
    }else{
        $('#anchorButtonSortPrice').html('');
        $('#anchorButtonSortPrice').html('<i id="sortButton" class="icon fa fa-sort-amount-desc"></i>');
        $('#sortButton').val('0');
        currentPriceOrder = 'DESC';
    }
    //Pagination.page = 1;
    gatherProducts();
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

    //Aqu?? se mostrar??n los productos obtenidos de la consulta a la base de datos

    /**
     *  0 = id articulo
     *  1 = nombre
     *  2 = precio
     *  3 = descripci??n
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

                                <!-- <a href="detail.html">  Aqu?? va la url del detalle del producto -->
                                    <a href="details/${convertURL(data[i][1], data[i][0])}"> <!-- Aqu?? va la url del detalle del producto -->

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
                                        <li style="margin-left:100%;" class="lnk wishlist"> <a onclick="addWish(${data[i][0]});" class="add-to-cart" href="#" title="Agregar a Favoritos"> <i class="icon fa fa-heart"></i> </a> </li>
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

function addWish(id_articulo){
    $.ajax({
        type: "POST",
        url: "categories/ajax/addWishList",
        data: {'id_articulo': id_articulo}, 
        success: function(data) {
            console.log(data);

            if (data.status == "Success"){
                alert('Se agreg?? a la lista de favoritos');
            }else if(data.status == "favoritoRepetido"){
                alert('Usted ya cuenta con ese art??culo en la lista de favoritos');
            }else{
                alert('Error, no se agreg?? la lista de favoritos');
            }
        }
    });
}

function getCategories(){
    $.ajax({
        type: "POST",
        url: "ajax/getCategories",
        data: {},
        success: function(data){
            
            if (data.status == "Success"){
                loadCategories(data.data);
            }else{
                alert('No existen categorias');
            }
        }
    });
}

function getIconById(iconDictionary, iconId){
    return iconDictionary.find(icon => icon.id === iconId);
}

function loadCategories(data){
    for (i=0; i<(data.length); i++){
        document.getElementById('contentCategorias').innerHTML += `<li class="dropdown menu-item"> <a style="cursor: pointer;" 
        onclick="changeCategory(this);" class="dropdown-toggle" data-category=${data[i][0]} data-toggle="dropdown"><i class="icon fa fa-dot-circle-o" 
        aria-hidden="true"></i>${data[i][1]}</a></li>`
    }
}