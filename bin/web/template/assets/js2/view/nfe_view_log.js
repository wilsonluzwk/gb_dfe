/*
Wilson santaluz 2022
var versionFile = "23.10.19.1000";

*/
var jsonResult = {};
var slog = '';
function b64DecodeUnicode(str) {

	return decodeURIComponent(atob(str).split('').map(function (c) {
		return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	}).join(''));
}
var getLog = function () {

	var dados = {
		"operacao": "logs",
		"cnpj": $('#selectfiliais').val(),
		"data": $('#selectdata').val(),

	};
	params = JSON.stringify(dados);
	var fcalback = function (oresponse) {
		$('#loading-indicator').hide();
		if (oresponse !== "") {
			jsonResult = JSON.parse(oresponse);
			slog = b64DecodeUnicode(jsonResult.log);
			document.getElementById("logbody").value = slog;



		}
	}
	$('#loading-indicator').show();
	basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);
}
var listEmpresas = function () {
	function listEmpresasCallback(oresponse) {
		$('#loading-indicator').hide();

		//var myObj = JSON.parse(this.responseText);

		if (oresponse !== "") {

			jsonConsulta = JSON.parse(oresponse);
			$("#selectfiliais").empty();
			$("#selectfiliais").append(" <option value = '' >Global </option>");

			for (i = 0; i < jsonConsulta.listHelper.length; i++) {
				var id = jsonConsulta.listHelper[i].cnpj;
				var name = jsonConsulta.listHelper[i].codigo_loja + '-' + jsonConsulta.listHelper[i].razao_social
				$("#selectfiliais").append(" <option value = '" + id + "' > " + name + "</option>");
			};

		}

	};
	$('#loading-indicator').show();
	basicRequest("GET", _CT_SERVER_NFE_EMPRESA, "", listEmpresasCallback);
}

var log = function () {
	"use strict";
	return {

		init: function () {
			listEmpresas();
			var now = new Date();
			var inidate = new Date();
			inidate.setDate(now.getDate() - 20);
			var day = ("0" + now.getDate()).slice(-2);
			var iniday = ("0" + inidate.getDate()).slice(-2);
			var month = ("0" + (now.getMonth() + 1)).slice(-2);
			var inimonth = ("0" + (inidate.getMonth() + 1)).slice(-2);
			var initialDate = inidate.getFullYear() + "-" + (inimonth) + "-" + (iniday);
			var today = now.getFullYear() + "-" + (month) + "-" + (day);
	
			$('#selectdata').val(today);		
			clearTimeout(vupdatepanel);

			$('#selectfiliais').change(function () {
				getLog();
				
			  });

			  $('#selectdata').change(function () {
				getLog();
				
			  });  
			getLog();
			$("#icoRefresh").click(function () {
				getLog();
			});

		}
	};
}();