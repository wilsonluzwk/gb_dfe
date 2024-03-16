unit WK.Server.ServerConsole;

interface

// DEFINIR SE VAI USAR SSL
// {$DEFINE SSL}

uses

  System.SysUtils,
  System.Classes,
  System.Types,
  IdContext,
  IPPeerServer,
  IPPeerAPI,
  IdHTTPWebBrokerBridge,
  IdSSLOpenSSLHeaders,
  IdServerIOHandler,
  IdSSLOpenSSL,
  WK.Server.Config,
  Web.WebReq,
  Web.WebBroker,
  dfe.schedule.MDE,
  WK.Server.Constants,
  WK.Server.Swagger,
  WK.Server.ResourceBaseClass,
  WK.Server.Connection,
  Datasnap.DSSession, IdCustomHTTPServer;

type
  TGetSSLPassword = class
    procedure OnGetSSLPassword(var APassword:
{$IF CompilerVersion < 27}AnsiString{$ELSE}string{$ENDIF});
  end;

type
  TSSLHelper = class

    procedure QuerySSLPort(APort: Word; var VUseSSL: boolean);
  end;

type
  Tbase = class(TResourceBaseClass)

  end;

type
  TServerConsole = class(TPersistent)
  public
    procedure TerminateThreads;
    function BindPort(APort: Integer): boolean;
    function CheckPort(APort: Integer): Integer;
    procedure SetPort(const AServer: TIdHTTPWebBrokerBridge; APort: String);
    procedure StartServer(const AServer: TIdHTTPWebBrokerBridge);
    procedure StopServer(const AServer: TIdHTTPWebBrokerBridge);
    procedure WriteCommands;
    procedure WriteStatus(const AServer: TIdHTTPWebBrokerBridge);
    procedure RunServer(APort: Integer);
    procedure ExceptionServer(AContext: TIdContext; AException: Exception);
    procedure DoParseAuthentication(AContext: TIdContext;
      const AAuthType, AAuthData: String; var VUsername, VPassword: String;
      var VHandled: boolean);
    function IsTokenValid(AAuthData: string): boolean;
    procedure IdHTTPServerConnect(AContext: TIdContext);
    procedure IdHTTPServer1CommandOther(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  globalServer: TServerConsole;

implementation

procedure TServerConsole.TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

function TServerConsole.BindPort(APort: Integer): boolean;
var
  LTestServer: IIPTestServer;
begin
  Result := True;
  try
    LTestServer := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    LTestServer.TestOpenPort(APort, nil);
  except
    Result := False;
  end;
end;

function TServerConsole.CheckPort(APort: Integer): Integer;
begin
  if BindPort(APort) then
    Result := APort
  else
    Result := 0;
end;

procedure TServerConsole.DoParseAuthentication(AContext: TIdContext;
  const AAuthType, AAuthData: String; var VUsername, VPassword: String;
  var VHandled: boolean);
begin

  VHandled := AAuthType.Equals('Bearer') and IsTokenValid(AAuthData);

end;

procedure TServerConsole.ExceptionServer(AContext: TIdContext;
  AException: Exception);
begin
  // Writeln('Internal erro ' + AException.Message);
end;

procedure TServerConsole.IdHTTPServer1CommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  TIdSSLIOHandlerSocketOpenSSL(AContext.Connection.Socket).PassThrough := False;
end;

procedure TServerConsole.IdHTTPServerConnect(AContext: TIdContext);
begin
  TIdSSLIOHandlerSocketOpenSSL(AContext.Connection.Socket).PassThrough := False;
end;

function TServerConsole.IsTokenValid(AAuthData: string): boolean;
begin
  if AAuthData <> '' then
  begin
    Result := True;
  end;

end;

procedure TServerConsole.SetPort(const AServer: TIdHTTPWebBrokerBridge;
  APort: String);
begin
  if not AServer.Active then
  begin
    APort := APort.Replace(cCommandSetPort, '').Trim;
    if CheckPort(APort.ToInteger) > 0 then
    begin
      AServer.DefaultPort := APort.ToInteger;
      Writeln(Format(sPortSet, [APort]));
    end
    else
      Writeln(Format(sPortInUse, [APort]));
  end
  else
    Writeln(sServerRunning);
  Write(cArrow);
end;

procedure TServerConsole.StartServer(const AServer: TIdHTTPWebBrokerBridge);
begin
  if not AServer.Active then
  begin
    if CheckPort(AServer.DefaultPort) > 0 then
    begin

      AServer.Bindings.Clear;
      AServer.Active := True;
    end
    else
      Writeln(Format(sPortInUse, [AServer.DefaultPort.ToString]));
  end
  else
    Writeln(sServerRunning);

end;

procedure TServerConsole.StopServer(const AServer: TIdHTTPWebBrokerBridge);
begin
  if AServer.Active then
  begin
    Writeln(sStoppingServer);
    TerminateThreads;
    AServer.Active := False;
    AServer.Bindings.Clear;
    Writeln(sServerStopped);
  end
  else
    Writeln(sServerNotRunning);
  Write(cArrow);
end;

procedure TServerConsole.WriteCommands;
begin
  Writeln(sCommands);
  Write(cArrow);
end;

procedure TServerConsole.WriteStatus(const AServer: TIdHTTPWebBrokerBridge);
begin
  Writeln(sIndyVersion + AServer.SessionList.Version);
  Writeln(sActive + AServer.Active.ToString(TUseBoolStrs.True));
  Writeln(sPort + AServer.DefaultPort.ToString);
  Writeln(sSessionID + AServer.SessionIDCookieName);
  Write(cArrow);
end;

procedure TesteDBconnection();
var
  ConnectionTeste: TConnection;
begin
  ConnectionTeste := TConnection.Create;
  try
    try

      ConnectionTeste.Query.SQL.Add('select GETDATE()');
      ConnectionTeste.Query.Open();
      Writeln('***************************************************');
      Writeln('***********Sucess to atach database****************');
      Writeln('Server database host :  ' + ConnectionTeste.DB.Params.Values
        ['Server=']);
      Writeln('Server database time :  ' + ConnectionTeste.Query.Fields[0]
        .AsString);
      Writeln('***************************************************');
      ConnectionTeste.Query.Close;
    except
      on e: Exception do
        Writeln('Server data ERROR ' + e.Message);

    end;
  finally
    FreeAndNil(ConnectionTeste)
  end;

end;

procedure TServerConsole.RunServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
  LResponse: string;
  Initialized: boolean;
  SSLHandler: TIdServerIOHandlerSSLOpenSSL;
  LSSLHelper: TSSLHelper;
  LGetSSLPassword: TGetSSLPassword;
  CertFile: string;
  LKeyFile: string;
begin

  LServer := TIdHTTPWebBrokerBridge.Create(nil);
{$IFDEF SSL}
  SSLHandler := TIdServerIOHandlerSSLOpenSSL.Create(LServer);
  IdSSLOpenSSLHeaders.IdOpenSSLSetLibPath
    (ExtractFilePath(GetModuleName(HInstance)));
  CertFile := ExtractFilePath(GetModuleName(HInstance)) + 'ssl' + PathDelim +
    'cert1.pem';
  LKeyFile := ExtractFilePath(GetModuleName(HInstance)) + 'ssl' + PathDelim +
    'privkey1.pem';
  SSLHandler.SSLOptions.RootCertFile := 'ssl' + PathDelim + 'fullchain1.pem';
  SSLHandler.SSLOptions.CertFile := CertFile;
  SSLHandler.SSLOptions.KeyFile := LKeyFile;
  SSLHandler.SSLOptions.VerifyMode := [sslvrfClientOnce];
  SSLHandler.SSLOptions.CipherList :=

    'ECDHE-ECDSA-AES128-GCM-SHA256:' + 'ECDHE-RSA-AES128-GCM-SHA256:' +
    'ECDHE-RSA-AES256-GCM-SHA384:' + 'ECDHE-ECDSA-AES256-GCM-SHA384:' +
    'DHE-RSA-AES128-GCM-SHA256:' + 'ECDHE-RSA-AES128-SHA256:' +
    'DHE-RSA-AES128-SHA256:' + 'ECDHE-RSA-AES256-SHA384:' +
    'DHE-RSA-AES256-SHA384:' + 'ECDHE-RSA-AES256-SHA256:' +
    'DHE-RSA-AES256-SHA256:' + 'HIGH:' + '!aNULL:' + '!eNULL:' + '!EXPORT:' +
    '!DES:' + '!RC4:' + '!MD5:' + '!PSK:' + '!SRP:' + '!CAMELLIA';

  // sem isto da pau no chipers
  SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2,
    sslvSSLv3];
  LServer.IOHandler := SSLHandler;

  LSSLHelper := TSSLHelper.Create;
  SSLHandler.OnGetPassword := LGetSSLPassword.OnGetSSLPassword;

  TIdSSLIOHandlerSocketOpenSSL(SSLHandler.MakeClientIOHandler())
    .PassThrough := False;
  LServer.OnConnect := IdHTTPServerConnect;
  LServer.OnCommandOther := IdHTTPServer1CommandOther;

  LServer.OnQuerySSLPort := LSSLHelper.QuerySSLPort;
  LServer.OnException := ExceptionServer;
{$ENDIF}
  LServer.OnException := ExceptionServer;

  try
    try
      Writeln('Starting HttpsServer ..');
      LServer.DefaultPort := APort;
      LServer.OnParseAuthentication := DoParseAuthentication;

      TServerConfig.GetInstance;
      sleep(1000);
      // Wait lib Lazy load
      Writeln('Testing Database acess ..');
      TesteDBconnection();

      With TScheduleMDE.Create(True) do
      begin
        Writeln('[INCIANDO IMPORTAÇAO AUTOMATICA/MANIFESTOS ]');
        //gravaLog('[INCIANDO IMPORTAÇAO AUTOMATICA/MANIFESTOS ]', '');
        resume;

      end;

      with TWKSwagerAPI.Create do
      begin
        Writeln('Config Swagger lib ..');
        MakeReposioty;
        Writeln('Config Swagger lib update, Swager.json ');
        free;
      end;

    except
      on e: Exception do
        Writeln('Exception on start server ' + e.Message);
    end;
    LServer.AutoStartSession := False;
    LServer.SessionIDCookieName := 'WKServerCooks';
    LServer.KeepAlive := False;
    StartServer(LServer);
    Writeln('HttpServer online !');
    while True do
    begin

      try
        Readln(LResponse);
        sleep(100);
        if LResponse <> '' then
        begin
          LResponse := LowerCase(LResponse);
          if LResponse.StartsWith(cCommandSetPort) then
            SetPort(LServer, LResponse)
          else if sametext(LResponse, cCommandStart) then
            StartServer(LServer)
          else if sametext(LResponse, cCommandStatus) then
            WriteStatus(LServer)
          else if sametext(LResponse, cCommandStop) then
            StopServer(LServer)
          else if sametext(LResponse, cCommandHelp) then
            WriteCommands
          else if sametext(LResponse, cCommandExit) then
            if LServer.Active then
            begin
              StopServer(LServer);
              break
            end
            else
              break
          else
          begin
            Writeln(LResponse + ' is invalid command');
            Write(cArrow);
          end;
        end;
      except
        on e: Exception do
          Writeln('Fatal Exception on run server ' + e.Message);
      end;
    end;
    Writeln('by..by');
    TerminateThreads();
  finally
    LServer.free;
  end;
end;

{ TSSLHelper }

procedure TSSLHelper.QuerySSLPort(APort: Word; var VUseSSL: boolean);
begin
  VUseSSL := True;
end;

{ TGetSSLPassword }

procedure TGetSSLPassword.OnGetSSLPassword(var APassword: string);
begin
  APassword := '';
end;

initialization

globalServer := TServerConsole.Create;

end.
