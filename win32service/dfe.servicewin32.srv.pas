unit dfe.servicewin32.srv;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  dfe.httpserver.base,
  dfe.lib.util,
  dfe.httpserver,
  Vcl.SvcMgr,
  dfe.dao.base,
  dfe.services.websocket,
  dfe.schedule.MDE,
  ShlObj,
  Vcl.ExtCtrls

    ;

type
  TGB_DFE_SERVICE = class(TService)
    tmstart: TTimer;
    procedure tmstartTimer(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;

    { Public declarations }
  end;

var
  FidlistenNfe: cardinal;
  GB_DFE_SERVICE: TGB_DFE_SERVICE;

procedure AutoRestart();

implementation

uses
  dfe.schedule.manutencao, WK.Server.Config;
{$R *.dfm}

{ ----------------------------------------------------------------------------- }
procedure GlobalLog(Msg: string; akind: Integer = 1);

var
  strSaida: string;

  procedure registrarLogEmArquivo;
  var
    p: string;
    f: TextFile;
  begin
    p := ExtractFilePath(ParamStr(0)) + 'log\global\';
    ForceDirectories(p);
    p := p + FormatDateTime('yyyymmdd', now) + '_' +
      ChangeFileExt(ExtractFileName(ParamStr(0)), '') + '.log';
    AssignFile(f, p);
    if not FileExists(p) then
      Rewrite(f)
    else
      Append(f);
    Writeln(f, strSaida);
    Closefile(f);
  end;

begin
  try
    strSaida := FormatDateTime('hh:nn:ss.zzz', now) + Msg;
    OutputDebugString(pchar(datetimetostr(now) + ' - ' + Msg));

  except
  end;
  try
    registrarLogEmArquivo;
  except
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  GB_DFE_SERVICE.Controller(CtrlCode);
end;

{ ----------------------------------------------------------------------------- }
function TGB_DFE_SERVICE.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

{ ----------------------------------------------------------------------------- }
procedure TGB_DFE_SERVICE.ServiceCreate(Sender: TObject);
begin
  tmstart.Enabled := true;
end;

procedure listenNfe();
begin
  try
    TDaoBase.SetPoolDb();
    TServerConfig.GetInstance;
    THttpHandlerBase.create;
    With TScheduleMDE.create(true) do
    begin
      resume;
    end;
    With TScheduleManutencao.create(true) do
    begin
      resume;
    end;

    GlobalLog('[ServiceWin32] Inicialização  GBDFE concluida');
  except
    on E: Exception do
      GlobalLog('[ServiceWin32] 106 erro listen ' + E.Message);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure AutoRestart();
var
  LfileName: string;
  lStartUpInfo: TStartUpInfo;
  lProcesso: TProcessInformation;
  Lcomando: string;
begin
  LfileName := ExtractFilePath(GetModuleName(HInstance)) +
    'ManutencaoService.bat';
  GlobalLog('[ServiceWin32] Realizando manutencao diaria do servico ');

  /// WinExec(PAnsiChar('taskkill /IM GB_DFE_ServiceWin32.exe /F'), 0);
  with TStringList.create do
  begin
    add('net stop GB_DFE_SERVICE');
    add('ping 127.0.0.1 -n 10 > nul');
    add('taskkill /IM GB_DFE_ServiceWin32.exe /F');
    add('ping 127.0.0.1 -n 5 > nul');
    add('net start GB_DFE_SERVICE');
    savetofile(LfileName);
    free;
  end;
  Lcomando := 'cmd.exe /c ' + '"' + LfileName + '"';
  GlobalLog('[ServiceWin32]   -- Reiniciando em alguns segundos... ');
  WinExec(Pansichar(AnsiString(Lcomando)), 0);
end;
{ ----------------------------------------------------------------------------- }
procedure SetWebsocketServer();
begin
  GlobalLog('[ServiceWin32]Iniciando websocket na porta 30086 ');
  try
    FGbDFEWebSocket := TGbDFEWebSocket.create;
  except
    on E: Exception do
      GlobalLog('[ServiceWin32] 173 ' + E.Message);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TGB_DFE_SERVICE.tmstartTimer(Sender: TObject);
begin
  tmstart.Enabled := false;
  try
    SetWebsocketServer();
    BeginThread(Nil, 0, @listenNfe, nil, 0, FidlistenNfe);
  except
    on E: Exception do
      GlobalLog('[ServiceWin32] 187 ' + E.Message);
  end;
end;

{ ----------------------------------------------------------------------------- }
end.
