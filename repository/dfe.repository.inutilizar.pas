unit dfe.repository.inutilizar;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  WK.Util,
  dfe.interfaces.inutilizar,
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
  [Resource('inutilizar')]
  TInutilizar = class(TBasicRepository, IInutilizar)
    function Inutilizar(JsonValue: TJSONObject): TJSONObject;
  private

  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  public
     [DBField('NULL'  ,True, True,True, null)]
     cnpj : String;
     [DBField('NULL'  ,True, True,True, null)]
     numeroInicial: Integer;
     [DBField('NULL'  ,True, True,True, null)]
     numeroFinal : integer;
     [DBField('NULL'  ,True, True,True, null)]
     serie : integer;
     [DBField('NULL'  ,True, True,True, null)]
     ano : integer;
     [DBField('NULL'  ,True, True,True, null)]
     justicativa : String;
    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;
implementation
{ ----------------------------------------------------------------------------- }
procedure TInutilizar.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType.Content :=Inutilizar(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin
      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao inutilizar ' +
        E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;
{ ----------------------------------------------------------------------------- }
function TInutilizar.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // **
end;
{ ----------------------------------------------------------------------------- }
function TInutilizar.Inutilizar(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try

     result:= TJSONObject.ParseJSONValue(controller.inutilizarNfe(JsonValue)) as TJSONObject;

  finally
    FreeAndNil(controller);

  end;
end;
function TInutilizar._AddRef: Integer;
begin
  Inherited;
end;
{ ----------------------------------------------------------------------------- }
function TInutilizar._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization
RegisterClass(TInutilizar);

end.
