/*----------------------------------------------------------------------------------------------
                                        2022
                                      wilson santa luz
----------------------------------------------------------------------------------------------*/
var ocnpj = 0;
var b64 = "";
var b64logo = "";
var nomearquivo;
var nomearquivologo;
var inputPfx;

var inputlogo;
var odados;
var codigo_loja = '0';
var tlschecked = false;
var sslchecked = false;
function prepareInsert() {
    $('#cnpj').prop('readonly', false);
    $('#cnpj').val('');
    $('#ambiente').prop('selectedIndex', 0);
    $('#contigencia').prop('selectedIndex', 0);
    $('#uf').prop('selectedIndex', 0);
    $('#email_ssl').prop('checked', sslchecked);
    $('#email_tls').prop('checked', tlschecked);
    $('#certificadoPfx').val('');
    $('#senhaPfx').val('');
    $('#validade').val('');
    $('#cnpj').focus();
    $('#UF').val('');
    $('#danfe_qtdcopias').val('');
    $('#danfe_qtdcopnfce').val(''); 
    $('#danfe_mdeautomatico').prop('checked', false);
    $('#danfe_visualiza').prop('checked', false);
    $('#danfe_exibefatura').prop('checked', false);
    $('#danfe_logomarcaarquivo').val('');
    $('#danfe_tipodanfce').prop('selectedIndex', 0);
    $('#danfe_expandilogo').prop('selectedIndex', 0);
    $('#danfe_tipodanf').prop('selectedIndex', 0);
    $('#danfe_horariodeverao').prop('checked', false);
    $('#danfe_fusohorario').prop('checked', false);
    $('#danfe_usahorariodf').prop('checked', false);
    $('#rt_ufexige').prop('checked', false);
    $('#proxy_host').val('');
    $('#proxy_porta').val('');
    $('#proxy_user').val('');
    $('#proxy_pass').val('');
}
function getEmpresas() {
    function getEmpresasCallback(oresponse) {
        $('#loading-indicator').hide();
        if (oresponse !== "") {
            var oparam = "";
            codigo_loja = '0';
            var ovalor = "";
            var indextpamb = 0;
            var visualiza = false;
            var mdeautomatico = false;
            var exibefatura = false;
            sslchecked = false;
            tlschecked = false;

            if (IsJsonString(oresponse)) {
                jsonConsulta = JSON.parse(oresponse);
                if (jsonConsulta.listHelper[0].web_Ambiente == "P") {
                    indextpamb = 1;
                };

                if (jsonConsulta.listHelper[0].email_ssl == "S") {
                    sslchecked = true;
                };
                if (jsonConsulta.listHelper[0].email_tls == "S") {
                    tlschecked = true;
                };
                if (jsonConsulta.listHelper[0].danfe_exibefatura == "S") {
                    exibefatura = true;
                };
                if (jsonConsulta.listHelper[0].danfe_visualiza == "S") {
                    visualiza = true;
                };

                if (jsonConsulta.listHelper[0].danfe_mdeautomatico == "S") {
                    mdeautomatico = true;
                };
                $('#cnpj').prop('readonly', true);
                codigo_loja = jsonConsulta.listHelper[0].codigo_loja;
                $('#cnpj').val(jsonConsulta.listHelper[0].cnpj);
                $('#razaoSocial').val(jsonConsulta.listHelper[0].razao_social);
                $('#csc').val(jsonConsulta.listHelper[0].csc);
                $('#idcsc').val(jsonConsulta.listHelper[0].idcsc);
                $('#email_neemail').val(jsonConsulta.listHelper[0].email_neemail);
                $('#email_host').val(jsonConsulta.listHelper[0].email_host);
                $('#email_port').val(jsonConsulta.listHelper[0].email_port);
                $('#email_user').val(jsonConsulta.listHelper[0].email_user);
                $('#email_pass').val(jsonConsulta.listHelper[0].email_pass);
                $('#email_ssl').prop('checked', sslchecked);
                $('#email_tls').prop('checked', tlschecked);
                $('#email_assunto').val(jsonConsulta.listHelper[0].email_assunto);
                $('#email_assunto_canc').val(jsonConsulta.listHelper[0].email_assunto_canc);
                $('#email_assunto_cce').val(jsonConsulta.listHelper[0].email_assunto_cce);
                $('#email_cc').val(jsonConsulta.listHelper[0].email_cc);
                $('#email_mensagem').val(jsonConsulta.listHelper[0].email_mensagem);
                $('#rt_idcsrt').val(jsonConsulta.listHelper[0].rt_idcsrt);
                $('#rt_csrt').val(jsonConsulta.listHelper[0].rt_csrt);
                $('#rt_cnpj').val(jsonConsulta.listHelper[0].rt_cnpj);
                $('#rt_xcontato').val(jsonConsulta.listHelper[0].rt_xcontato);
                $('#rt_email').val(jsonConsulta.listHelper[0].rt_email);
                $('#rt_fone').val(jsonConsulta.listHelper[0].rt_fone);
                $('#usafsda').val(jsonConsulta.listHelper[0].usaFsda);
                $('#nomecertificadoPfx').val(jsonConsulta.listHelper[0].nomecertificadoPfx);
                b64 = jsonConsulta.listHelper[0].certificadoPfx;
                nomearquivo = jsonConsulta.listHelper[0].nomecertificadoPfx;
                $('#senhaPfx').val(jsonConsulta.listHelper[0].senhaPfx);
                $('#validade').val(dataAmericana(jsonConsulta.listHelper[0].validade));
                $('#ambiente').prop('selectedIndex', indextpamb);
                $('#contigencia').prop('selectedIndex', jsonConsulta.listHelper[0].contigencia);
                $('#danfe_qtdcopias').val(jsonConsulta.listHelper[0].danfe_qtdcopias);
                $('#danfe_qtdcopnfce').val(jsonConsulta.listHelper[0].danfe_qtdcopnfce);
                $('#danfe_visualiza').prop('checked', visualiza);
                $('#danfe_exibefatura').prop('checked', exibefatura);
                $('#danfe_mdeautomatico').prop('checked', mdeautomatico);
                $('#danfe_logomarca').val(jsonConsulta.listHelper[0].danfe_logomarca);
                $('#danfe_mdeautomatico').val(jsonConsulta.listHelper[0].danfe_mdeautomatico);
                $('#danfe_tipodanfce').prop('selectedIndex', jsonConsulta.listHelper[0].danfe_tipodanfce);
                $('#danfe_expandilogo').prop('value', jsonConsulta.listHelper[0].danfe_expandilogo);
                $('#danfe_tipodanf').prop('selectedIndex', jsonConsulta.listHelper[0].danfe_tipodanf);
                $('#danfe_horariodeverao').prop('checked', jsonConsulta.listHelper[0].danfe_horariodeverao == "S");
                $('#danfe_fusohorario').prop('checked', jsonConsulta.listHelper[0].danfe_fusohorario == "S");
                $('#danfe_usahorariodf').prop('checked', jsonConsulta.listHelper[0].danfe_usahorariodf == "S");
                $('#rt_ufexige').prop('checked', jsonConsulta.listHelper[0].rt_ufexige == "S");
                $('#proxy_host').val(jsonConsulta.listHelper[0].proxy_host);
                $('#proxy_porta').val(jsonConsulta.listHelper[0].proxy_porta);
                $('#proxy_user').val(jsonConsulta.listHelper[0].proxy_user);
                $('#proxy_pass').val(jsonConsulta.listHelper[0].proxy_pass);

            } else {
                doalert('error', 'Erro inteno', oresponse);
            }

        } else {

            doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
        }
    }
    var dados = {
        "cnpj": ocnpj
    };
    var oparam = JSON.stringify(dados);
    $('#cnpj').val('');
    $('#ambiente').prop('selectedIndex', 0);
    $('#contigencia').prop('selectedIndex', 0);
    $('#csc').val('');
    $('#idcsc').val('');
    $('#email_neemail').val('');
    $('#email_host').val('');
    $('#email_port').val('');
    $('#email_user').val('');
    $('#email_pass').val('');
    $('#email_ssl').prop('checked', false);
    $('#email_tls').prop('checked', false);
    $('#email_assunto').val('');
    $('#email_assunto_canc').val('');
    $('#email_assunto_cce').val('');
    $('#email_cc').val('');
    $('#email_mensagem').val('');
    $('#rt_idcsrt').val('');
    $('#rt_csrt').val('');
    $('#rt_cnpj').val('');
    $('#rt_xcontato').val('');
    $('#rt_email').val('');
    $('#rt_fone').val('');
    $('#usafsda').val('N');
    $('#nomecertificadoPfx').val('');
    $('#certificadoPfx').val('');
    $('#senhaPfx').val('');
    $('#validade').val('');
    $('#danfe_qtdcopias').val('');
    $('#danfe_qtdcopnfce').val('');
    $('#danfe_visualiza').prop('checked', false);
    $('#danfe_mdeautomatico').prop('checked', false);
    $('#danfe_exibefatura').prop('checked', false);
    $('#danfe_logomarca').val('');
    $('#danfe_tipodanfce').prop('selectedIndex', 1);
    $('#danfe_expandilogo').prop('selectedIndex', 0);
    $('#danfe_tipodanf').prop('selectedIndex', 0);
    $('#danfe_horariodeverao').prop('checked', false);
    $('#danfe_fusohorario').prop('checked', false);
    $('#danfe_usahorariodf').prop('checked', false);
    $('#rt_ufexige').prop('checked', false);
    $('#proxy_host').val('');
    $('#proxy_porta').val('');
    $('#proxy_user').val('');
    $('#proxy_pass').val('');
    b64 = "";
    b64logo = "";
    nomearquivo = "";
    $('#loading-indicator').show();
    basicRequest("GET", _CT_SERVER_NFE_EMPRESA + '?' + oparam, oparam, getEmpresasCallback);
}
function deleteEmpresa() {
    function deleteEmpresaCallback(oresponse) {
        $('#loading-indicator').hide();
        if (oresponse !== "") {
            jsonResult = JSON.parse(oresponse);
            if (typeof jsonResult.codretorno == "undefined") {
                doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
            } else {
                if (jsonResult.codretorno == 200) {
                    listEmpresas();
                    getEmpresas();

                    doalert('success', 'Exclusão', jsonResult.codretorno + ' - ' + jsonResult.msg);


                } else {
                    doalert('info', ' Exclusão', jsonResult.codretorno + ' - ' + jsonResult.msg);

                }
            };
        };
    };
    if ($('#cnpj').val() == '') {
        alert('Cnpj é obrigatorio');
        return
    };
    $('#loading-indicator').show();
    var dados = {
        "cnpj": ocnpj
    };
    var oparam = JSON.stringify(dados);
    basicRequest("DELETE", _CT_SERVER_NFE_EMPRESA + '?' + oparam, oparam, deleteEmpresaCallback);

}
//-----------------------------------------------------------------------------------------------------------------//
function setEmpresa() {

    var setEmpresaCallback = function (oresponse) {
        $('#loading-indicator').hide();
        if (oresponse !== "") {
            jsonResult = JSON.parse(oresponse);
            if (typeof jsonResult.codretorno == "undefined") {
                doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
            } else {
                if (jsonResult.codretorno == 200) {
                    listEmpresas();
                    getEmpresas();

                    doalert('success', 'Gravação de parametros', jsonResult.codretorno + ' - ' + jsonResult.msg);


                } else {
                    doalert('info', ' Gravação de parametros', jsonResult.codretorno + ' - ' + jsonResult.msg);

                }
            };
        };
    };

    var preparePost = function () {
        var tpamb = 'H';
        tpamb = 'H';
        if ($('#ambiente').prop('selectedIndex') == 1) {
            tpamb = 'P'
        };
        var osslchecked = 'N'
        if ($('#email_ssl').prop('checked') == true) {
            osslchecked = 'S';
        };
        var otlschecked = 'N';
        if ($('#email_tls').prop('checked') == true) {
            otlschecked = 'S';
        }
        var exibefatura = 'N';
        if ($('#danfe_exibefatura').prop('checked') == true) {
            exibefatura = 'S'
        }
        var visualizadanfe = 'N';
        if ($('#danfe_visualiza').prop('checked') == true) {
            visualizadanfe = 'S'
        }
        var mdeautomatico = 'N';
        if ($('#danfe_mdeautomatico').prop('checked') == true) {
            mdeautomatico = 'S'
        }
        var ufexige = 'N';
        if ($('#rt_ufexige').prop('checked') == true) {
            ufexige = 'S'
        }
        var usahorariodf = 'N';
        if ($('#danfe_usahorariodf').prop('checked') == true) {
            usahorariodf = 'S'
        }
        var fusohorario = 'N';
        if ($('#danfe_fusohorario').prop('checked') == true) {
            fusohorario = 'S'
        }
        var horariodeverao = 'N';
        if ($('#danfe_horariodeverao').prop('checked') == true) {
            horariodeverao = 'S'
        }
        var pdados = {
            "codigo_loja": codigo_loja,
            "cnpj": $('#cnpj').val(),
            "razao_social": $('#razaoSocial').val(),
            "Web_Ambiente": tpamb,
            "contigencia": $('#contigencia').prop('selectedIndex'),
            "fone": $('#telefone').val(),
            "inscricaoMunicipal": $('#inscricaoMunicipal').val(),
            "insc_estadual": $('#inscricaoEstadual').val(),
            "nomecertificadoPfx": nomearquivo,
            "certificadoPfx": b64,
            "senhaPfx": $('#senhaPfx').val(),
            "validade": $('#validade').val(),
            "csc": $('#csc').val(),
            "idcsc": $('#idcsc').val(),
            "email_neemail": $('#email_neemail').val(),
            "email_host": $('#email_host').val(),
            "email_port": $('#email_port').val(),
            "email_user": $('#email_user').val(),
            "email_pass": $('#email_pass').val(),
            "email_ssl": osslchecked,
            "email_tls": otlschecked,
            "email_assunto": $('#email_assunto').val(),
            "email_assunto_canc": $('#email_assunto_canc').val(),
            "email_assunto_cce": $('#email_assunto_cce').val(),
            "email_cc": $('#email_cc').val(),
            "email_mensagem": $('#email_mensagem').val(),
            "rt_idcsrt": $('#rt_idcsrt').val(),
            "rt_csrt": $('#rt_csrt').val(),
            "rt_cnpj": $('#rt_cnpj').val(),
            "rt_xcontato": $('#rt_xcontato').val(),
            "rt_email": $('#rt_email').val(),
            "rt_fone": $('#rt_fone').val(),
            "usafsda": $('#usafsda').val(),
            "danfe_qtdcopias": $('#danfe_qtdcopias').val(),
            "danfe_qtdcopnfce": $('#danfe_qtdcopnfce').val(),
            "danfe_visualiza": visualizadanfe,
            "danfe_mdeautomatico": mdeautomatico,
            "danfe_exibefatura": exibefatura,
            "danfe_logomarca": $('#danfe_logomarca').val(),
            "danfe_tipodanfce": $('#danfe_tipodanfce').prop('selectedIndex'),
            "danfe_expandilogo": $('#danfe_expandilogo').prop('value'),
            "danfe_tipodanf": $('#danfe_tipodanf').prop('selectedIndex'),
            "danfe_horariodeverao": horariodeverao,
            "danfe_fusohorario": fusohorario,
            "danfe_usahorariodf": usahorariodf,
            "rt_ufexige": ufexige,
            "proxy_host": $('#proxy_host').val(),
            "proxy_porta": $('#proxy_porta').val(),
            "proxy_user": $('#proxy_user').val(),
            "proxy_pass": $('#proxy_pass').val()
        };
        odados = pdados;
        var oparam = JSON.stringify(pdados);
        $('#loading-indicator').show();
        basicRequest("POST", _CT_SERVER_NFE_EMPRESA, oparam, setEmpresaCallback);
    }
    var file = inputPfx.files[0];
    if (file) {
        reader = new FileReader();
        reader.onload = function () {

            b64 = reader.result.replace(/^data:.+;base64,/, '');
            console.log('conteudo base 64 é  ' + b64);
            preparePost();

        };
        reader.readAsDataURL(file);

    } else {
        preparePost();
    }
}
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

//*----------------------------------------------------------------------------------------------

empresaConfigMain = function () {
    "use strict";
    $('#small-version').text("version 22.08.05.1900");
    return {

        init: function () {


            inputPfx = document.getElementById('fileupload');
            inputlogo = document.getElementById('inputlogo');



            $("#empresaGravar").click(function () {
                setEmpresa();
            });
            $("#empresaExcluir").click(function () {
                deleteEmpresa();
            });

            $("#empresaInserir").click(function () {
                prepareInsert();
            });

            $('#selectfiliais').change(function () {

                ocnpj = $('#selectfiliais').val();
                if (ocnpj == 0) {
                    prepareInsert();
                    return;
                } else {
                    setTimeout(getEmpresas(ocnpj), 1000);
                }
            });

            $("#empresaReload").click(function () {
                $('#selectfiliais').val(0).change();
            });
            $(document).ready(function () {
                clearTimeout(vupdatepanel);

                setTimeout(listEmpresas(), 10);
                prepareForm.init();

            });
        }
    };
}();

/*----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------*/