/*
    @author kenneth.cruz@unah.hn
    @date   2021/07/29
    @version 0.1.0
*/

// Ready de la función
window.onload = function(){
    sessionCheck();
    loadDataListProductPublisher();
};

function sessionCheck(){
    var response;
    $.ajax({
        type: "GET",
        url: "http://localhost:8000/details/0-A/ajax/loggedValidator",
        success: function(data) {
            response = data.logged;
            console.log(response);

            if (response == 'true'){
                document.getElementById('cerrar-sesion').style.display = 'block';
                document.getElementById('mi-perfil').style.display = 'block';
                document.getElementById('iniciar-sesion').style.display = 'none';
                document.getElementById('registrarse').style.display = 'none';
                /*$('#cerrar-sesion').show();*/
            }else{
                document.getElementById('cerrar-sesion').style.display = 'none';
                document.getElementById('mi-perfil').style.display = 'none';
                document.getElementById('iniciar-sesion').style.display = 'block';
                document.getElementById('registrarse').style.display = 'block';
            }
        }
    });
}

/*
    Carga los datos personales del vendedor en la vista
    - status
    - raiting
    - product
    - name
*/

function loadDataListProductPublisher(){
    let data = {
                    url: window.location.pathname
                };

    const url = "ajax/listProductPublisher" ;

    const option = {
        method: "POST",
        body: JSON.stringify(data),
        headers:{
            'Content-Type': 'application/json'
          }
    };
    
    fetch(url, option)
        .then(response => response.json())
        .catch(error => console.log(error))
        .then(response => {
            loadProfile(response.name);
            loadProducts(response.product, true);
        });

}


/*
    Carga los productos del vendedor en la vista
    
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
function loadProducts(products, visible){
    console.log(products);
    
    var gridProduct = document.getElementById('published-product');
    var rows; 
    
    if (products.length !== 0) {
        
        let index = 0;
        gridProduct.innerHTML = "";
        //document.getElementById('rows-product');
        for (let i = 0; i < Math.ceil(products.length/3); i++) { //Cantidad de filas
            
            gridProduct.innerHTML += `
                <div class="container-fluid">
                    <div class="row align-items-end" id="rows-product-${i}">
                    </div>
                </div>
                <br>
            `; 
            
            rows = document.getElementById(`rows-product-${i}`);

            for (let j = 0; j < 3; j++) {
                
                if (j < products.length-1){ //ESTA MAL ESTA CONDICION
                    
                    let url = JSON.parse(products[index][products[index].length-1]) //path de imágenes asociadas a cada producto
    
                    rows.innerHTML += `
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <div class="row justify-content-between ">
                                        <div class="col-6">
                                            ${products[index][1]}  
                                        </div>
                                        <div class="col-1" id="deleteProduct-${index}"></div>
                                        <!-- <div class="col-1" id="updateProduct-${index}"></div> -->
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <img class="card-img-top" src="${url["0"]}" style="padding-top:2rem;">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <ul>
                                                <li>${products[index][2]}</li>
                                                <li>${products[index][3]}</li>
                                                <li>${products[index][4]}</li>
                                                <li>${products[index][5]}</li>
                                            </ul>
                                            <a href="http://localhost:8000/details/${convertURL(products[index][1], products[index][0])}" class="btn btn-primary btn-user btn-block">Ver Más</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.col -->
                    `;

                    //Delete product
                    if (visible) {
                        document.getElementById(`deleteProduct-${index}`).innerHTML = `
                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            width="24" height="24"
                            viewBox="0 0 172 172"
                            style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#666666"><path d="M33.73372,23.59961l-10.13411,10.13411l52.26628,52.26628l-52.26628,52.26628l10.13411,10.13411l52.26628,-52.26628l52.26628,52.26628l10.13411,-10.13411l-52.26628,-52.26628l52.26628,-52.26628l-10.13411,-10.13411l-52.26628,52.26628z"></path></g></g></svg>
                        `;

                        // document.getElementById(`updateProduct-${index}`).innerHTML = `
                        //     <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                        //     width="24" height="24"
                        //     viewBox="0 0 172 172"
                        //     style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#333333"><path d="M83.98438,13.77344c-30.77188,-0.57781 -59.74313,18.73188 -69.95563,49.43656c-6.08719,18.31531 -4.67625,37.89375 3.96406,55.1475c8.64031,17.25375 23.48875,30.1 41.79062,36.18719c7.53844,2.49938 15.19781,3.69531 22.73625,3.69531c5.85875,0 11.63688,-0.73906 17.24031,-2.10969v-7.12188c-12.02656,3.30563 -25.11469,3.225 -37.79969,-0.98094c-16.56844,-5.50937 -29.9925,-17.14625 -37.81313,-32.74719c-7.82062,-15.61438 -9.09719,-33.325 -3.58781,-49.89344c9.09719,-27.38563 34.68219,-44.74688 62.06781,-44.74688c6.81281,0 13.74656,1.075 20.57281,3.34594c16.555,5.50938 29.9925,17.13281 37.81313,32.73375c2.12312,4.24625 3.72219,8.64031 4.87781,13.12844l-20.73406,-8.53281c-1.76031,-0.72563 -3.7625,0.1075 -4.48813,1.85437c-0.72562,1.76031 0.1075,3.77594 1.86781,4.50156l27.1975,11.19344c0.43,0.17469 0.86,0.25531 1.30344,0.25531c1.35719,0 2.63375,-0.79281 3.17125,-2.12312l10.6425,-25.84031c0.72563,-1.76031 -0.1075,-3.7625 -1.86781,-4.50156c-1.76031,-0.71219 -3.7625,0.12094 -4.48812,1.88125l-6.81281,16.555c-1.1825,-3.89687 -2.66062,-7.74 -4.515,-11.44875c-8.65375,-17.25375 -23.50219,-30.1 -41.80406,-36.18719c-7.08156,-2.35156 -14.28406,-3.5475 -21.37906,-3.68188zM119.80875,106.64c-7.25625,0 -13.16875,5.9125 -13.16875,13.16875v39.0225c0,7.25625 5.9125,13.16875 13.16875,13.16875h39.0225c7.25625,0 13.16875,-5.9125 13.16875,-13.16875v-39.0225c0,-7.25625 -5.9125,-13.16875 -13.16875,-13.16875zM155.48531,123.84l5.16,4.47469l-23.04531,26.48531l-16.16531,-12.37594l4.12531,-5.50938l11.35469,8.6z"></path></g></g></svg>
                        // `;
                    }
    
                }   //end if
                else{
                    console.log("Metiendo columnas vacías");

                    rows.innerHTML += `
                        <div class="col-2">
                            <div class="card-header">
                                <div class="card-body">
                                </div>
                            </div>
                        </div>
                    `;
                }

                index++;
            } //end for
        }

    }
}


function loadProfile(name){
    document.getElementById("name-publisher").innerHTML = `Su lista de productos: ${name}`;
}


function convertURL(nameProduct, idProduct){
    return  idProduct.toString() + '-' + nameProduct.toLowerCase().replaceAll(/ /g,'-').replaceAll(/[^\w-]+/g,'');
}


// Carga la calificación (como un promedio ponderado) del vendedor
function loadRaiting(){

    let id = "#rating-";
    let rating = 0;
    for(let index = 1; index < 6; index++){
        
        if( $(`${id}${index}`).is(':checked') ){
            rating = parseInt( $(`${id}${index}`).val() ); 
        }
    }

    return rating;
}



/*
    Esta función se encarga de enviar hacia la base de datos un nevo comentario y la calificación publicado por un cliente. 
*/

function ratingAndComment(){

    console.log("Probando. 2:09am");

    var data = { 
        comment: $("#Ratecomment").val(),
        rating: loadRaiting(),
        email: $("#Selleremail").val()
    };

    console.log('DATA: ', data);

    //peticion que espera una variable text
    //url: "ajax/sellerRaitingAndComment",
    $.ajax({

    type: "POST",
    url: "ajax/ratingAndComment",
    data: data,

    success: function(data) {

        console.log(data);
        console.log("Agregado con éxito!");

        if (data.status == "Success") {

            rateformSuccess();
            loadData();
            $('#calificacionmodal').modal('toggle');

        } else {
            rateformError();
            ratesubmitMSG(false, data);
        }
    }
    });

}