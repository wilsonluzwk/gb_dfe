unit dfe.repository.manifestar;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  WK.Util,
  dfe.interfaces.manifestar,
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

  [Resource('manifestar')]
  TManifestar = class(TBasicRepository, IManifestar)
    function manifestar(JsonValue: TJSONObject): TJSONObject;
  private

  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  public
    [DBField('NULL', True, True, True, null)]
    Cnpj: String;
    [DBField('NULL', True, True, True, null)]
    chave: String;
    [DBField('NULL', True, True, True, null)]
    dataHota: Tdatetime;
    [DBField('NULL', True, True, True, null)]
    sequencia: integer;
    [DBField('NULL', True, True, True, null)]
    justificativa: String;
    [DBField('NULL', True, True, True, null)]
    tipo: integer;

    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;

implementation

procedure TManifestar.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType.Content := manifestar(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin
      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao gerar manifesto ' + E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TManifestar.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // **
end;

function TManifestar.manifestar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try

    result := TJSONObject.ParseJSONValue(controller.manifesto(JsonValue))
      as TJSONObject;

  finally
    FreeAndNil(controller);

  end;
end;

function TManifestar._AddRef: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
function TManifestar._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization

RegisterClass(TManifestar);

end.
