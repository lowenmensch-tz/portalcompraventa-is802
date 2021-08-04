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
                drawGraph(response.labels, response.data);
            }
        });
}


/**
 * Dibuja el gráfico
 * */
function drawGraph(labels, data){

    console.log("Etiquetas: ", labels);
    console.log("data: ", data);
    //const labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange']
    //const data = [12, 19, 3, 5, 2, 3]


    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Promedio de precio por departamento',
                data: data,
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}