/*
    @author kenneth.cruz@unah.hn
    @date   2021/07/22
    @version 0.1.0
*/

// Ready de la función
window.onload = function(){
    loadData();
};


/*
    Carga los datos personales del vendedor en la vista
*/
function loadData(){
    $.ajax({
        type: "POST",
        url:  `ajax/sellerProfileDescription`,
        data: {
            url: window.location.pathname.replaceAll(/(\/details\/)|(\/)/g,"")
        },
        success: function(data) {

            console.log(data);

            loadProfile(data.profile[0]);
            loadProducts(data.product);
            loadRaiting(data.raiting);
        }
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
function loadProducts(products){
    console.log(products);

    if (products.length !== 0) {
        
        $("#see-more").show();
        $("#published-product").empty();

        for (let index = 0; index < products.length; index++) {
            
            if (index < 2){
                let url = JSON.parse(products[index][products[index].length-1])
                console.log( url );            

                $("#published-product").append(`
                    <div class="card">
                        <div class="card-header">
                            ${products[index][1]}
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
                                    <button type="submit" class="btn btn-primary btn-user btn-block">Ver Mas</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>
                `);
            }
            
        }

    }
    else{
        
        $("#see-more").hide();

        $("#published-product").append(`
            <div class="card">
                <div class="card-header">
                    No ha publicado productos.
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <img class="card-img-top" src="https://content.optimumnutrition.com/i/on/on-on-C101148_Image_01?locale=en-us,en-gb,*&layer0=$PDP_002$" style="padding-top:2rem;">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                        </div>
                    </div>
                </div>
            </div>
        `);

    }   
}

/*
    Carga los datos personales del vendedor
*/
function loadProfile(profile){

    $("#Ufirstname").val(`${profile[0]}`);
    $("#Ulastname").val(`${profile[1]}`);
    $("#Uphone").val(`${profile[4]}`);
    $("#Uemail").val(`${profile[2]}`);
    $("#Uaddress").val(`${profile[5]}`);
    $("#Udepartment").val(`${profile[3]}`);
}


// Carga la calificación (como un promedio ponderado) del vendedor
function loadRaiting(raiting){

}