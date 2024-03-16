unit dfe.schedule.manifestos;

interface

uses

  System.SysUtils,
  System.Classes,
  dateutils,
  inifiles,
  dfe.services.consultadestinadas,
  variants,
  dfe.dao.dfeManifestos,
  Data.DB,
  dfe.services.ciencia_operacao,
  math,
  dfe.lib.util,
  Datasnap.DBClient,
  Datasnap.Provider,
  SyncObjs;

type

  TManifestoAutomatico = Class(TThread)
  private
    Fdao: TDaoManifestos;
    Ftimework: Integer;
    Fetapa: Integer;
    FNsuSequencia: Double;
    FNSUdata: TdateTime;
    FcodLoja: Integer;
    procedure LoadParameter;
    Procedure Executar;
    procedure Execute; override;

  public
    Terminar: Boolean;

  published
  end;

var
  CountExecs: Integer;
  ccCritical: TCriticalSection;

implementation

{ TManifestoAutomatico }

procedure TManifestoAutomatico.Execute;
begin
  inherited;
  Executar();
end;

{ ------------------------------------------------------------------------------ }
procedure TManifestoAutomatico.LoadParameter;
begin
end;

procedure TManifestoAutomatico.Executar;
begin
  try
    Ftimework := 0;
    LoadParameter;
    while not Terminar do
    begin
      Fetapa := 0;
      sleep(10);
      if Ftimework <= 0 then
      begin
        Fdao := TDaoManifestos.create;
        Try
          try
            FcodLoja := 1;
            Fdao.getdadosNSU(FNsuSequencia, FNSUdata, FcodLoja);

            if MinutesBetween(now, FNSUdata) >= 80 then
            begin
              with TGbConsultarDestinadasClass.create(True) do
              begin
                loja := FcodLoja;
                FreeOnTerminate := True;
                resume;
              end;
            end;

          except
            on e: exception do
              gravaLog('[MANIFESTO_AUTO ]' + e.Message,'');
          End;
          Ftimework := (300);
        Finally
           freeAndNil(Fdao);
        End;
        end; // END WORK
        sleep(1000);
        dec(Ftimework);
      end;

    finally

    end;
  end;
  { ------------------------------------------------------------------------------ }

initialization

ccCritical := TCriticalSection.create;

finalization

FreeAndNil(ccCritical);

end.
