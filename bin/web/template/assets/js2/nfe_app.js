var _HOST = '      http://localhost:4475';
var _CT_SERVER_NFSE_WEBSOCK = '      http://localhost:4475';
var _CT_SERVER_NFE = _HOST + '/dfeapi/nfe';
var _CT_SERVER_INU = _HOST + '/dfeapi/inutilizacoes';
var _CT_SERVER_CANC = _HOST + '/dfeapi/cancelamentos';
var _CT_SERVER_CARTA = _HOST + '/dfeapi/cartaCorrecao';
var _CT_SERVER_MANIFESTO = _HOST + '/dfeapi/manifesto';
var _CT_SERVER_NFE_INFO = _HOST + '/dfeapi/dashboard';
var _CT_SERVER_NFE_EMPRESA = _HOST + '/dfeapi/empresa';
var _CT_SERVER_CTE = _HOST + '/dfeapi/cte';
var _CT_SERVER_LOGIN = _HOST + '/dfeapi/auth';
var _CT_LOGED_USER ='';


var _socksclient;
var wsLastMsg = "INITIALIZING";
//var event = new Event('OnWsreceiptInfo');
//var event = document.createEvent('OnWsreceiptInfo');
//var event = new CustomEvent('OnWsreceiptInfo', { 'INFOJASON':"{}" });



function basicRequest(type, adress, params, fcalback) {
    var xhr = new XMLHttpRequest(); //xhr
    xhr.async = true;
    xhr.onreadystatechange = function () {

        if (this.readyState == 4) {
            oresponse = "";
            $('#loading-indicator').hide();
            if (this.status == 200) {
                oresponse = this.responseText;

            } else {
                var sstatus = this.status + ' - ' + this.responseText;
                switch (this.status) {
                    case 0:
                        sstatus = "Erro na conexão - Servidor offline ou erro de rede.";
                        break;
                    case 404:
                        sstatus = "404 - A URL informada não e válida ou servidor fora do ar";
                        break;
                    case 401:
                        sstatus = "401 - Acesso negado";
                        break;
                    case 500:
                        sstatus = "500 - Erro " + this.responseText;
                        break;
                    case 599:
                        sstatus = "599 -" + msgServer;
                        break;
                }
                doalert('error', 'Erro de acesso', sstatus);
            }
            fcalback(this.responseText);
        }
    };
    xhr.open(type, adress, true);

    xhr.setRequestHeader('Content-Type', 'application/json');
    if (params !== "") {
        xhr.send(params);
    } else {
        xhr.send();
    }
};

function doalert(atype, atitle, amsg) {
    $('#loading-indicator').hide();
    swal({
        type: atype,
        title: atitle,
        text: amsg
    });
};

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}
function checkToken() {
    var current_time = new Date().getTime() / 1000;
    try {
        _CT_LOGED_USER= JSON.parse(atob(JSON.parse(localStorage.getItem('gbdfeLogin')).token.split(".")[1])).sub
    } catch { 
        _CT_LOGED_USER ='';  
    };

    try {
        dataToken = JSON.parse(atob(JSON.parse(localStorage.getItem('gbdfeLogin')).token.split(".")[1])).iat;
        if (current_time > dataToken) { return false; }
        return true;
    }
    catch
    {
        dataToken = 0;
        localStorage.removeItem('gbdfeLogin');

        return false;
    }

}

function processSokstMsg(areceived_msg) {
    console.log('processando mensagem');
    if (IsJsonString(areceived_msg)) {
        console.log('processando mensagem do tipo json');
        var ojson = JSON.parse(areceived_msg);
        if (ojson.msgtype !== undefined) {
            console.log('processando tipo da mensagem ' + ojson.msgtype.toUpperCase());
            if (ojson.msgtype.toUpperCase() == 'INFO') {
                console.log('definindo mensagem');
                setTimeout(function () {
                    $.gritter.add({
                        title: 'Informação do servidor',
                        text: ojson.msgcontent,
                        image: 'ico/info_green.png',
                        sticky: false,
                        time: '10500',
                        class_name: 'my-sticky-class'
                    });

                }, 1000);
            };
            if (ojson.msgtype.toUpperCase() == 'SUCESS') {
                setTimeout(function () {
                    $.gritter.add({
                        title: 'Operaçao realizada',
                        text: ojson.msgcontent,
                        image: 'ico/knob/sucess.png',
                        sticky: false,
                        time: '10500',
                        class_name: 'my-sticky-class'
                    });

                }, 1000);
            };
            if (ojson.msgtype.toUpperCase() == 'ERROR') {
                setTimeout(function () {
                    $.gritter.add({
                        title: 'Erro no servidor!',
                        text: ojson.msgcontent,
                        image: 'ico/knob/error.png',
                        sticky: true,
                        time: '1500',
                        class_name: 'my-sticky-class'
                    });

                }, 1000);

            }

            if (ojson.msgtype.toUpperCase() == 'UPDATEINFONFSE') {


            }
        } else {
            console.log('mensagem sem tipo definido')
            setTimeout(function () {
                $.gritter.add({

                    text: ojson.msgcontent,
                    image: 'ico/info_green.png',
                    sticky: false,
                    time: '6500',
                    class_name: 'my-sticky-class'
                });

            }, 1000);
        }
    } else {
        console.log('mensagem sem conteudo json')
        setTimeout(function () {
            $.gritter.add({
                image: 'ico/info_green.png',
                text: areceived_msg,
                sticky: false,
                time: '8500',
                class_name: 'my-sticky-class'
            });

        }, 1000);


    }


}

function processSoksclose(areceived_msg) {
    setTimeout(function () {
        $.gritter.add({
            title: 'Conexão com o servidor perdida!',
            text: 'Conexão websockt fechada .',
            image: 'ico/knob/alert.gif',
            sticky: false,
            time: 10000,
            class_name: 'my-sticky-class'
        });
    }, 1000);


}

function WebSocketInitialize() {

    _socksclient = new WebSocket('ws://localhost:30086');

    // Connection opened
    _socksclient.addEventListener('open', function (event) {


    });

    // Listen for messages
    _socksclient.addEventListener('message', function (event) {
        processSokstMsg(event.data);

    });

}


function SendWsMessage(omsg) {
    if (_socksclient !== undefined) {

        if (_socksclient.readyState == 1) {
            _socksclient.send(omsg);

        } else {
            wsLastMsg = omsg
            WebSocketInitialize();
        }
    } else {
        wsLastMsg = omsg
        WebSocketInitialize();


    }

}

var appCache = window.applicationCache;
var forceupd = function () {
    try {
        appCache.update();
    } catch (err) {

    }

    if (appCache.status == window.applicationCache.UPDATEREADY) {
        appCache.swapCache();
    }
}


