/*----------------------------------------------------------------------------------------------
                                         WLS 2022
                                      wilson santa luz
----------------------------------------------------------------------------------------------
*/

var objtblEmitidos;
var indcol = 0;
var otimer;
var typechecked = 'transmitida'
var modelo = '';
var cnpj = '';

var FclsNfe = new nfeClass(0);
var versionFile = "23.10.19.1000";
function popularModal() {

  handleFormMaskedInput();
  handleDatepicker();
}

/*----------------------------------------------------------------------------------------------
                                        FUNCÕES DE ACESSO AO SERVIDOR
------------------------------------------------------------------------------------------------
*/


function listarNotas() {
  function oretlistar(jsonConsulta) {
    array_notas = [];

    for (var i = 0; i < jsonConsulta.listHelper.length; i++) {
      var notas = [
        '',
        jsonConsulta.listHelper[i].cnpj,
        jsonConsulta.listHelper[i].numero,
        jsonConsulta.listHelper[i].serie,
        jsonConsulta.listHelper[i].modelo,
        jsonConsulta.listHelper[i].chave,
        jsonConsulta.listHelper[i].dataEmissao,
        jsonConsulta.listHelper[i].status,
        jsonConsulta.listHelper[i].motivo.substring(0, 250),
        jsonConsulta.listHelper[i].protocolo
      ];
      array_notas.push(notas);
    }


    objtblEmitidos.clear();
    objtblEmitidos.rows.add(array_notas);
    objtblEmitidos.draw();
    $('#loading-indicator').hide();


  };

  var dados = {
    "listType": typechecked,
    "modelo": modelo,
    "cnpj": cnpj,
    "dataInicial": $('#dataInicial').val(),
    "dataFinal": $('#dataFinal').val()
  };
  var oparam = JSON.stringify(dados);

  objtblEmitidos.clear();
  var prep_arrray = [];
  objtblEmitidos.rows.add(prep_arrray);
  objtblEmitidos.draw();
  $('#loading-indicator').show();
  FclsNfe.listar(oretlistar, oparam);
};
function imprimirDFE(cnpj, numero, serie, modelo) {
  function fcalback(arquivo) {

    $('#loading-indicator').hide();
    if (arquivo !== "") {
      $.get('ajax/modal_print.html', function (html) {
        var FobjModal = $('#htmlobjModalPrint');
        FobjModal.remove();
        $(html).appendTo('body').modal();
        document.getElementById('obj_pdf').src = 'docs/' + arquivo;
      });

    };
  }
  
  $('#loading-indicator').show();
  FclsNfe.imprimirDFE(cnpj, numero, serie, modelo, fcalback);
}
function getXml(cnpj, numero, serie, modelo) {
  function fcalback(arquivo) {

    $('#loading-indicator').hide();
    if (arquivo !== "") {

      

      window.open (
        'docs/'+arquivo ,
        'Arquivo xml',
        "width=800 height=600, top=100, left=110, scrollbars=yes " );
        
    

    };
  }
  
  $('#loading-indicator').show();
  FclsNfe.getXml(cnpj, numero, serie, modelo, fcalback);
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
/*----------------------------------------------------------------------------------------------
                            PREPARAR O DATATABLE
------------------------------------------------------------------------------------------------
*/
var configDataTable = function () {
  "use strict";

  if ($('#data-table-emitidos').length !== 0) {
    objtblEmitidos = $('#data-table-emitidos').DataTable({

      dom: 'lBfrtip',
      buttons: [{
        extend: "copyHtml5",

        text: "<i style=\"font-size:14px ;\" class=\"fa fa-files-o\"></i>",
        className: " btn btn-primary ",
        titleAttr: "Copiar para area de trabalho"
      },
      {
        extend: "print",
        className: " btn btn-info  ",
        text: "<i style=\"font-size:14px; \"  class=\"fa fa-print\"></i>",
        titleAttr: "Imprimir",

      }

        , {
        extend: "pdf",
        className: " btn btn-danger",
        text: "<i style=\"font-size:14px;\"  class=\"fa fa-file-pdf-o\"></i>",
        titleAttr: "Exportar pdf",

      }, {
        extend: "excel",
        className: "btn btn-success",
        titleAttr: "Exportar excel",
        text: "<i style=\"font-size:14px ;\"  class=\"fa fa-file-excel-o\"> </i> ",

      }, {

        titleAttr: "Atualizar",
        className: "btn btn-success",
        text: "<i style=\"font-size:14px ;\" class=\"fa fa-refresh\"> </i>  Atualizar",
        style: "font-weight: 600 !important;margin-left: 15px",
        type: "POST",
        action: function (e, dt, node, config, pdata) {
          listarNotas()
        }
      }
      ],
      responsive: true,
      autoFill: true,
      colReorder: false,
      keys: false,
      rowReorder: false,
      select: true,
      lengthMenu: [100, 200, 500, 1000],

      "aoColumns": [{


        "title": "<input id=\"boxsel\" type=\"checkbox\"></input>",
        "name": "boxsel"
      },

      {
        "sTitle": "Cnpj",
        "sClass": "calingleft"
      },

      {
        "sTitle": "Numero",
        "sClass": "calingleft",
        render: function (data, type, row) {
          return padleft(row[2], 6)
        }
      },
      {
        "sTitle": "Serie",
        render: function (data, type, row) {
          return padleft(row[3], 3)
        }
      },
      {
        "sTitle": "Modelo",
        render: function (data, type, row) {
          return padleft(row[4], 2)
        }
      },
      {
        "sTitle": "Chave°"


      },
      {
        "sTitle": "Data",
        render: function (data, type, row) {
          return isostrtodate(row[6])
        }
      },
      {
        "sTitle": "Status"
      },
      {
        "sTitle": "Motivo"
      },
      {
        "sTitle": "Protocolo"
      }
      ],


      "columnDefs": [

        {
          "data": null,
          orderable: false,
          "targets": 0,
          "defaultContent": "<div class= \"dropdown autodropdon\"  style=\"font-size:18;\" > " +
            "<a href=\"javascript:;\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"> " +
            "<img id=\"ImgUser\" src=\"ico/gear.png\" style=\"font-size:18;\" alt=\"\"></a> " +
            "<ul class=\"dropdown-menu\"  style=\"font-size:18;\" >  " +
            "<li class=\"dropdown-header \"></li>  " +

            "<li><a href=\"#\" id=\"iimprimir\"   class=\"popconsulta fa fa-print \">  Imprimir</a></li> " +
            "<li><a href=\"#\" id=\"igetxml\"   class=\"popconsulta fa fa-file-excel-o \">  Xml</a></li> " +

            "</ul> " +
            "</div> "

        }

      ],
      language: {
        "lengthMenu": "Mostrar  _MENU_  itens ",
        "zeroRecords": "Nada encontrado",
        "info": "Total: _MAX_ Registro(s) -  Pagina:  _PAGE_ /  _PAGES_ ",
        "infoEmpty": "Sem dados",
        "loadingRecords": "Carregando...",
        "processing": "Carregando...",
        "search": "Pesquisa:",
        "infoFiltered": "(Filtrado _TOTAL_ )",
        "select": {
          "rows": {
            "0": "",
            "1": "Selecionado 1 linha",
            "_": "Selecionados %d linhas"
          }
        },
        "paginate": {
          "previous": "Anterior",
          "next": "Proximo",
          "last": "Ultima",
          "First": "Primeira"
        }
      },
      processing: true
    });

    $("#data-table-emitidos thead").on("click", "#boxsel", function () {

      if ($("#boxsel").hasClass("selected")) {
        objtblEmitidos.rows().deselect();
        $("#boxsel").removeClass("selected");
      } else {
        objtblEmitidos.rows({
          filter: "applied"
        }).select();
        $("#boxsel").addClass("selected");
      }
    });

    $("#data-table-emitidos tbody").on("click", "#iimprimir", function () {
      var rowData = objtblEmitidos.row($(this).parents("tr")).data();
      var cnpj = objtblEmitidos.row($(this).parents("tr")).data()[1];
      var numero = objtblEmitidos.row($(this).parents("tr")).data()[2];
      var serie = objtblEmitidos.row($(this).parents("tr")).data()[3];
      var modelo = objtblEmitidos.row($(this).parents("tr")).data()[4];

      imprimirDFE(cnpj, numero, serie, modelo);
    });
    $("#data-table-emitidos tbody").on("click", "#igetxml", function () {
      var rowData = objtblEmitidos.row($(this).parents("tr")).data();
      var cnpj = objtblEmitidos.row($(this).parents("tr")).data()[1];
      var numero = objtblEmitidos.row($(this).parents("tr")).data()[2];
      var serie = objtblEmitidos.row($(this).parents("tr")).data()[3];
      var modelo = objtblEmitidos.row($(this).parents("tr")).data()[4];

      getXml(cnpj, numero, serie, modelo);
    });




    $("#data-table-emitidos tbody").on("click", "#ieditar", function () {
      var rowData = objtblEmitidos.row($(this).parents("tr")).data();
      var id = objtblEmitidos.row($(this).parents("tr")).data()[1];
      var cdfilial = objtblEmitidos.row($(this).parents("tr")).data()[2];
      $(this).addClass("selected");
      exibirNFe(id, cdfilial);
    });

    $("#data-table-emitidos tbody").on("click", "#iconsultar", function () {
      var rowData = objtblEmitidos.row($(this).parents("tr")).data();
      var id = objtblEmitidos.row($(this).parents("tr")).data()[1];
      $(this).addClass("selected");
      listarNotas();
    });


    $("#data-table-emitidos tbody").on("dblclick", "td", function () {
      indcol = $(this).index();
    });
    $("#data-table-emitidos tbody").on("click", "td", function () {
      indcol = $(this).index();
    });
    $("#data-table-emitidos tbody").on("click", "tr", function () {
      var rowData = objtblEmitidos.row($(this)).data();
      var ttipo = "clk";
      var col = indcol
      var id = objtblEmitidos.row($(this)).data()[0];

    });

  }
  $("#data-table-emitidos_wrapper").css("padding", "15px");
};

var consultarNFe = function () {

  alert("Usuario não definido para consulta");
};

notaviewMain = function () {
  "use strict";
  $('#small-version').text("version " + versionFile);
  return {

    init: function () {

      configDataTable();
      $("#data-table-emitidos_wrapper").css("padding", "15px");
      $("#NFeconsultar").click(function () {
        consultarNotas();
      });

      $('#selectfiliais').change(function () {
        cnpj = $('#selectfiliais').val();
        listarNotas();
      });


      $('input[type=radio][name=optradio]').change(function () {
        typechecked = $(this).prop('id');
        listarNotas();
      });

      $('#selectTipoDoc').change(function () {
        modelo = $('#selectTipoDoc').val();
        listarNotas();
      });
      $(document).ready(function () {
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
        
      });
      $(document).unload(function () {

      });
    }
  };
}();

