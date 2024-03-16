unit dfe.repository.validarnota;

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
  WK.Server.MessageList,
  Web.HTTPApp,
  WK.Server.Message,
  System.Rtti,
  StrUtils,
  WK.BasicRepository;

type
  [SwaggerImput = ctjsonNota]
  [Resource('varlidarnota')]

  TValidarNota = class(TBasicRepository, IValidarNota)

    function validarnota(JsonValue: TJSONObject): TJSONObject;

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

procedure TValidarNota.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType := INotaValidada;
    LMessageType.Content := validarnota(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin

      LMessageType := ENotaNaoValidada;
      LMessageType.Mensagem := 'Erro ao validar nota ' + E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TValidarNota.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // **
end;

function TValidarNota.validarnota(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    result := TJSONObject.ParseJSONValue(controller.validarNfe(JsonValue))
      as TJSONObject;
  finally
    FreeAndNil(controller);
  end;
end;

function TValidarNota._AddRef: Integer;
begin
  Inherited;
end;

function TValidarNota._Release: Integer;
begin
  Inherited;
end;

initialization

RegisterClass(TValidarNota);

end.
