/*
Linx  2019
implementado por wilson luz -2021
*/
var vdata_vendas = [];
var data_hist_dfe = [];
var areachart;
var linesChart;

var vupdatepanel;
var tabelaEmpresas;
//var data_hist_dfe = '[{ "x": "2019-02-01", "y": 60, "z": 30 } , { "x": "2019-03-01", "y": 25, "z": 41}]';

var
    blue = '#348fe2',
    blueLight = '#5da5e8',
    blueDark = '#1993E4',
    aqua = '#49b6d6',
    aquaLight = '#6dc5de',
    aquaDark = '#3a92ab',
    green = '#00acac',
    greenLight = '#33bdbd',
    greenDark = '#008a8a',
    orange = '#f59c1a',
    orangeLight = '#f7b048',
    orangeDark = '#c47d15',
    dark = '#2d353c',
    grey = '#b6c2c9',
    purple = '#727cb6',
    purpleLight = '#8e96c5',
    purpleDark = '#5b6392',
    red = '#ff5b57';

var getMonthName = function (number) {
    var month = [];
    month[0] = "Janeiro";
    month[1] = "Fevereiro";
    month[2] = "Março";
    month[3] = "Abril";
    month[4] = "Maio";
    month[5] = "Junho";
    month[6] = "Julho";
    month[7] = "Agosto";
    month[8] = "Setembro";
    month[9] = "Outubro";
    month[10] = "Novembro";
    month[11] = "Dezembro";
    return month[number];
};

var getDate = function (date) {
    var currentDate = new Date(date);
    var dd = currentDate.getDate();
    var mm = currentDate.getMonth() + 1;
    var yyyy = currentDate.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    currentDate = yyyy + '-' + mm + '-' + dd;

    return currentDate;
};
var dataAmericana = function (idata) {
    var data = idata.split("T")[0];
    return data
};
//-----------------------------------------------------------------------------------------------------------------//
var listEmpresas = function () {
    function listEmpresasCallback(oresponse) {
        $('#loading-indicator').hide();

        //var myObj = JSON.parse(this.responseText);

        if (oresponse !== "") {

            jsonConsulta = JSON.parse(oresponse);
            $("#selectfiliais").empty();


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
//----------------------------------------------------------------------------------------------------
var handlewidgetstat = function (ojson) {


    $("#icovalidadas").text('').fadeOut(800);
    $("#icocancel").text('').fadeOut(800);
    $("#iinutilizadas").text('').fadeOut(800);

    $("#nfe_validadas").text(ojson.notasEmitidas);
    $("#nfe_canceladas").text(ojson.notasCanceladas);
    $("#nfe_inutilizadas").text(ojson.notasInutilizadas);

    $("#cienciaoperacao").text(ojson.cienciaOperacao);
    $("#operacaoNaoRealizada").text(ojson.operacaoNaoRealizada);
    $("#desconhecimentoOperaco").text(ojson.desconhecimentoOperaco);
    $("#confirmacaooperacao").text(ojson.confirmacaoOperacao);





    setInterval(function () {
        $("#icovalidadas").show("pulsate", 800);
    }, 1000);
    setInterval(function () {
        $("#icocancel").show("pulsate", 800);
    }, 1600);
    setInterval(function () {
        $("#icopendentes").show("pulsate", 800);
    }, 2100);


}
//----------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------
var updateHistoricoNfse = function (ojson) {
    var vvalidadas = 0;
    var vcanceladas = 0;
    if (ojson.analissemensal.listHelper.length > 0) {
        var dados = '[';
        for (var i = 0; i < ojson.analissemensal.listHelper.length; i++) {
            vvalidadas = 0;
            vcanceladas = 0;
            if (ojson.analissemensal.listHelper[i].tipo == 'VALIDADAS') {
                vvalidadas = ojson.analissemensal.listHelper[i].valor
            }
            if (ojson.analissemensal.listHelper[i].tipo == 'CANCELADAS') {
                vcanceladas = ojson.analissemensal.listHelper[i].valor
            };
            var linha =
                '{' +
                '"Data" : "' + dataAmericana(ojson.analissemensal.listHelper[i].data) + '" , ' +
                '"Emitidas" : ' + vvalidadas + ',' +
                '"Canceladas" : ' + vcanceladas +
                ' }';
            if (dados == '[') {
                dados = '[ ' + linha
            } else {
                dados = dados + ',' + linha;
            }
        }
        dados = dados + ' ]';
        data_hist_dfe = JSON.parse(dados);
        if (linesChart !== undefined) {
            try {
                linesChart.setData(data_hist_dfe);

            } catch (err) {

                handleHistoricoDFE();
            }
        } else {

            handleHistoricoDFE();
        }
    }
}

//----------------------------------------------------------------------------------------------------
var functionCalback = function (oresponse) {
    if (oresponse !== "") {

        $("#dataupdate").text('').fadeOut(1000);



        $("#dataupdate").text('  dados atualizados :' + new Date().toLocaleString());
        setInterval(function () {
            $("#dataupdate").show("drop", 2200);
        }, 1000);



        jsonConsulta = null;
        jsonConsulta = JSON.parse(oresponse);

        if (typeof jsonConsulta.notasEmitidas !== "undefined") {
            handlewidgetstat(jsonConsulta);

        }

        if (typeof jsonConsulta.analissemensal !== "undefined") {
            updateHistoricoNfse(jsonConsulta);
        }
       
        if (typeof jsonConsulta.ultimaExecucao !== "undefined") {


            $("#updateManifesto").text('Manifestos - verificação local : ' + ' - ' + jsonConsulta.ultimaExecucao);


        }
        if (typeof jsonConsulta.empresas !== "undefined") {
            listarEmpresas(jsonConsulta);
        }

    }
}
//----------------------------------------------------------------------------------------------------

function listarEmpresas(jsonConsulta) {
    array_notas = [];

    for (var i = 0; i < jsonConsulta.empresas.listHelper.length; i++) {
        var notas = [
            jsonConsulta.empresas.listHelper[i].codigo_loja,
            jsonConsulta.empresas.listHelper[i].razao_social,
            jsonConsulta.empresas.listHelper[i].nsu_data_consulta,
            jsonConsulta.empresas.listHelper[i].nsu_sequencia
        ];
        array_notas.push(notas);
    }


    tabelaEmpresas.clear();
    tabelaEmpresas.rows.add(array_notas);
    tabelaEmpresas.draw();



};
//----------------------------------------------------------------------------------------------------
var updatePanel = function () {

    if (document.getElementById('dataupdate') instanceof Object) {
        $("#dataupdate").text('  Atualizando dados no servidor....');

        basicRequest("GET", _CT_SERVER_NFE_INFO, "", functionCalback);
    } else {

        clearInterval(vupdatepanel);
        vdata_vendas = undefined;
        data_hist_dfe = undefined;
        linesChart = undefined;
     
        vupdatepanel = undefined;
    }
};
//----------------------------------------------------------------------------------------------------

var handleHistoricoDFE = function () {
    linesChart = Morris.Line({

        element: 'morris-area-chart',
        data: data_hist_dfe,
        xkey: 'Data',
        parseTime: true,        
        pointSize:6,
        xLabelAngle:45,
        xLabelFormat :function (x) { return  x.toLocaleDateString().substring(0,5); } ,
        xLabels: 'days',
        ykeys: ['Emitidas', 'Canceladas'],
        labels: ['Emitidas', 'Canceladas'],
        smooth:true,
        hideHover:false,
        grid:true,
        resize: true,
        lineColors: ['#373651', '#E65A26']
    });

};

;

var handleNotificacao = function () {
    $(window).load(function () {
        setTimeout(function () {
            $.gritter.add({
                title: 'Status da operação!',
                text: 'Informações atualizadas .',
                image: 'assets/img/user-14.jpg',
                sticky: true,
                time: '',
                class_name: 'my-sticky-class'
            });
        }, 1000);
    });
};


var DashboardV2 = function () {
    $('#small-version').text("version 23.01.06.1000");
    "use strict";
    if (checkToken() !== true) {
        document.location.href="/";
    }
    return {
        //main function
       
        init: function () {
            $.getScript('assets/plugins/morris/raphael.min.js').done(function () {
                $.getScript('assets/plugins/morris/morris.js').done(function () {
                    vdata_vendas = undefined;
                    data_hist_dfe = undefined;
                    areachart = undefined;
                    linesChart = undefined;                 
                    vupdatepanel = undefined;
                  
                    handleHistoricoDFE();
                });
            });
            $.getScript('assets/plugins/gritter/js/jquery.gritter.js').done(function () {
                handleNotificacao();
            });
            tabelaEmpresas = $('#data-table-empresas').DataTable({dom: ''});
            updatePanel();
            vupdatepanel = setInterval(updatePanel, 30000);
            document.getElementById('nameUser').innerText =_CT_LOGED_USER;

        }
    };
}();