unit dfe.repository.dfeservices;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  WK.Util,
  dfe.interfaces.validar,
  IdGlobalProtocols,
   nfe.controller.nfe,
  json,
  System.SysUtils,
  WK.Server.Connection,
  synacode,
  REST.json,
  System.Generics.Collections,
  interfaces.QuestorDocumento,
  WK.Server.MessageList,
  Web.HTTPApp,
  WK.Server.Message,
  System.Rtti,
  IdHTTP, IdSSLOpenSSL,
  StrUtils,
  Resources.documentointegracao,
  WK.BasicRepository,
  WK.Server.ResourceBaseClass;

type

  [Resource('varlidarnota')]
  TDFeServices = class(TBasicReposistory, iDfeServices)

    function validar(JsonValue: TJSONObject): TJSONObject;
    function cancelar(JsonValue: TJSONObject): TJSONObject;
    function manifestar(JsonValue: TJSONObject): TJSONObject;
    function inutilizar(JsonValue: TJSONObject): TJSONObject;
    function cartaCorrecao(JsonValue: TJSONObject): TJSONObject;
    function imprimir(JsonValue: TJSONObject): TJSONObject;
    function getxml(JsonValue: TJSONObject): TJSONObject;
    function imprimirCCe(JsonValue: TJSONObject): TJSONObject;
  private

  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  public
    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;

implementation

{ ----------------------------------------------------------------------------- }

function TDFeServices.cancelar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.cancelarNfe(jValue);
  finally
    FreeAndNil(controller);
  end;

end;

function TDFeServices.cartaCorrecao(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.cartaCorrecao(jValue);
  finally
    FreeAndNil(controller);
  end;

end;

function TDFeServices.getLogs(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  if assigned(ResponseInfo) then
  begin
    controller := TNnfeController.create;
    try
{$IFDEF MSWINDOWS}
      CoInitialize(nil);
{$ENDIF MSWINDOWS}
      try
        ResponseInfo.ContentText := controller.getLogs(jValue);
      except
        on E: Exception do
        begin
          setResponse(10, 201, E.Message);
        end;
      end;
    finally
      FreeAndNil(controller);
{$IFDEF MSWINDOWS}
      CoUninitialize;
{$ENDIF MSWINDOWS}
    end;
  end;

end;

function TDFeServices.getxml(JsonValue: TJSONObject): TJSONObject;
begin

end;

function TDFeServices.imprimir(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.imprimirNfe(jValue);
  finally
    FreeAndNil(controller);
  end;

end;

function TDFeServices.imprimirCCe(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.imprimirCCe(jValue);
  finally
    FreeAndNil(controller);
  end;
end;

function TDFeServices.inutilizar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.inutilizarNfe(jValue);
  finally
    FreeAndNil(controller);
  end;

end;

function TDFeServices.manifestar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    ResponseInfo.ContentText := controller.manifesto(jValue);
  finally
    FreeAndNil(controller);
  end;

end;

procedure TDFeServices.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
  Ldocumento: TDFeServicesDto;
  LdocumentoIntegracao: TDocumentoIntegracao;
  Ljson: TJSONObject;
  LfileStrean: string;
  LfileType: string;
  i: Integer;
begin
  try

   if (isjason) and (assigned(jValue)) and (assigned(jValue.Get('operacao')))
    then
    begin
      jv := jValue.Get('operacao').JsonValue;
      if jv.Value = 'validacao' then
        validar
      else if jv.Value = 'cancelamento' then
        cancelar
      else if jv.Value = 'manifesto' then
        manifestar
      else if jv.Value = 'inutilizacao' then
        inutilizar
      else if jv.Value = 'cartacorrecao' then
        cartaCorrecao
      else if jv.Value = 'imprimir' then
        imprimir
      else if jv.Value = 'imprimirCCe' then
        imprimirCCe
      else if jv.Value = 'getxml' then
        getxml
      else if jv.Value = 'logs' then
        getLogs
      else
        raise Exception.create('operacao desconhecida ' + jv.Value);

    end;

    LMessageType.Content := Dados;
    TMessage.Create(LMessageType).SendMessage(Response);
  except
    on e: exception do
    begin

      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao converter documento recebido ' +
        e.Message;
      TMessage.Create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TDFeServices.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  //**
end;

function TDFeServices.validar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
{$IFDEF MSWINDOWS}
    CoInitialize(nil);
{$ENDIF MSWINDOWS}
    try
      ResponseInfo.ContentText := controller.validarNfe(jValue);
    except
      on E: Exception do
      begin
        setResponse(10, 201, E.Message);
      end;
    end;
  finally
    FreeAndNil(controller);
{$IFDEF MSWINDOWS}
    CoUninitialize;
{$ENDIF MSWINDOWS}
  end;

end;

function TDFeServices._AddRef: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
function TDFeServices._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization

RegisterClass(TDFeServices);

end.
