/**
 * @author kenneth.cruz@unah.hn
 * @version 0.1.0
 * @date   2021/08/14
 */


/**
 * 
 * Obtiene los datos de todas las denuncias no revisadas
 * 
 * Datos provenientes del response: 
 * 	- id de la denuncia
 * 	- Nombre del usuario reportado
 * 	- Nombre del usuario que realizó la denuncia
 * 	- Comentario
 * 	- Fecha de la denuncia
 * 	- Razón
 * 	- Status
 * */
 function getAllDataComplaintNotChecked(){

    var table = document.getElementById("tbodyDataComplainst");
    table.innerHTML = "";

	var url = "ajax/getAllDataComplaintNotChecked";
	var option = {
		method: "POST"
	};

	fetch(url, option)
		.then(response => response.json())
		.catch(error => console.error(error))
		.then(response => {

			if(response.status == "Success"){
				
                populateTable(table, response.data);
                
				//Añadir obligatoriamente para que los estilos no exploten
				if ( $.fn.dataTable.isDataTable( '#example' ) ) {
                    console.log('La tabla ya ha sido instanciada');
                }else{
                    $('#example').DataTable(
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
			}
		});
}


function populateTable(table, data){
    
    table.innerHTML = "";
    for(let index = 0; index < data.length; index++){
        
        table.innerHTML += `

                <tr onclick="showModal(this)" id="${data[index][0]}">
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][1]}</td>
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][2]}</td>
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][3]}</td>
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][4]}</td>
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][5]}</td>
                    <td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${data[index][6]}</td>
                </tr>
                
        `;

    }
}


/**
 * 
 * Obtiene los datos de todas las denuncias REVISADAS
 * 
 * Datos provenientes del response: 
 * 	- id de la denuncia
 * 	- Nombre del usuario reportado
 * 	- Nombre del usuario que realizó la denuncia
 * 	- Comentario
 * 	- Fecha de la denuncia
 * 	- Razón
 * 	- Status
 * */
 function getAllDataComplaintChecked(){

	var table = document.getElementById("tbodyDataComplainstChkd");

	var url = "ajax/getAllDataComplaintChecked";
	var option = {
		method: "POST"
	};

	fetch(url, option)
		.then(response => response.json())
		.catch(error => console.error(error))
		.then(response => {

			if(response.status == "Success"){

                populateTable(table, response.data);
			
				//Añadir obligatoriamente para que los estilos no exploten

				if ( $.fn.dataTable.isDataTable( '#example2' ) ) {
                    console.log('La tabla ya ha sido instanciada');
                }else{
                    $('#example2').DataTable(
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
			}
		});
}


function drawFormInModal(){
	
	document.getElementById("modal-body").innerHTML = `
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="titleProduct">Usuario denunciado</label>
                    <input type="text" class="form-control validate" readonly id="reportedUser" placeholder="Nombre del producto" required>
                    
                    
                </div>
				<div class="md-form mb-5">
				<label data-error="wrong" data-success="right" for="titleProduct">Denunciador</label>
				<input type="text" class="form-control validate" readonly id="userMakeReport" placeholder="Nombre del producto" required>
				
				
			</div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="descriptionProduct">Mensaje de la denuncia</label>
                    <textarea class="form-control validate" readonly id="comment" rows="3" required></textarea>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="categoryProduct">Fecha de la denuncia</label>
                    <input type="text" class="form-control validate" readonly id="date" placeholder="Categoría" required>
                    
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="stateProduct">Razón</label>
                    <input type="text" class="form-control validate" readonly id="reason" required>
        
                    
                </div>
				<div class="md-form mb-5">
					<label data-error="wrong" data-success="right" for="stateProduct">Número de denuncias asociados a este usuario</label>
					<input type="text" class="form-control validate" readonly id="numberOfComplainst" required>
				
				</div>
                <div class="md-form mb-5">
				<br>
					<label data-error="wrong" data-success="right" for="municipalityProduct">Estado de la denuncia</label><br>

					<div class="form-check">
						<input class="form-check-input" type="radio" name="radioComplaint-1" id="radio-complaint-0" onclick="hideOption();">
						<label class="form-check-label" for="radio-complaint-0">
							Sin revisar
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="radioComplaint-1" id="radio-complaint-1" onclick="showOption();">
						<label class="form-check-label" for="radio-complaint-1">
							Revisado
						</label>
					</div>	
                </div>
				
				<!-- Tomar decisión para dar de baja al usuario denunciado  -->
				
				<div class="md-form mb-5"  style="display: none;" id="stateComplaint">
					<hr>
					
					<div class="form-check">
						<input class="form-check-input" type="radio" name="radioComplaint-2" value="0" id="radio-complaint-2" onclick="showButton();">
						<label class="form-check-label" for="radio-complaint-2">
							Desestimar denuncia
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="radioComplaint-2" value="1" id="radio-complaint-3" onclick="showButton();">
						<label class="form-check-label" for="radio-complaint-3">
							Dar de baja al usuario denunciado
						</label>
					</div>	
					
					<div class="modal-footer d-flex justify-content-center">
                    	<button type="button" id="updateUserStatusReported" class="btn btn-primary btn-user btn-block btn-rounded mb-4" onClick="updateUserStatusReported();" disabled>Actualizar Datos</button>
                	</div>

					<div id="ochurus" style="display:none;"></div> <!-- Es una herramienta sorpresa que nos ayudará más adelante. -->

				</div>
            </div> 
    `;
}


function showOption(){
	document.getElementById("stateComplaint").style.display = "block";
}


function hideOption(){
	document.getElementById("stateComplaint").style.display = "none";

	document.getElementById("radio-complaint-2").checked = false;
	document.getElementById("radio-complaint-3").checked = false;
}


function showButton(){
	document.getElementById("updateUserStatusReported").disabled = false;
}


/**
 * Carga la información de un usuario en el formulario de denuncias
*/
function loadDataInModal(tr){
	
	var url = "ajax/getDataOfAComplaint";
	var fd = new FormData();

	fd.append("idComplaint", tr.id);
	
	var option = {
		method: "POST",
		body: fd
	};

	fetch(url, option)
		.then(response => response.json())
		.catch(error => console.error(error))
		.then(response => {
			
			if(response.status == "Success"){
			
				document.getElementById("reportedUser").value = tr.getElementsByTagName("td")[0].innerHTML;
				document.getElementById("userMakeReport").value = tr.getElementsByTagName("td")[1].innerHTML;
				document.getElementById("comment").value = tr.getElementsByTagName("td")[2].innerHTML;
				document.getElementById("date").value = tr.getElementsByTagName("td")[3].innerHTML;
				document.getElementById("reason").value = tr.getElementsByTagName("td")[4].innerHTML;
				document.getElementById("numberOfComplainst").value = response.numberOfComplainst;

				document.getElementById("ochurus").innerHTML = tr.id;
				
				if (tr.getElementsByTagName("td")[5].innerHTML.trim() == "Sín revisar") {
					document.getElementById("radio-complaint-0").checked = true; ;
				} 
				else{
					document.getElementById("radio-complaint-1").checked = false;

					document.getElementById("radio-complaint-0").disabled = true;
					document.getElementById("radio-complaint-1").disabled = true;
				}


			}
		});
}



/**
 * 
 * Estados posibles: 
 * 
 * 		0. Desestimar denuncia
 * 		1. Dar de baja al usuario denunciado
*/
function updateUserStatusReported(){

	var radio = parseInt(document.querySelector('input[name="radioComplaint-2"]:checked').value);
	//document.querySelector('input[name="genderS"]:checked').value;

	var url = "ajax/updateUserStatusReported";
	var fd = new FormData();

	fd.append("idComplaint", parseInt(document.getElementById("ochurus").innerHTML));
	fd.append("state", 1); // 1 - REVISADO

	(radio) ? fd.append("deleteUser", radio) : fd.append("deleteUser", radio);	// ¿Damos de baja al usuario? 

	var option = {
		method: "POST",
		body: fd
	};

	fetch(url, option)
		.then(response => response.json())
		.catch(error => console.error(error))
		.then(response => {

			if(response.status == "Success"){

				hideModal("#complaintModal");
				$("#modalAlertComplaintSuccess").modal("show");

			}
			else{

				hideModal("#complaintModal");
				$("#modalAlertComplaintDanger").modal("show");

			}

			getAllDataComplaintNotChecked();

		});
}


function showModal(object){

	$("#complaintModal").modal("show");
	drawFormInModal();
	loadDataInModal(object);

}