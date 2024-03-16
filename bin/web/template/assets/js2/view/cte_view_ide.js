var cnpj = '';
var modelo = '';
CteIdeView = function () {
    "use strict";
    var objTabela;
    var indiceColuna = 0;
    var ExecClass = new CteIdeClas;
    var Lchave = '';



    //-------------------------------------------------------------------------------
    this.ListarCteIde = function () {

        try {
            function oretlistar(jsonConsulta) {
                $('#loading-indicator').hide();
                var array_CteIdes = [];
                for (var i = 0; i < jsonConsulta.listHelper.length; i++) {
                    var CteIde = [
                        '',
                        jsonConsulta.listHelper[i].emitente,
                        jsonConsulta.listHelper[i].remetente,
                        jsonConsulta.listHelper[i].expedidor,
                        jsonConsulta.listHelper[i].chcte,
                        jsonConsulta.listHelper[i].cct,
                        jsonConsulta.listHelper[i].serie,
                        jsonConsulta.listHelper[i].dtEmis,
                        jsonConsulta.listHelper[i].nprot,
                        jsonConsulta.listHelper[i].cstat,
                        jsonConsulta.listHelper[i].vtprest,
                        jsonConsulta.listHelper[i].xml
                    ];
                    array_CteIdes.push(CteIde);
                }
                console.log(jsonConsulta);
                objTabela.clear();
                objTabela.rows.add(array_CteIdes);
                objTabela.draw();
                $('#loading-indicator').hide();
            };
            var dados = {
                "modelo": modelo,
                "cnpj": cnpj,
                "dataInicial": $('#dataInicial').val(),
                "dataFinal": $('#dataFinal').val()
            };
            var oparam = JSON.stringify(dados);

            objTabela.clear();
            var prep_arrray = [];
            objTabela.rows.add(prep_arrray);
            objTabela.draw();
            ExecClass.listar(oretlistar, oparam);
        }
        catch (err) {

            $('#loading-indicator').hide();
        }
    };
    function imprimirCce(pdfbase64) {


        var fileContent = atob(pdfbase64);
        var bb = new Blob([fileContent], { type: 'text/xml' });
        var a = document.createElement('a');
        a.download = Lchave + '.xml';
        a.href = window.URL.createObjectURL(bb);
        a.click();


    }


    /*----------------------------------------------------------------------------------------------
                                      PREPARAR O DATATABLE
    ------------------------------------------------------------------------------------------------
    */
    this.configDataTable = function () {
        "use strict";

        if ($('#data-table-cteide').length !== 0) {
            console.log('atribuindo tabela');
            objTabela = $('#data-table-cteide').DataTable({

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

                }, {
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
                        oclass.ListarCteIde();
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
                    "sTitle": "Emitente"
                },

                {
                    "sTitle": "Remetente"
                },
                {
                    "sTitle": "Expedidor"
                },
                {
                    "sTitle": "Chave"

                },
                {
                    "sTitle": "Código"
                },
                {
                    "sTitle": "Seríe"

                },
                {
                    "sTitle": "DtEmis"

                },
                {
                    "sTitle": "Protocolo"
                },
                {
                    "sTitle": "Status"
                },
                {
                    "sTitle": "Vtprest"
                },
                {
                    "sTitle": ""
                    ,
                    render: function (data, type, row) {
                        return "<XML>"
                    }
                }


                ],
                "columnDefs": [

                    {
                        "data": null,
                        orderable: false,
                        "targets": 0,
                        "defaultContent": "<div class= \"dropdown autodropdon\"  style=\"font-size:18;\" > " +
                            "<a href=\"javascript:;\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"> " +
                            "<img id=\"ImgUser\" src=\"ico/gear.png\" style=\"font-size:16;\" alt=\"\"></a> " +
                            "<ul class=\"dropdown-menu\"  style=\"font-size:18;\" >  " +
                            "<li class=\"dropdown-header \"></li>  " +

                            "<li><a href=\"#\" id=\"iimprimir\"   class=\"popconsulta fa fa-print \">  Baixar Xml do Cte</a></li> " +

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

            $("#data-table-cteide thead").on("click", "#boxsel", function () {

                if ($("#boxsel").hasClass("selected")) {
                    objTabela.rows().deselect();
                    $("#boxsel").removeClass("selected");
                } else {
                    objTabela.rows({
                        filter: "applied"
                    }).select();
                    $("#boxsel").addClass("selected");
                }
            });
            $("#data-table-cteide tbody").on("click", "#iimprimir", function () {

                Lchave = objTabela.row($(this).parents("tr")).data()[4];
                var pdfbase64 = objTabela.row($(this).parents("tr")).data()[11];


                imprimirCce(pdfbase64);
            });
            $("#data-table-cteide tbody").on("dblclick", "td", function () {
                indiceColuna = $(this).index();
            });
            $("#data-table-cteide tbody").on("click", "td", function () {
                indiceColuna = $(this).index();
            });
            $("#data-table-cteide tbody").on("click", "tr", function () {
                var rowData = objTabela.row($(this)).data();
                var ttipo = "clk";
                var col = indiceColuna
                var id = objTabela.row($(this)).data()[0];

            });

        }
    }
};
//-----------------------------------------------------------------------------
delete (oclass);
var oclass = new CteIdeView;
var versionFile = "24.03.15.1000";
//-------------------------------------------------------------------------------
CteIdeViewMain = function () {
    "use strict";
    clearTimeout(vupdatepanel);
    return {
        init: function () {

            $('#small-version').text("version " + versionFile);
            listEmpresas();
            $('#selectfiliais').change(function () {
                cnpj = $('#selectfiliais').val();
                oclass.ListarCteIde()
            });
            oclass.configDataTable();
            $(document).ready(function () {
                initFilters();
                $("#data-table-cteide_wrapper").css("padding", "15px");
                setTimeout(oclass.ListarCteIde(), 3000);



            });

        }
    };
}();