/*

Wilson santa luz 2023
*/
var padleft = function (avalue, alen) {

  var rvar = avalue;

  if (rvar == undefined) {
    rvar = "0";

  };
  while (rvar.length < parseInt(alen)) {
    rvar = '0' + rvar;
  }

  return rvar;
}
function formattedDate(odata) {
  var d = moment(odata);
  let month = String(d.getMonth() + 1);
  let day = String(d.getDate());
  const year = String(d.getFullYear());

  if (month.length < 2) month = '0' + month;
  if (day.length < 2) day = '0' + day;

  return `${day}/${month}/${year}`;
}

function isostrtodate(dateStr) {
  var sdate = dateStr.split("T")[0];
  const [year, month, day] = sdate.split("-");
  var d = new Date(year, month - 1, day);
  var oreturn = dateStr;

  if (typeof dateStr.split("T")[1] == "undefined") {

    oreturn = d.getDate() + '/' + String(parseInt(d.getMonth()) + 1) + '/' + d.getFullYear()
  } else {
    var vstime = dateStr.split("T")[1];
    const [hour, minuts, seconds] = vstime.split(":");
    oreturn = d.getDate() + '/' + String(parseInt(d.getMonth()) + 1) + '/' + d.getFullYear() + ' ' + hour + ':' + minuts;

  }
  if (oreturn == 'NaN/NaN/NaN') { oreturn = dateStr }
  return oreturn
}

var handleDatepicker = function () {
  $('.datepicker-default').datepicker({
    todayHighlight: true
  });


  $('#datepicker-inline').datepicker({
    todayHighlight: true
  });
  $('.input-daterange').datepicker({
    todayHighlight: true
  });
  $('#datepicker-disabled-past').datepicker({
    todayHighlight: true
  });
  $('#datepicker-autoClose').datepicker({
    todayHighlight: true,
    autoclose: true
  });
};


var handleFormMaskedInput = function () {
  "use strict";


  $('.campodata').mask("99/99/9999");
  $('.time').mask("00:00:00");
  $('.date_time').mask("00/00/0000 00:00:00");
  $('.campocep').mask("99999-999");
  $('.campofone').mask("999-9999");
  $('.campofoneddd').mask("(99) 9999-9999?9");
  $('.mixed').mask('AAA 000-S0S');
  $('.campocpf').mask("999.999.99-99");
  $('.campocnpj').mask("99.999.999/9999-99");
  $('.campomoney').mask("999.999.999.999.999,99");


};

jQuery(function ($) {
  $(".campofonedd").mask("(99) 9999-9999?9");
  $(".campofonedd").blur(function (event) {
    if ($(this).val().length == 15) {
      $('.campofonedd').mask("(99) 99999-999?9");
    } else {
      $('.campofonedd').mask("(99) 9999-9999?9");
    }
  });
});

$(document).ready(function () {

});


var handleJqueryAutocomplete = function () {
  var availableTags = [
    'ActionScript',
    'AppleScript',
    'Asp',
    'BASIC',
    'C',
    'C++',
    'Clojure',
    'COBOL',
    'ColdFusion',
    'Erlang',
    'Fortran',
    'Groovy',
    'Haskell',
    'Java',
    'JavaScript',
    'Lisp',
    'Perl',
    'PHP',
    'Python',
    'Ruby',
    'Scala',
    'Scheme'
  ];
  $('#jquery-autocomplete').autocomplete({
    source: availableTags
  });
};

var handleTagsInput = function () {
  $('.bootstrap-tagsinput input').focus(function () {
    $(this).closest('.bootstrap-tagsinput').addClass('bootstrap-tagsinput-focus');
  });
  $('.bootstrap-tagsinput input').focusout(function () {
    $(this).closest('.bootstrap-tagsinput').removeClass('bootstrap-tagsinput-focus');
  });
};

var dataAmericana = function (idata) {
  var data = idata.split("T")[0];
  return data
};

var handleSelect2 = function () {
  $(".default-select2").select2();
  $(".multiple-select2").select2({ placeholder: "Select a state" });
};
var BASE64_MARKER = ';base64,';

function convertDataURIToBinary(dataURI) {
  var base64Index = dataURI.indexOf(BASE64_MARKER) + BASE64_MARKER.length;
  var base64 = dataURI.substring(base64Index);
  var raw = window.atob(base64);
  var rawLength = raw.length;
  var array = new Uint8Array(new ArrayBuffer(rawLength));

  for (var i = 0; i < rawLength; i++) {
    array[i] = raw.charCodeAt(i);
  }
  return array;
}
var listEmpresas = function () {
  function listEmpresasCallback(oresponse) {
    $('#loading-indicator').hide();

    //var myObj = JSON.parse(this.responseText);

    if (oresponse !== "") {

      jsonConsulta = JSON.parse(oresponse);
      $("#selectfiliais").empty();
      $("#selectfiliais").append(" <option value = '' >Todas </option>");

      for (i = 0; i < jsonConsulta.listHelper.length; i++) {
        var id = jsonConsulta.listHelper[i].cnpj;
        var name = jsonConsulta.listHelper[i].codigo_loja + '-' + jsonConsulta.listHelper[i].razao_social
        $("#selectfiliais").append(" <option value = '" + id + "' > " + name + "</option>");
      };
      $('#selectfiliais').change();
    }

  };
  $('#loading-indicator').show();

  basicRequest("GET", _CT_SERVER_NFE_EMPRESA, "", listEmpresasCallback);


};
var initFilters =function (){
  var now = new Date();
  var inidate = new Date();
  inidate.setDate(now.getDate() - 20);
  var day = ("0" + now.getDate()).slice(-2);
  var iniday = ("0" + inidate.getDate()).slice(-2);
  var month = ("0" + (now.getMonth() + 1)).slice(-2);
  var inimonth = ("0" + (inidate.getMonth() + 1)).slice(-2);
  var initialDate = inidate.getFullYear() + "-" + (inimonth) + "-" + (iniday);
  var today = now.getFullYear() + "-" + (month) + "-" + (day);        
  $('#dataInicial').val(today);
  $('#dataFinal').val(today);
  clearTimeout(vupdatepanel);
  setTimeout(listEmpresas(), 10);

}


var prepareForm = function () {
  "use strict";
  return {
    //main function
    init: function () {

      handleFormMaskedInput();
      handleJqueryAutocomplete();
      handleTagsInput();
      ;

    }
  };
}();