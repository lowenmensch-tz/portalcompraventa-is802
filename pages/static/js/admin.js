$(document).ready(function(){
	
	sessionCheck(); 
	
	if( isActive("complaintContainer") ){ 
		getAllDataComplaintNotChecked();
	}

	//$('#example2').DataTable();
	/*$('#productTable').DataTable();*/
    $(".new-tabs a").click(function(){
		$(this).tab('show');

		//Denuncias sin revisar
		if( this.parentNode.id == "complaintContainer" ){ 
			getAllDataComplaintNotChecked();
		}
		//Denuncias revisadas
		else if( this.parentNode.id == "complaintContainerChecked" ){
			getAllDataComplaintChecked();
		}
		//Estadísticas
		else if ( this.parentNode.id == "statisticsContainer" ){
			//console.log("Estamos en la pantalla de las estadísticas bb");
			loadDataStatistics();
		}
		

    });

});

var id_articulo;

function setArticulo(nombreArticulo, id_articulo){
    document.querySelector("#modal-article-delete").innerHTML = `<button id="deleteModal${id_articulo}"  class="btn btn-primary" onclick="deleteArticulo();" data-dismiss="modal">Aceptar</button>&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>`;
    document.querySelector("#mensajeDelete").innerHTML = `<h5><b>Eliminar</b> anuncio <b>${nombreArticulo}</b>.</h5>`;
    this.id_articulo = id_articulo;

}

function getId_Articulo(){
    return this.id_articulo;
}


let menuToggle = document.querySelector('.toggle');
let navigation = document.querySelector('.navigation');
let special = document.querySelector('.special');

menuToggle.onclick = function(){

	menuToggle.classList.toggle('active');
	navigation.classList.toggle('active');
    special.classList.toggle('active');
}

/*let list = document.querySelectorAll('.list');

for (let i=0; i<list.length; i++){

	list[i].onclick = function(){

		let j = 0;

		while(j < list.length){

			list[j++].className = 'list';
		}

		list[i].className = 'list active';
	}
}*/

/*var container = document.getElementById("complaintContainer");

container.onclick = function(){
	
	container.className = "list active";

	getAllDataComplaintNotChecked();

}*/


function isActive(id){
	return (document.getElementById(id).className = "list active")? true: false;
}


function hideModal(id){
	$(id).modal("hide");	
}


/**
 * 
*/
function sessionCheck(){
 
	var response;
    $.ajax({
        type: "GET",
        url: "ajax/loggedValidatorAdmin",
        success: function(data) {
            response = data.logged;
            console.log(response);

            if (response == 'true'){
                
            }else{
                window.location.href = "login";
            }
        }
    });
}


function getCategories(){

	var categoriesTable = document.getElementById("tbodyDataCategory");

    $.ajax({
        type: "POST",
        url: "ajax/getCategories",
        data: {},
        success: function(data){

            if (data.status == "Success"){
                //loadCategories(data.data);

				categoriesTable.innerHTML ="";
                for(let index = 0; index < data.data.length; index++){
					categoriesTable.innerHTML += `
						<tr id="${data.data[index][0]}">
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[index][0]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[index][1]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="button" class="btn btn-sm btn-danger" style="height:2rem; padding-top:0.1px" onclick="deleteCategory(${data.data[index][0]});">X</button></td>
						</tr>	
					`;

				}
				$('#categoryTable').DataTable();
				$('.sorting').trigger( "click" );
            }else{
                alert('Usted ha eliminado todas las categorias');
            }
        }
    });
}

function addCategory(){
	var name = $("#ACname").val();

	$.ajax({
        type: "POST",
        url: "ajax/addCategories",
        data: { 'nombreCategoria': name },
        success: function(data){
		console.log(data);
            if (data.status == "Success"){
                alert("La categoria se añadio correctamente");
            }else{
                alert('Usted ha eliminado todas las categorias');
            }
        }
    });
}

function deleteCategory(id){

	$.ajax({
        type: "POST",
        url: "ajax/deleteCategories",
        data: { 'id_categoria': id },
        success: function(data){
		console.log(data);
            if (data.status == "Success"){
                alert("La categoria se elimino correctamente");
                getCategories();
            }else{
                alert('Ya no hay categorias disponibles');
            }
        }
    });
}

/*
Información de los artículos:
0 = id del artículo
1 = Nombre artículo
2 = Nombre usuario
3 = Categoria
*/ 


function getArticulos(){
    $.ajax({
        type: "POST",
        url: "ajax/getArticles",
        data: {},
        success: function(data){

            if (data.status == "Success"){
				document.getElementById("tbodyDataProduct").innerHTML = "";
				for (i=0; i<((data.data).length);i++){
					document.getElementById("tbodyDataProduct").innerHTML += `
					<tr id="articulo${data.data[i][0]}">
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][2]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][1]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][3]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="button" class="btn btn-sm btn-danger" 
							style="height:2rem; padding-top:0.1px" data-toggle="modal" data-target="#delete-articulo" href="#delete-articulo" onclick="setArticulo('${(data.data[i][1]).replace(/["']/g, "")}',${data.data[i][0]});">X</button></td>
					</tr>`
				}
				$('#productTable').DataTable();
				$('.sorting').trigger( "click" );

            }else{
                console.log('Error no se cargaron los artículos')
            }
        }
    });
}

function deleteArticulo(id_articulo = getId_Articulo()){
    $.ajax({
        type: "POST",
        url: "ajax/deleteArticle",
        data: {'id_articulo': id_articulo},
        success: function(data){

            if (data.status == "Success"){
				var table = $('#productTable').DataTable();
					 
				table.row(`#articulo${id_articulo}`).remove().draw( false );
				
				/*getArticulos();*/
                /*alert('Se dió de baja al artículo con éxito');*/
            }else{
                console.log('Error no se cargaron los artículos')
            }
        }
    });
}