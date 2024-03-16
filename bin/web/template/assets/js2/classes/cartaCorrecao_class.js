function cartaCorrecaoClass(params) {
    this.listar = function(oretlistar, oparams) {
        var fcalback = function(oresponse) {
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
        if (typeof oparams === 'undefined' || oparams == '') {
            oparams = "{}";
        };
        basicRequest("GET", _CT_SERVER_CARTA + '?' + oparams, oparams, fcalback);

    };
    this.imprimirCce = function (pdfbase64) {
   
        var dados = {
          "protocoloCCe": protocoloCCe,
          "operacao": "imprimirCCe"
        };
        params = JSON.stringify(dados);
        var fcalback = function (oresponse) {
    
          if (oresponse !== "") {
            jsonResult = JSON.parse(oresponse);
            if (typeof jsonResult.codretorno == "undefined") {
              oret('');
              doalert('error', 'Imprimir nfse', 'Erro:Json não valido na resposta do servidor');
            } else {
              oret(jsonResult.arquivo)
    
    
    
            }
          }
        }
        basicRequest("PUT", _CT_SERVER_NFE + '?' + params, params, fcalback);
    
      }

}