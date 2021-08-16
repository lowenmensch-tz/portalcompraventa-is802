$(window).on('load', function() {
        var preloaderFadeOutTime = 500;
        function hidePreloader() {
            var preloader = $('.spinner-wrapper');
            setTimeout(function() {
                preloader.fadeOut(preloaderFadeOutTime);
            }, 500);
        }
        hidePreloader();
    });

window.onload = function(){
    sessionCheck2();
    // loadComments();
    // showComments();
};
function sessionCheck2(){
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