unit dfe.repository.cartacorrecao;


interface

uses
  System.Classes,
  WK.Server.Attributes,
  WK.Util,
  dfe.interfaces.cartacorrecao,
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

  [Resource('cartacorrecao')]
  TCartaCorrecao = class(TBasicRepository, ICartacorrecao)
    function CartaCorrecao(JsonValue: TJSONObject): TJSONObject;
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

procedure TCartaCorrecao.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType.Content :=CartaCorrecao(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin
      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao gerar carta de correcao' +
        E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TCartaCorrecao.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // **
end;

function TCartaCorrecao.CartaCorrecao(JsonValue: TJSONObject): TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try

     result:= TJSONObject.ParseJSONValue(controller.CartaCorrecao(JsonValue)) as TJSONObject;

  finally
    FreeAndNil(controller);

  end;
end;
function TCartaCorrecao._AddRef: Integer;
begin
  Inherited;
end;
{ ----------------------------------------------------------------------------- }
function TCartaCorrecao._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization
RegisterClass(TCartaCorrecao);

end.
