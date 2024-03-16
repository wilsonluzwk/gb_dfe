unit dfe.repository.emitircartacorrecao;

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

  [Resource('emitircartacorrecao')]
  TEmitirCartaCorrecao = class(TBasicRepository, ICartacorrecao)
    function cartacorrecao(JsonValue: TJSONObject): TJSONObject;
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
    xcorrecao: String;
    [DBField('NULL', True, True, True, null)]
    emailDestinatario: String;

    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;

implementation

procedure TEmitirCartaCorrecao.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
begin
  try
    LMessageType.Content := cartacorrecao(Dados);
    TMessage.create(LMessageType).SendMessage(Response);
  except
    on E: Exception do
    begin
      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao gerar carta de correcao' + E.Message;
      TMessage.create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TEmitirCartaCorrecao.QueryInterface(const IID: TGUID; out Obj)
  : HResult;
begin
  // **
end;

function TEmitirCartaCorrecao.cartacorrecao(JsonValue: TJSONObject)
  : TJSONObject;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try

    result := TJSONObject.ParseJSONValue(controller.cartacorrecao(JsonValue))
      as TJSONObject;

  finally
    FreeAndNil(controller);

  end;
end;

function TEmitirCartaCorrecao._AddRef: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
function TEmitirCartaCorrecao._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization

RegisterClass(TEmitirCartaCorrecao);

end.
