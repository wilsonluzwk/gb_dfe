﻿function nfeClass(_rps_id) {
  this.excluir = function (pchave, pfcallback) {
    var dados = {
      "chave": pchave

    };
    params = JSON.stringify(dados);
    var fcalback = function (oresponse) {
      if (oresponse !== "") {
        jsonResult = JSON.parse(oresponse);
        if (typeof jsonResult.codretorno == "undefined") {
          doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
        } else {
          if (jsonResult.codretorno == 1) {

            doalert('success', ' Exclusão de dados', jsonResult.codretorno + ' - ' + jsonResult.msg);

          } else {
            doalert('info', ' Exclusão de dados', jsonResult.codretorno + ' - ' + jsonResult.msg);

          }
        };
      };
      pfcallback();
    }
    basicRequest("DELETE", _CT_SERVER_NFE + '?' + params, params, fcalback);

  };

  function alterar() { }
  function inclur() { }
  this.exibirRps = function (pchave, oret, fclass) {
    var dados = {
      "chave": pchave
    };

    params = JSON.stringify(dados);
    var fretornoExibirRps = function (oresponse) {
      if (oresponse !== "") {
        jsonConsulta = JSON.parse(oresponse)
        oret();
      } else {

        doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor ' + oresponse);
      }
    }
    basicRequest("GET", _CT_SERVER_NFE + '?' + params, params, fretornoExibirRps);
  };
  this.validarRps = function (idrps, cdfilial, oret) {

    var dados = {
      "idrps": idrps,
      "operacao": "validacao",
      "cdEmp": 1,
      "cdfilial": cdfilial
    };
    params = JSON.stringify(dados);
    var fcalback = function (oresponse) {
      oret();
      if (oresponse !== "") {
        jsonResult = JSON.parse(oresponse);
        if (typeof jsonResult.codretorno == "undefined") {
          doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
        } else {
          if (jsonResult.codretorno == 1) {

            doalert('success', ' Emissao nfse', jsonResult.codretorno + ' - ' + jsonResult.msg);

          } else {

            doalert('info', 'Falha Emissao nfse ', jsonResult.codretorno + ' - ' + jsonResult.msg);

          }
        }
      }
    }
    basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);

  }
  this.listar = function (oretlistar, params) {

    var fcalback = function (oresponse) {
      if (oresponse !== "") {
        jsonConsulta = null;
        if (IsJsonString(oresponse)) {
          jsonConsulta = JSON.parse(oresponse);

          oretlistar(jsonConsulta);

        } else {
          doalert('error', 'Erro inteno', oresponse);

        }
      }
    }
    
    basicRequest("GET", _CT_SERVER_NFE + '?' + params,params, fcalback);

  };
  this.cancelarNfe = function (chave, protocolo, oret) {

    var dados = {
      "idrps": idrps,
      "operacao": "cancelamento",
      "cdEmp": 1,
      "cdfilial": cdfilial
    };
    params = JSON.stringify(dados);
    var fcalback = function (oresponse) {
      oret();
      if (oresponse !== "") {
        jsonResult = JSON.parse(oresponse);
        if (typeof jsonResult.codretorno == "undefined") {
          doalert('error', 'Erro inteno', 'Erro:Json não valido na resposta do servidor');
        } else {
          if (jsonResult.codretorno == 1) {

            doalert('success', ' Cancelamento nfse', jsonResult.codretorno + ' - ' + jsonResult.msg);

          } else {

            doalert('info', 'Cancelamento nfse ', jsonResult.codretorno + ' - ' + jsonResult.msg);

          }
        }
      }
    }
    basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);
  };
  this.imprimirDFE = function (cnpj,numero,serie,modelo, oret) {
   
    var dados = {
      "cnpj": cnpj,
      "serie": serie,
      "numero":numero,
      "modelo": modelo,
      "operacao": "imprimir"
    };
    params = JSON.stringify(dados);
    var fcalback = function (oresponse) {

      if (oresponse !== "") {
        jsonResult = JSON.parse(oresponse);
        if (typeof jsonResult.codretorno == "undefined") {
          oret('');
          doalert('error', 'Imprimir Nfe', 'Erro:Json não valido na resposta do servidor');
        } else {
          oret(jsonResult.arquivo)



        }
      }
    }
    basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);

  }
  this.getXml = function (cnpj,numero,serie,modelo, oret) {
   
    var dados = {
      "cnpj": cnpj,
      "serie": serie,
      "numero":numero,
      "modelo": modelo,
      "operacao": "getxml"
    };
    params = JSON.stringify(dados);
    var fcalback = function (oresponse) {

      if (oresponse !== "") {
        jsonResult = JSON.parse(oresponse);
        if (typeof jsonResult.codretorno == "undefined") {
          oret('');
          doalert('error', 'Xml', 'Erro:Json não valido na resposta do servidor');
        } else {
          oret(jsonResult.arquivo)



        }
      }
    }
    basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);

  }
  this.gravar = function (idRps, cdFilial, oret) { }
}
