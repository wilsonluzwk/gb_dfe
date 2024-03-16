unit nfe.controller.nfe;

interface

uses
  classes,
  Xml.XmlTransform,
  Xml.XMLIntf,
  Xml.xmldom,
  dateUtils,
  System.JSON,
  Xml.XMLDoc,
  REST.JSON.Types,
  dfe.model.manifestoRequest,
  dfe.services.cteManifestar,
  REST.JSON,
  sysutils,
  dfe.lib.XmltoJson,
  dfe.lib.jsontoXml,
  System.NetEncoding,
  dfe.model.nfe,
  dfe.model.config,
  dfe.dao.nfe,
  dfe.dao.inutilizacao,
  dfe.dao.manifesto,
  dfe.dao.cartaCorrecao,
  dfe.services.validar,
  dfe.dao.cancelamento,
  dfe.model.infonfe,
  dfe.dao.infonfe,
  dfe.model.validacaoRequest,
  dfe.model.validacaoResponse,
  dfe.model.cancelamento,
  dfe.model.inutilizacao,
  dfe.model.cartaCorrecao,
  dfe.model.cancelamentoRequest,
  dfe.services.impimirDfe,
  dfe.model.cartaCorrecaoRequest,
  dfe.model.manifesto,
  dfe.model.inutilizacaoRequest,
  dfe.services.cancelar,
  dfe.services.manifestar,
  dfe.services.inutilizar,
  dfe.lib.constants,
  dfe.services.cartaCorrecao,
  dfe.model.empresa;

type
  TNnfeController = class
  private

  public
    function validarNfe(pjson: TJSONObject): string;
    function cancelarNfe(pjson: TJSONObject): string;
    function inutilizarNfe(pjson: TJSONObject): string;
    function imprimirNfe(pjson: TJSONObject): string;
    function getXml(pjson: TJSONObject): string;
    function imprimirCCe(pjson: TJSONObject): string;
    function cartaCorrecao(pjson: TJSONObject): string;
    function manifesto(pjson: TJSONObject): string;
    function manifestoCte(pjson: TJSONObject): string;
    function listarNfe(pjson: TJSONObject): string;
    function listarCancelamentos(pjson: TJSONObject): string;
    function listarCartaCorrecao(pjson: TJSONObject): string;
    function listarInutilizacoes(pjson: TJSONObject): string;
    function listarManifesto(pjson: TJSONObject): string;

    function getInfo(pjson: TJSONObject): string;
    function getLogs(pjson: TJSONObject): string;
    function setErroObject(error: string): string;
  end;

implementation

{ TNnfeController }
{ ----------------------------------------------------------------------------- }
function TNnfeController.cancelarNfe(pjson: TJSONObject): string;
var
  cancelamento: TCancelamento;
  service: TServiceCancelar;
  request: TCancelamentoRequest;
  response: TCancelamento;
  procedure setResponsebyNota();
  begin
    response := TCancelamento.create;
    response.Cnpj := cancelamento.Cnpj;
    response.Numero := cancelamento.Numero;
    response.Serie := cancelamento.Serie;
    response.chave := request.chave;
    response.ambiente := request.ambiente;
    response.protocoloNota := request.protocolo;
    response.justificativa := request.justificativa;
    response.xmlRetorno := TNetEncoding.base64.Encode(cancelamento.xmlRetorno);
    response.data := DateTimeToStr(request.data);
    response.cstat := cancelamento.cstat;
    response.xmotivo := cancelamento.xmotivo;
    response.protocoloCancelamento := cancelamento.protocoloCancelamento;
    response.danfe := cancelamento.danfe;
    response.danfeBase64 := cancelamento.danfe;
  end;

begin
  try
    request := tjson.JsonToObject<TCancelamentoRequest>(pjson.tostring);
    cancelamento := TCancelamento.create();
    cancelamento.Cnpj := request.Cnpj;
    cancelamento.emailDestinatario := request.emailDestinatario;
    cancelamento.Numero := request.Numero;
    cancelamento.Serie := request.Serie;
    cancelamento.chave := request.chave;
    cancelamento.protocoloNota := request.protocolo;
    cancelamento.data := DateTimeToStr(request.data);
    cancelamento.justificativa := request.justificativa;
    service := TServiceCancelar.create(cancelamento);
    setResponsebyNota();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;
end;

function TNnfeController.manifesto(pjson: TJSONObject): string;
var
  manifesto: Tmanifesto;
  service: TServicemanifesto;
  request: TmanifestoRequest;
  response: Tmanifesto;
  procedure setResponsebyManifesto();
  begin
    response := Tmanifesto.create;
    response.Cnpj := manifesto.Cnpj;
    response.chave := manifesto.chave;
    response.dataHora := request.dataHora;
    response.sequencia := request.sequencia;
    response.justificativa := request.justificativa;
    response.xmotivo := manifesto.xmotivo;
    response.cstat := manifesto.cstat;
    response.xmlEvento := TNetEncoding.base64.Encode(manifesto.xmlEvento);
    response.danfe := manifesto.danfe;
    response.cstat := manifesto.cstat;
    response.xmotivo := manifesto.xmotivo;
    response.protocolo := manifesto.protocolo;
    response.danfeBase64 := manifesto.danfe;
  end;

begin
  try
    request := tjson.JsonToObject<TmanifestoRequest>(pjson.tostring);
    manifesto := Tmanifesto.create();
    manifesto.Cnpj := request.Cnpj;
    manifesto.chave := request.chave;
    manifesto.dataHora := request.dataHora;
    manifesto.sequencia := request.sequencia;
    manifesto.justificativa := request.justificativa;
    manifesto.tipo := request.tipo;
    service := TServicemanifesto.create(manifesto);
    setResponsebyManifesto();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;

end;

function TNnfeController.manifestoCte(pjson: TJSONObject): string;
var
  manifesto: Tmanifesto;
  service: TServicemanifestoCte;
  request: TmanifestoRequest;
  response: Tmanifesto;
  procedure setResponsebyManifesto();
  begin
    response := Tmanifesto.create;
    response.Cnpj := manifesto.Cnpj;
    response.chave := manifesto.chave;
    response.dataHora := request.dataHora;
    response.sequencia := request.sequencia;
    response.justificativa := request.justificativa;
    response.xmotivo := manifesto.xmotivo;
    response.cstat := manifesto.cstat;
    response.xmlEvento := TNetEncoding.base64.Encode(manifesto.xmlEvento);
    response.danfe := manifesto.danfe;
    response.cstat := manifesto.cstat;
    response.xmotivo := manifesto.xmotivo;
    response.protocolo := manifesto.protocolo;
    response.danfeBase64 := manifesto.danfe;
  end;

begin
  try
    request := tjson.JsonToObject<TmanifestoRequest>(pjson.tostring);
    manifesto := Tmanifesto.create();
    manifesto.Cnpj := request.Cnpj;
    manifesto.chave := request.chave;
    manifesto.dataHora := request.dataHora;
    manifesto.sequencia := request.sequencia;
    manifesto.justificativa := request.justificativa;
    manifesto.tipo := request.tipo;
    service := TServicemanifestoCte.create(manifesto);
    setResponsebyManifesto();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;
end;

function TNnfeController.setErroObject(error: string): string;
var
  jsonResult: TJSONObject;
begin
  jsonResult := TJSONObject.create;
  jsonResult.AddPair('codretorno', '400');
  jsonResult.AddPair('msgerro', error);
  result := jsonResult.tostring;
end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.cartaCorrecao(pjson: TJSONObject): string;
var
  cartaCorrecao: TcartaCorrecao;
  service: TServicecartaCorrecao;
  request: TcartaCorrecaoRequest;
  response: TcartaCorrecao;

  procedure setResponsebycartaCorrecao();
  begin
    response := TcartaCorrecao.create;
    response.Cnpj := cartaCorrecao.Cnpj;
    response.chave := cartaCorrecao.chave;
    response.dataHora := request.dataHora;
    response.sequencia := request.sequencia;
    response.xcorrecao := request.xcorrecao;
    response.xmotivo := cartaCorrecao.xmotivo;
    response.cstat := cartaCorrecao.cstat;
    response.xmlEvento := TNetEncoding.base64.Encode(cartaCorrecao.xmlEvento);
    response.xmlRetorno := TNetEncoding.base64.Encode(cartaCorrecao.xmlEvento);
    response.danfe := cartaCorrecao.danfe;
    response.cstat := cartaCorrecao.cstat;
    response.xmotivo := cartaCorrecao.xmotivo;
    response.protocoloCce := cartaCorrecao.protocoloCce;
    response.danfeBase64 := cartaCorrecao.danfe;
  end;

begin
  try

    request := tjson.JsonToObject<TcartaCorrecaoRequest>(pjson.tostring, []);
    cartaCorrecao := TcartaCorrecao.create();
    cartaCorrecao.Cnpj := request.Cnpj;
    cartaCorrecao.emailDestinatario := request.emailDestinatario;
    cartaCorrecao.chave := request.chave;
    cartaCorrecao.dataHora := request.dataHora;
    cartaCorrecao.sequencia := request.sequencia;
    cartaCorrecao.xcorrecao := request.xcorrecao;

    service := TServicecartaCorrecao.create(cartaCorrecao);
    setResponsebycartaCorrecao();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;

end;

function TNnfeController.getInfo(pjson: TJSONObject): string;
var
  dao: TDaoInfoNfe;
  model: TinfoNfe;
  timeDate: TDateTime;
  sfile: string;
begin
  sfile := ExtractFilePath(GetModuleName(HInstance)) + _ctFileInfoDashBoard;
  FileAge(sfile, timeDate);
  if (not FileExists(sfile)) or (SecondsBetween(now, timeDate) > 100) then
  begin
    DeleteFile(sfile);
    dao := TDaoInfoNfe.create;
    try
      model := dao.getInfoNfe(pjson);
      result := tjson.ObjectToJsonString(model);
      with TStringList.create do
      begin
        text := result;
        savetofile(sfile);
        free;
      end;
    finally
      FreeAndNil(dao);
    end;
  end
  else
  begin
    with TStringList.create do
    begin
      LoadFromFile(sfile);
      result := text;
      free;
    end;
  end;

end;

function TNnfeController.getLogs(pjson: TJSONObject): string;
var
  sresult: string;
  dao: TDaoInfoNfe;
begin
  dao := TDaoInfoNfe.create;
  try
    sresult := dao.getLogs(pjson);
    result := sresult;
  finally
    FreeAndNil(dao);
  end;

end;

function TNnfeController.getXml(pjson: TJSONObject): string;
var
  service: TServiceImprimirDFE;
  arquivo: string;
  jsonResult: TJSONObject;
begin
  service := TServiceImprimirDFE.create;
  try

    arquivo := service.getXml(pjson);
    jsonResult := TJSONObject.create;
    if arquivo <> '' then
    begin

      jsonResult.AddPair('arquivo', arquivo);
      jsonResult.AddPair('codretorno', '200');
    end
    else
    begin
      jsonResult.AddPair('codretorno', '400');
      jsonResult.AddPair('msgerro', 'Arquivo pdf não pode ser gerado');
    end;
    result := jsonResult.tostring;
  finally
    FreeAndNil(service);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.imprimirNfe(pjson: TJSONObject): string;
var
  service: TServiceImprimirDFE;
  arquivo: string;
  jsonResult: TJSONObject;
begin
  service := TServiceImprimirDFE.create;
  try

    arquivo := service.imprimir(pjson);
    jsonResult := TJSONObject.create;
    if arquivo <> '' then
    begin

      jsonResult.AddPair('arquivo', arquivo);
      jsonResult.AddPair('codretorno', '200');
    end
    else
    begin
      jsonResult.AddPair('codretorno', '400');
      jsonResult.AddPair('msgerro', 'Arquivo pdf não pode ser gerado');
    end;
    result := jsonResult.tostring;
  finally
    FreeAndNil(service);
  end;

end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.imprimirCCe(pjson: TJSONObject): string;
var
  service: TServiceImprimirDFE;
  arquivo: string;
  jsonResult: TJSONObject;
begin
  service := TServiceImprimirDFE.create;
  try

    arquivo := service.imprimir(pjson);
    jsonResult := TJSONObject.create;
    if arquivo <> '' then
    begin

      jsonResult.AddPair('arquivo', arquivo);
      jsonResult.AddPair('codretorno', '200');
    end
    else
    begin
      jsonResult.AddPair('codretorno', '400');
      jsonResult.AddPair('msgerro', 'Arquivo pdf não pode ser gerado');
    end;
    result := jsonResult.tostring;
  finally
    FreeAndNil(service);
  end;

end;

function TNnfeController.inutilizarNfe(pjson: TJSONObject): string;
var
  inutilizacao: Tinutilizacao;
  service: TServiceInutilizar;
  request: TinutilizacaoRequest;
  response: Tinutilizacao;
  procedure setResponsebyInutilizacao();
  begin
    response := Tinutilizacao.create;
    response.Cnpj := inutilizacao.Cnpj;
    response.numeroInicial := inutilizacao.numeroInicial;
    response.numeroFinal := inutilizacao.numeroFinal;
    response.Serie := request.Serie;
    response.xmotivo := inutilizacao.xmotivo;
    response.justificativa := request.justificativa;
    response.xmlEvento := TNetEncoding.base64.Encode(inutilizacao.xmlEvento);
    response.ano := request.ano;
    response.cstat := inutilizacao.cstat;
    response.xmotivo := inutilizacao.xmotivo;
    response.protocolo := inutilizacao.protocolo;
    response.danfe := inutilizacao.danfe;
    response.danfeBase64 := inutilizacao.danfeBase64;
    response.modelo := request.modelo;
    response.dhRecbto := inutilizacao.dhRecbto;
  end;

begin
  try
    request := tjson.JsonToObject<TinutilizacaoRequest>(pjson.tostring);
    inutilizacao := Tinutilizacao.create();
    inutilizacao.Cnpj := request.Cnpj;
    inutilizacao.numeroInicial := request.numeroInicial;
    inutilizacao.numeroFinal := request.numeroFinal;

    inutilizacao.Serie := request.Serie;
    inutilizacao.ano := request.ano;
    inutilizacao.modelo := request.modelo;
    inutilizacao.justificativa := request.justificativa;
    service := TServiceInutilizar.create(inutilizacao);
    setResponsebyInutilizacao();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.listarNfe(pjson: TJSONObject): string;
var
  dao: TDaoNfe;
  notas: Tnotas;

begin
  dao := TDaoNfe.create;
  try
    try
      if assigned(pjson) then
        notas := dao.listNotas(pjson)
      else
        notas := dao.listNotas(Nil);
      result := tjson.ObjectToJsonString(notas);
      FreeAndNil(notas);
    except
      on e: exception do
        raise exception.create(e.Message);
    end;
  finally
    if assigned(dao) then
      FreeAndNil(dao);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.listarCartaCorrecao(pjson: TJSONObject): string;
var
  dao: TDaoCartaCorrecao;
  cartas: TcartasCorrecao;
begin
  dao := TDaoCartaCorrecao.create;
  try
    if assigned(pjson) then
      cartas := dao.listCartaCorrecaos(pjson)
    else
      cartas := dao.listCartaCorrecaos(Nil);
    result := tjson.ObjectToJsonString(cartas);
  finally
    if assigned(cartas) then
      FreeAndNil(cartas);
    FreeAndNil(dao);
  end;
end;
{ ----------------------------------------------------------------------------- }

function TNnfeController.listarInutilizacoes(pjson: TJSONObject): string;
var
  dao: TDaoInutilizacao;
  inutilizacoes: TInutilizacoes;
begin
  dao := TDaoInutilizacao.create;
  try
    if assigned(pjson) then
      inutilizacoes := dao.listInutilizacaos(pjson)
    else
      inutilizacoes := dao.listInutilizacaos(Nil);
    result := tjson.ObjectToJsonString(inutilizacoes);
  finally
    if assigned(inutilizacoes) then
      FreeAndNil(inutilizacoes);
    FreeAndNil(dao);
  end;
end;

function TNnfeController.listarManifesto(pjson: TJSONObject): string;
var
  dao: TDaomanifesto;
  manifestos: Tmanifestos;
begin
  dao := TDaomanifesto.create;
  try
    if assigned(pjson) then
      manifestos := dao.listmanifestos(pjson)
    else
      manifestos := dao.listmanifestos(Nil);
    result := tjson.ObjectToJsonString(manifestos);
  finally
    if assigned(manifestos) then
      FreeAndNil(manifestos);
    FreeAndNil(dao);
  end;

end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.listarCancelamentos(pjson: TJSONObject): string;
var
  dao: TDaoCancelamento;
  cancelamentos: Tcancelamentos;
begin
  dao := TDaoCancelamento.create;
  try
    if assigned(pjson) then
      cancelamentos := dao.listCancelamentos(pjson)
    else
      cancelamentos := dao.listCancelamentos(Nil);
    result := tjson.ObjectToJsonString(cancelamentos);
  finally
    if assigned(cancelamentos) then
      FreeAndNil(cancelamentos);
    FreeAndNil(dao);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TNnfeController.validarNfe(pjson: TJSONObject): string;
var
  nota: Tnota;
  servicevalidar: TNfeValidar;
  request: TValidacaoRequest;
  response: TValidacaoResponse;
  procedure setResponsebyNota();
  begin

    response.danfeBase64 := servicevalidar.danfeBase64;
    response.Cnpj := nota.Cnpj;
    response.Numero := nota.Numero;
    response.Serie := nota.Serie;
    response.modelo := request.modelo;
    if nota.dataProcessamento > 0 then
    begin
      response.xmlProcesado := TNetEncoding.base64.Encode(nota.Xml);
      response.xmlRetorno := TNetEncoding.base64.Encode(nota.xmlRetorno);

    end;
    response.chave := nota.chave;
    response.xmotivo := nota.motivo;

    response.cstat := inttostr( nota.status);
    response.protocolo := nota.protocolo;
    response.dataProcesamemento := nota.dataProcessamento;
    response.dataValidacao := nota.dataValidacao;
    response.digito := nota.digitoval;
    if nota.Fsda then
    begin
      response.cstat := 'FSDA';
      response.xmotivo := 'Nota(s) emitida em modo FSDA '
    end;

  end;

begin

  request := tjson.JsonToObject<TValidacaoRequest>(pjson.tostring);
  response := TValidacaoResponse.create;
  nota := Tnota.create();
  try
    nota.emailtransportadora := request.emailtransportadora;
    nota.Cnpj := request.Cnpj;
    nota.Numero := request.Numero;
    nota.Serie := request.Serie;
    nota.Xml := TNetEncoding.base64.Decode(request.Xml);
    nota.Txt := request.Txt;
    servicevalidar := TNfeValidar.create(nota);
    setResponsebyNota();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(nota);
    try
      FreeAndNil(response);
    except
    end;
    try
      if assigned(servicevalidar) then
        FreeAndNil(servicevalidar);
    except
    end;

  end;
end;

{ ----------------------------------------------------------------------------- }
end.
