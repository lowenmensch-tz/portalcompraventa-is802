/**
 * Función asínica que se ejecuta cada vez que se carga la página
 * trae toda la información necesaria para mostrar las estadísticas
 * */
function loadDataStatistics(){

    var url = "ajax/statistics";

    var option = {
        method: "POST"
    }

    fetch(url, option)
        .then(response => response.json())
        .catch(error => console.error(error))
        .then(response =>{
            
            if(response.status == "Success"){
                //console.log(response.labels);
                //console.log(response.data);
                
                var gridProduct = document.getElementById("drawStatistics");
                gridProduct.innerHTML = '';

                for (let i = 0; i < 3; i++) { //Cantidad de filas
            
                    gridProduct.innerHTML += `
                        <div class="container">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="" id="rows-product-${i}">
                                </div>
                            </div>
                        </div>
                        <div style="height:50px;"></div>
                    `; 

                }
                
                //dailyReviews
                innerCanvas("rows-product-2", "myChart-daily-reviews", 6);
                
                //percentageVisitsCategory
                innerCanvas("rows-product-1", "myChart-percentage-visits-category", 6);

                //countProductsByCategory
                innerCanvas("rows-product-0", "myChart-count-products-by-category", 6);

                //categoryReviews
                innerTable(
                            "rows-product-1", 
                            "category-reviews", 
                            "category-reviews-body", 
                            "Top 5 categorías más visitadas", 
                            ["Categoría", "Tiempo promedio", "Visitas"]
                        );

                //mostViewedProductByCategory
                innerTable(
                    "rows-product-0", 
                    "most-viewed-product", 
                    "most-viewed-product-body", 
                    "Producto más visitado por categoría", 
                    ["Categoría", "Visitas", "Nombre del producto"]
                );

                //dailyReviews
                drawGraph(
                            response.dailyReviews[0], //labels
                            response.dailyReviews[1], //data
                            "myChart-daily-reviews", 
                            "line", 
                            ['rgba(75, 192, 192, 0.2)'][0],
                            ['rgba(75, 192, 192)'][0], 
                            title='Visitas de las últimas semanas'
                        );
                
                console.log(response);

                //percentageVisitsCategory
                drawGraph(
                    response.percentageVisitsCategory[0], //labels
                    response.percentageVisitsCategory[1], //data
                    "myChart-percentage-visits-category", 
                    'bar', 
                    [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                    ],
                    [      
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)'
                    ],
                    title = "Categorías más visitadas"
                );

                //countProductsByCategory
                drawGraph(
                    response.countProductsByCategory[0], //labels
                    response.countProductsByCategory[1], //data
                    "myChart-count-products-by-category", 
                    'bar', 
                    [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(201, 203, 207, 0.2)'
                    ],
                    [      
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ], 
                    title = "Cantidad de Productos por Categorías"
                );

                                //categoryReviews
                drawTable(
                            response.categoryReviews, 
                            "category-reviews",
                            "category-reviews-body"
                        );

                //mostViewedProductByCategory
                drawTable(
                    response.mostViewedProductByCategory,
                    "most-viewed-product",
                    "most-viewed-product-body"
                );

                //Añadir obligatoriamente para que los estilos no exploten
				$('#example').DataTable();
				$('.sorting').trigger( "click" );

            } //SUCCESS

        }); //end fetch
}


function innerTable(idRow, tableId, tbodyId, title, data) {

    document.getElementById(idRow).innerHTML += `
        <div class="col-sm-12 col-md-12 col-lg-6"">
            <div class="card">
                <div class="card-header">    
                    <strong><h4>${title}</h4></strong>
                    <hr>
                    <table class="table table-striped table-dark" id="${tableId}">
                        <thead>
                        <tr>
                            <th scope="col">${data[0]}</th>
                            <th scope="col">${data[1]}</th>
                            <th scope="col">${data[2]}</th>
                        </tr>
                        </thead>
                        <tbody id="${tbodyId}">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
`;
    
}


function innerCanvas(idRow, idCanvas, largeColumn) {
    
    document.getElementById(idRow).innerHTML += `
        <div class="col col-lg-${largeColumn}">
            <div class="card">
                <div class="card-header">    
                    <canvas id="${idCanvas}" width="400" height="400"></canvas>
                </div>
            </div>
        </div>
`;
}


function drawTable(data, tableId, tbodyId){
    var table = document.getElementById(tableId);
    var tbody = document.getElementById(tbodyId);

    for (let index = 0; index < data.length; index++) {

        tbody.innerHTML += `
            <tr>
                <td>${data[index][0]}</td>
                <td>${data[index][1]}</td>
                <td>${data[index][2]}</td>
            </tr>
        `;
    }
    table.appendChild(tbody);
}


/**
 * Dibuja el gráfico
 * */
function drawGraph(labels, data, idGraph, type, backgroundColor, borderColor,title="Hola"){

    var ctx = document.getElementById(idGraph).getContext('2d');
    var myChart = new Chart(ctx, {
        type: type,
        data: {
            labels: labels,
            datasets: [{
                label: title,
                data: data,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                borderWidth: 1
            }],
            hoverOffset: 4
        }
    }
    );
}