function testFunc(){
    console.log("Sanity Check");

    $.ajax({
        url : "ajax/gatherData",
        type : "POST", 
        data : { name : $('#name').val() },

        // Success
        // Se espera el json con las siguientes claves
        success : function(data) {
            $('#name').val(data.nombre);
            console.log(data);
        },

        // Non-Success
        error : function() {
            console.error("An error Ocurred");
        }
    });
}