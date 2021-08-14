/**
 * Ready de la función 
*/
window.onload = function() {
    loadData();
}


/**
 * 
 * */
function loadData(){

    var url = "ajax/averageProductPriceByDepartment";

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
                
                var gridProduct = document.getElementById("graphQuantityProductoByDepartment");
                
                for (let i = 0; i < 3; i++) { //Cantidad de filas
            
                    gridProduct.innerHTML += `
                        <div class="container-fluid">
                            <div class="row align-items-end" id="rows-product-${i}">
                            </div>
                        </div>
                        <br>
                    `; 
                }
                
                document.getElementById("rows-product-0").innerHTML += `
                    <div class="col col-lg-4"">
                        <div class="card">
                            <div class="card-header">    
                                <canvas id="myChart-daily-reviews" width="400" height="400"></canvas>
                            </div>
                        </div>
                    </div>
                `;

                document.getElementById("rows-product-0").innerHTML += `
                    <div class="col col-lg-4"">
                        <div class="card">
                            <div class="card-header">    
                                <p>Top 5 categorías más visitadas</p>
                                <table class="table table-striped table-dark" id="category-reviews">
                                    <thead>
                                    <tr>
                                        <th scope="col">Categoría</th>
                                        <th scope="col">Tiempo promedio</th>
                                        <th scope="col">Visitas</th>
                                    </tr>
                                    </thead>
                                    <tbody id="category-reviews-body">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                `;

                document.getElementById("rows-product-0").innerHTML += `
                    <div class="col col-lg-4"">
                        <div class="card">
                            <div class="card-header">    
                                <canvas id="myChart-percentage-visits-category" width="400" height="400"></canvas>
                            </div>
                        </div>
                    </div>
                `;


                drawGraph(
                            response.dailyReviews[0], //labels
                            response.dailyReviews[1], //data
                            "myChart-daily-reviews", 
                            "line", 
                            ['rgba(75, 192, 192, 0.2)'][0],
                            ['rgba(75, 192, 192)'][0], 
                            'Visitas de las últimas semanas'
                        );
                drawTable(response.categoryReviews);
                
                console.log(response);

                
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
                    'Categorías'
                );

            }
        });
}


function drawTable(data){
    var table = document.getElementById("category-reviews");
    var tbody = document.getElementById("category-reviews-body");

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
function drawGraph(labels, data, idGraph, type, backgroundColor, borderColor, title){

    var ctx = document.getElementById(idGraph).getContext('2d');
    var myChart = new Chart(ctx, {
        type: type,
        data: {
            labels: labels,
            datasets: [{
                label: 'Visitas al sitio en las últimas semanas',
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