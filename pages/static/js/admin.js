$(document).ready(function(){
	
	$('#example').DataTable();
	
	if( document.getElementById("complaintContainer").className == "list active"){ 
		getAllDataComplainst();
	}

    $(".new-tabs a").click(function(){
    	
		$(this).tab('show');


    });

});

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

var container = document.getElementById("complaintContainer");

container.onclick = function(){
	
	container.className = "list active";

	getAllDataComplainst();

}


/**
 * Datos provenientes del response: 
 * 	- Nombre del usuario reportado
 * 	- Nombre del usuario que realizó la denuncia
 * 	- Comentario
 * 	- Fecha de la denuncia
 * 	- Razón
 * 	- Status
 * */
function getAllDataComplainst(){

	document.getElementById("tbodyDataComplainst").innerHTML = "";

	var url = "ajax/getAllDataComplaint";
	var option = {
		method: "POST"
	};

	fetch(url, option)
		.then(response => response.json())
		.catch(error => console.error(error))
		.then(response => {

			if(response.status == "Success"){
				

				for(let index = 0; index < response.data.length; index++){
					
					document.getElementById("tbodyDataComplainst").innerHTML += `

							<tr onclick="showModal(this)">
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][0]}</td>
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][1]}</td>
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][2]}</td>
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][3]}</td>
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][4]}</td>
								<td style="max-width: 40px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${response.data[index][5]}</td>
							</tr>
							
					`;

				}
			}
		});
}



function showModal(object){

	$("#complaintModal").modal("show");
	drawFormInModal();
	loadDataInModal(object);

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
                    <label data-error="wrong" data-success="right" for="municipalityProduct">Status</label>
                    <input type="text" class="form-control validate" readonly id="status" required>
                    
                    
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-primary btn-user btn-block btn-rounded mb-4" onclick="updateProduct(this)">Actualizar Datos</button>
                </div>
                    <!-- <button type="button" class="btn btn-primary btn-user btn-block" onclick="updateProduct(this)">Actualizar Datos</button> -->
            </div> 
    `;
}


function loadDataInModal(tr){
	
	document.getElementById("reportedUser").value = tr.getElementsByTagName("td")[0].innerHTML;
	document.getElementById("userMakeReport").value = tr.getElementsByTagName("td")[1].innerHTML;
	document.getElementById("comment").value = tr.getElementsByTagName("td")[2].innerHTML;
	document.getElementById("date").value = tr.getElementsByTagName("td")[3].innerHTML;
	document.getElementById("reason").value = tr.getElementsByTagName("td")[4].innerHTML;
	document.getElementById("status").value = tr.getElementsByTagName("td")[5].innerHTML;
}