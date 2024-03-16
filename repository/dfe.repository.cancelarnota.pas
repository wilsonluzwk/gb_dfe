unit dfe.repository.cancelarnota;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  WK.Util,
  dfe.interfaces.cancelar,
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
  [Resource('cancelarnota')]
  TCancelarNota = class(TBasicRepository, ICancelarNota)
    function cancelarnota(JsonValue: TJSONObject): TJSONObject;
  private

  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  public
    [DBField('NULL', True, True, True, null)]
    Cnpj: String;
    [DBField('NULL', True, True, True, null)]
    numero: integer;
    [DBField('', True, True, True, null)]
    serie: integer;
    [DBField('NULL', True, True, True, null)]
    chave: String;
    [DBField('NULL', True, True, True, null)]
    modelo: integer;
    [DBField('NULL', True, True, True, null)]
    ambiente: integer;
    [DBField('NULL', True, True, True, null)]
    protocolo: String;
    [DBField('NULL', True, True, True, null)]
    data: TDateTime;
    [DBField('NULL', True, True, True, null)]
    justificativa: String;
    [DBField('NULL', True, True, True, null)]
    emailDestinatario: String;

    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;

implementation

procedure TCancelarNota.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType.Content := cancelarnota(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin

      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao cancelar nota ' + E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TCancelarNota.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // **
end;

function TCancelarNota.cancelarnota(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
    result := TJSONObject.ParseJSONValue(controller.cancelarNfe(JsonValue))
      as TJSONObject;
  finally
    FreeAndNil(controller);

  end;
end;

function TCancelarNota._AddRef: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
function TCancelarNota._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization

RegisterClass(TCancelarNota);

end.
