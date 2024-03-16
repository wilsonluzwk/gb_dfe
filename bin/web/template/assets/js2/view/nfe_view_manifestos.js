/*----------------------------------------------------------------------------------------------
                                         WLS 2022
                                      wilson santa luz
----------------------------------------------------------------------------------------------
*/

var objtblEmitidos;
var tipodata ='evento';
var indcol = 0;
var otimer;
var loja = 0;
var c = '';
var modelo = '';
var cnpj = '';
var objManifesto = new manifestoClass(0);
var versionFile = "23.11.01.1000";
var desEvento= '';


function listarManifestos() {
  function oretlistar(jsonConsulta) {
    array_manifestos = [];

    for (var i = 0; i < jsonConsulta.listHelper.length; i++) {
      var manifesto = [
        '',
        jsonConsulta.listHelper[i].cnpj,
        jsonConsulta.listHelper[i].dataHora,
        jsonConsulta.listHelper[i].chave,
        jsonConsulta.listHelper[i].descEvento,
        jsonConsulta.listHelper[i].cstat,
        jsonConsulta.listHelper[i].xmotivo.substring(0, 250),
        jsonConsulta.listHelper[i].protocolo,



      ];
      array_manifestos.push(manifesto);
    }


    objtblEmitidos.clear();
    objtblEmitidos.rows.add(array_manifestos);
    objtblEmitidos.draw();
    $('#loading-indicator').hide();


  };


  var dados = {
    "desEvento": desEvento,
    "cnpj": cnpj,
    "dataInicial": $('#dataInicial').val(),
    "dataFinal": $('#dataFinal').val(),
    "tipoData": $('input[name=tipodata]:checked', '#search').val()
  };
  var oparam = JSON.stringify(dados);

  objtblEmitidos.clear();
  var prep_arrray = [];
  objtblEmitidos.rows.add(prep_arrray);
  objtblEmitidos.draw();
  $('#loading-indicator').show();
  objManifesto.listar(oretlistar, oparam);
};
//-----------------------------------------------------------------------------------------------------------------//
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
    
      setTimeout(listarManifestos(), 100);
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
          listarManifestos()
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
        "sTitle": "Cnpj"

      },
      {
        "sTitle": "Data",
        render: function (data, type, row) {
          return isostrtodate(row[2])
        }

      },

      {
        "sTitle": "Chave"

      },

      {
        "sTitle": "Evento"

      },

      {
        "sTitle": "Cstat"

      },
      {
        "sTitle": "Motivo"

      },
      {
        "sTitle": "Protocolo"
      },
      ],


      "columnDefs": [

        {
          "defaultContent": "-",
          "targets": "_all",
          "data": null,
          "targets": 0,


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




    $("#data-table-emitidos tbody").on("click", "#iconsultar", function () {

      $(this).addClass("selected");
      listarManifestos();
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
      try {
        configDataTable();

      } catch (error) {
        alert(error)

      }


      $("#data-table-emitidos_wrapper").css("padding", "15px");

      $('input[type=radio][name=optradio]').change(function () {
        typechecked = $(this).prop('id');
        listarManifestos();
      });

      $('#selectTipoDoc').change(function () {

        desEvento = $('#selectTipoDoc').val();
        listarManifestos();
      });

      $('#selectfiliais').change(function () {
        cnpj = $('#selectfiliais').val();
        listarManifestos();
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

        $('#dataInicial').val(initialDate);
        $('#dataFinal').val(today);
        setTimeout(listEmpresas(), 100);
        clearTimeout(vupdatepanel);
      
      });
      $(document).unload(function () {

      });
    }
  };
}();

