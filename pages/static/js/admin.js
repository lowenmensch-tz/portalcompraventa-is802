$(document).ready(function(){
	
	sessionCheck(); 
    
    //Modal para confirmar la eliminacion de un articulo
    drawModalConfirm("modalConfirmDeleteProduct", "modal-text-content-confirm-delete-product", "deleteProduct();", "$('#modalDeleteProduct').modal('show');", "<p>¿Desea eliminar este produto de forma permanente?</p>");
    
    //Modal para confirmar la eliminacion de una categoria
    drawModalConfirm("modalConfirmDeleteCategory", "modal-text-content-confirm-delete-category", "deleteCategory();", "", "<p>¿Desea eliminar esta categoría de forma permanente?</p>");

    //Alert Mensaje satisfactorio para la elminación de una caegoria
    drawAlertMessage("modalAlertDeleteCategory", "alert-success", "Bien hecho!", "Se ha <strong>eliminado la categoría</strong> de forma satisfactoria");

    //Alert Mensaje satisfactorio para la eliminacion de un articulo
    drawAlertMessage("modalAlertAddCategory", "alert-success", "Bien hecho!", "Se ha <strong>agregado una categoría</strong> de forma satisfactoria");

    //Alert Mensaje satisfactorio al dar de baja una denuncia
    drawAlertMessage("modalAlertComplaintSuccess", "alert-success", "Bien hecho!", "El usuario <strong>ha sido dado de baja</strong> de forma satisfactoria");

    //Alert Mensaje De alerta al dar de alta una denuncia
    drawAlertMessage("modalAlertComplaintDanger", "alert-danger", "Advertencia", "La denuncia <strong>no ha sido procesada</strong>"+"\n" + "<strong>Por favor, revise los campos e intente nuevamente</strong>");
	
	//Dado que getCategories es un trigguer en el tab, en el momento
	//de recargar no estaban los datos asi que la llamamos en el ready
    getCategories();

	if( isActive("complaintContainer") ){ 
		getAllDataComplaintNotChecked();
	}
    
	//$('#example2').DataTable();
	/*$('#productTable').DataTable();*/


    $(".new-tabs a").click(function(){
		$(this).tab('show');

		//Se usa localstorage para almacenar la tab actual al recargar
		localStorage.setItem('lastTab', $(this).attr('href'));

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
		}else if (this.parentNode.id == "categoriesTab"){
            getCategories();
        }
		

    });

    //Aqui accedemos al localstorage almacenado anteriormente
    //para desplazarnos al tab en el que estabamos
    var lastTab = localStorage.getItem('lastTab');
    if (lastTab) {
        $('[href="' + lastTab + '"]').tab('show');
    }

});

var id_articulo;
var id_category;

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
	return (document.getElementById(id).className == "list active")? true: false;
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

/*
Información de los artículos:
0 = id del artículo
1 = Nombre artículo
2 = Nombre usuario
3 = Categoria
*/ 
function getArticulos(){
    
    $("#productTable tbody").html("");

    var url = "ajax/getArticles";
    var option = { method: 'POST' };

    fetch(url, option)
        .then(response => response.json())
        .catch(error => console.log(error))
        .then(response => {

            if (response.status == "Success"){

                for (let i = 0; i < response.data.length; i++){

                    $("#productTable tbody").append(`
                            <tr id="articulo${response.data[i][0]}">
                                <td onclick="drawModalDeleteProduct(${response.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[i][2]}</td>
                                <td onclick="drawModalDeleteProduct(${response.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[i][1]}</td>
                                <td onclick="drawModalDeleteProduct(${response.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[i][3]}</td>
                                <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="button" class="btn btn-sm btn-danger" 
                                style="height:2rem; padding-top:0.1px" data-toggle="modal" data-target="#delete-articulo" href="#delete-articulo" onclick="setArticulo('${(response.data[i][1]).replace(/["']/g, "")}',${response.data[i][0]});">X</button></td>
                            </tr>	
                        `);
                } //end for    
                $("#productTable").DataTable();
				$('.sorting').trigger( "click" );
            }
        });
        

    /*
        url: "ajax/getArticles",
        data: {},
        success: function(data){

            if (data.status == "Success"){
				document.getElementById("tbodyDataProduct").innerHTML = "";
				for (i=0; i<((data.data).length);i++){
					document.getElementById("tbodyDataProduct").innerHTML += `
					<tr id="articulo${data.data[i][0]}">
							<td onclick="drawModalDeleteProduct(${data.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][2]}</td>
							<td onclick="drawModalDeleteProduct(${data.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][1]}</td>
							<td onclick="drawModalDeleteProduct(${data.data[i][0]})" style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[i][3]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="button" class="btn btn-sm btn-danger" 
							style="height:2rem; padding-top:0.1px" data-toggle="modal" data-target="#delete-articulo" href="#delete-articulo" onclick="setArticulo('${(data.data[i][1]).replace(/["']/g, "")}',${data.data[i][0]});">X</button></td>
					</tr>`
				}
    */
}


function getCategories(){

	var categoriesTable = document.getElementById("tbodyDataCategory");
    categoriesTable.innerHTML = "";

    $.ajax({
        type: "POST",
        url: "ajax/getCategories",
        data: {},
        success: function(data){

            if (data.status == "Success"){
                //loadCategories(data.data);

				categoriesTable.innerHTML ="";
                console.log(data.data);
                for(let index = 0; index < data.data.length; index++){
                    //console.log(data.data[index][0]);
					categoriesTable.innerHTML += `
						<tr id="${data.data[index][0]}">
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[index][0]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data.data[index][1]}</td>
							<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="button" class="btn btn-sm btn-danger" style="height:2rem; padding-top:0.1px" onclick="deleteCategoryProcess(${data.data[index][0]});">X</button></td>
						</tr>	
					`;

				}

                if ( $.fn.dataTable.isDataTable( '#categoryTable' ) ) {
                    console.log('La tabla ya ha sido instanciada');
                }else{
                    $('#categoryTable').DataTable(
                        {
                            "language": {
                                "lengthMenu": "Mostrar _MENU_ entradas",
                                "zeroRecords": "No se encontraron entradas - Lo sentimos",
                                "info": "Mostrando página _PAGE_ de _PAGES_",
                                "infoEmpty": "No hay registros disponibles",
                                "search": "Buscar: ",
                                "infoFiltered": "(Filtrado de _MAX_ registros totales)",
                                "paginate": {
                                    "first":      "Primero",
                                    "last":       "último",
                                    "next":       "Siguiente",
                                    "previous":   "Previo"
                                }
                            }
                        }
                    );
                }

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
            if (data.status == "Success"){
                $("#modalAlertAddCategory").modal("show");
                //window.location.reload();
                //$('#tbodyDataCategory').DataTable().destroy();
                
                setTimeout(function(){
                    window.location.reload();
                }, 1000);

            }else{
                alert('Usted ha eliminado todas las categorias');
            }
        }
    });
}

function deleteCategoryProcess(id){
    id_category = id;
    $("#modalConfirmDeleteCategory").modal("show");
}

function deleteCategory(){

	$.ajax({
        type: "POST",
        url: "ajax/deleteCategories",
        data: { 'id_categoria': id_category },
        success: function(data){
		console.log(data);
            if (data.status == "Success"){
                $("#modalConfirmDeleteCategory").modal("hide");
                $("#modalAlertDeleteCategory").modal("show");
                
                setTimeout(function(){
                    window.location.reload();
                }, 1000);

            }else{
                alert('Ya no hay categorias disponibles');
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


/**
 * Modal con un mensaje luego de haber ejecutado alguna acción CRUD
*/
function drawAlertMessage(idModalFade, className, title, content){

    var body = document.body;
    
    body.innerHTML += `
    <div class="modal fade" id="${idModalFade}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header alert-success">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="alert-heading">${title}</h4>
                </div>
                <div class="modal-body">
                    <br>
                    ${content}
                    <br>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    `;
}


/**
 * Modal para la confirmación de la eliminación de un artículo, categoría o cualquier otra elemento
*/
function drawModalConfirm(idModalFade, idModalBody, nameFunctionOK, nameFunctionClose,title){
    
    var body = document.body;

    body.innerHTML += `
        <!-- Modal Confirmación para eliminar producto -->
        <div class="modal fade" id="${idModalFade}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header alert alert-danger" role="alert">
                    <h5 class="modal-title">Advertencia</h5> 
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="${idModalBody}">
                    
                    ${title}    
                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="${nameFunctionClose}">Cerrar</button>
                    <button type="button" class="btn btn-primary btn btn-danger" onclick="${nameFunctionOK}">Aceptar</button>
                </div>
                </div>
            </div>
        </div> 
    `;
}