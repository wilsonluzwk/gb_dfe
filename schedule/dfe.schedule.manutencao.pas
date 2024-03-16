unit dfe.schedule.manutencao;
{$TYPEINFO OFF}

interface

uses

  System.SysUtils,
  System.Classes,
  dateutils,
  inifiles,
  variants,
  Data.DB,
  math,
  dfe.model.mensagens,
  System.IOUtils,
  dfe.services.websocket,
  dfe.lib.util,
  Datasnap.DBClient,
  Datasnap.Provider,
  SyncObjs;

type

  TScheduleManutencao = Class(TThread)
  private

    Ftimework: Integer;
    FtimeCiencia: Integer;
    Fetapa: Integer;

    FultimaExecucao: TdateTime;

    procedure LoadParameter;
    Procedure Executar;
    procedure Execute; override;

  public

    Terminar: Boolean;
    constructor create(suspensa: Boolean);
  published

  end;

var
  CountExecs: Integer;
  ccCritical: TCriticalSection;
  scheduleManifestos: TScheduleManutencao;

implementation

uses
  dfe.servicewin32.srv;
{ TScheduleManutencao }

procedure TScheduleManutencao.Execute;
begin
  inherited;
  Executar();
end;

{ ------------------------------------------------------------------------------ }
procedure TScheduleManutencao.LoadParameter;
begin
end;

constructor TScheduleManutencao.create(suspensa: Boolean);
begin

  inherited;
  scheduleManifestos := self;
end;

{ ------------------------------------------------------------------------------ }

procedure TScheduleManutencao.Executar;
var
  I: Integer;
  FileManut: string;
begin
  Ftimework := 1;
  LoadParameter;
  gravalog('[ScheduleManutecao] Iniciando', '');
  while not Terminar do
  begin
    Fetapa := 600;
    sleep(10);
    if Ftimework <= 0 then
    begin
      try
        try
          FileManut := ExtractFilePath(GetModuleName(HInstance)) +'log\global\'+
            FormatDateTime('ddMMyyyy', date) + '.man';
          FultimaExecucao := now;
          if (FormatDateTime('HH', time) = '00') or
            (FormatDateTime('HH', time) = '0') then
          begin
            if not FileExists(FileManut) then
            begin
              with TStringList.create do
              begin
                text := 'Restart sucessful ' + DateTimeToStr(now);
                SaveToFile(fileManut);
              end;
              AutoRestart();
            end;
          end;
          Ftimework := (600); // 6000 *1000 milesecundos  = 5 minutos de espera
        Finally

        End;
      except
        on e: exception do
          gravalog('[ScheduleManutecao]105 ' + e.Message, '');

      end;
    end;
    sleep(1000); // pausar a execução em 1 segundo
    dec(Ftimework);

  end;
end;

{ ------------------------------------------------------------------------------ }

initialization

ccCritical := TCriticalSection.create;

finalization

FreeAndNil(ccCritical);

end.
