unit dfe.services.websocket;

interface

uses
  System.SysUtils,
  IdContext,
  System.Classes,
  JSON,
  REST.JSON,
  dfe.model.mensagens,
  WebSocketServer;

type

  TGbDFEWebSocket = class
  private
    FServer: TWebSocketServer;

    procedure Connect(AContext: TIdContext);
    procedure Disconnect(AContext: TIdContext);
    procedure Execute(AContext: TIdContext);
  public
    constructor Create;
    destructor Destroy; override;
    procedure enviarMensagem(mensagem: TmensagemServer);
  end;

  // VARIAVEL DE ESCOPO GLOBAL CUIDADO NÃO CRIAR DUAS INSTANCIAS
var
  FGbDFEWebSocket: TGbDFEWebSocket;

implementation

{ TGbDFEWebSocket }

constructor TGbDFEWebSocket.Create;
begin
  FServer := TWebSocketServer.Create;
  FServer.DefaultPort := 30086;
  FServer.OnExecute := Execute;
  FServer.OnConnect := Connect;
  FServer.OnDisconnect := Disconnect;
  FServer.Active := true;
  FGbDFEWebSocket := self;
end;

destructor TGbDFEWebSocket.Destroy;
begin
  FServer.Active := false;
  FServer.DisposeOf;

  inherited;
end;

procedure TGbDFEWebSocket.Connect(AContext: TIdContext);
begin

end;

procedure TGbDFEWebSocket.Disconnect(AContext: TIdContext);
begin

end;

procedure TGbDFEWebSocket.enviarMensagem(mensagem: TmensagemServer);
var
  I: Integer;
  Clients: TList;
  jso: TJSONObject;

begin
  if Assigned(FServer.Contexts) then
  begin
    jso := Tjson.ObjectToJsonObject(mensagem);
    Clients := FServer.Contexts.LockList;
    try
      for I := 0 to Clients.Count - 1 do
        if TIdContext(Clients[I]).Connection.Connected then
          TWebSocketIOHandlerHelper(TIdContext(Clients[I]).Connection.IOHandler)
            .WriteString(jso.ToJSON);
    finally
      FServer.Contexts.UnlockList;
    end;
  end;
end;

procedure TGbDFEWebSocket.Execute(AContext: TIdContext);
var
  io: TWebSocketIOHandlerHelper;
  msg: string;
begin
  io := TWebSocketIOHandlerHelper(AContext.Connection.IOHandler);
  io.CheckForDataOnSource(10);
  msg := io.ReadString;
  if msg = '' then
    exit;

  Writeln(msg);

  io.WriteString(msg);
end;

end.
