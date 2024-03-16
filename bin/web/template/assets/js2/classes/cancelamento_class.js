function cancelamentoClass(params) {
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
        basicRequest("GET", _CT_SERVER_CANC + '?' + oparams, oparams, fcalback);

    };

}