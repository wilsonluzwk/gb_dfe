
var _loged = false;
var jsonlogin = {};
var handleLoginPageChangeBackground = function() {
    $('[data-click="change-bg"]').live('click', function(e) {
        e.preventDefault();
        var targetImage = '[data-id="login-cover-image"]';
        var targetImageSrc = $(this).find('img').attr('src');
        var targetImageHtml = '<img src="'+ targetImageSrc +'" data-id="login-cover-image" />';
        
        $('.login-cover-image').prepend(targetImageHtml);
        $(targetImage).not('[src="'+ targetImageSrc +'"]').fadeOut('slow', function() {
            $(this).remove();
        });
        $('[data-click="change-bg"]').closest('li').removeClass('active');
        $(this).closest('li').addClass('active');	
    });

};
function doLogin(params, evt) {


	var fcalback = function (oresponse) {
		$('#loading-indicator').hide();
		if (oresponse !== "") {

			jsonConsulta = null;
			if (IsJsonString(oresponse)) {
				jsonConsulta = JSON.parse(oresponse);
				jsonlogin = jsonConsulta;
				if (jsonConsulta.statusCod == 200) {
					
					_loged = true;
					localStorage.setItem('gbdfeLogin', JSON.stringify(jsonConsulta));					
					$('#flogin').submit();
				} else {

					doalert('error', 'Erro inteno', jsonConsulta.statusCod + ' - ' + jsonConsulta.msg);
				}
			} else {

				doalert('error', 'Erro inteno', oresponse);

			}
		}
	}

	var oparam = JSON.stringify(params);
	$('#loading-indicator').show();
	basicRequest("POST", _CT_SERVER_LOGIN, oparam, fcalback);



}
$(function () {
	$('#flogin').on("submit", function (e) {

		if (_loged == false) {
			e.preventDefault();
			
			var dados = {
				"user": $('#inputUsuario').val(),
				"senha": $('#inputSenha').val()

			};
			doLogin(dados, e);
		}

	});
});

var LoginV2 = function () {
	"use strict";
    return {
        //main function
        init: function () {
			localStorage.removeItem('gbdfeLogin'); 
			_loged = false;
			$('#infoserver').text('Version 2023-10-11 Api url: '+ _CT_SERVER_LOGIN)
            handleLoginPageChangeBackground();
        }
    };
}();