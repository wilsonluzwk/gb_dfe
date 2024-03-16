function manifestoClass(params) {
    this.listar = function(oretlistar,params) {
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
     
        basicRequest("GET", _CT_SERVER_MANIFESTO + '?' + params, params, fcalback);

    };

}