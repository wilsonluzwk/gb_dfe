unit dfe.schedule.MDE;
{$TYPEINFO OFF}

interface

uses

  System.SysUtils,
  System.Classes,
  dfe.services.consultadestinadas,
  dateutils,
  inifiles,
  variants,
  dfe.dao.dfeManifestos,
  dfe.dao.empresa,
  dfe.model.empresa,
  Data.DB,
  dfe.services.ciencia_operacao,
  math,
  dfe.services.cte,
  dfe.model.mensagens,
  System.IOUtils,
  dfe.services.websocket,
  dfe.lib.util,
  Datasnap.DBClient,
  Datasnap.Provider,
  SyncObjs;

type

  TScheduleMDE = Class(TThread)
  private
    Fdao: TDaoManifestos;
    FEmpresa: TEmpresa;
    FdaoEmpresa: TDaoEmpresa;
    Fempresas: TEmpresas;
    Ftimework: Integer;
    FtimeCiencia: Integer;
    Fetapa: Integer;
    FlastNSU: Double;
    FNsuSequencia: Double;
    FcnpjLoja: string;
    FNSUdata: TdateTime;
    FultimaExecucao: TdateTime;
    Fdownloads: Integer;
    FcodLoja: Integer;
    procedure LoadParameter;
    Procedure Executar;
    procedure Execute; override;
    procedure ProcessaNsu;
    procedure ProcessaCiencia();
    procedure ImportacaoAutomatica();
    procedure SetCnpjLoja;
    procedure processarCte();
  public

    Terminar: Boolean;
    constructor create(suspensa: Boolean);
  published

    property NSUSequencia: Double read FlastNSU write FlastNSU;
    property NSUdata: TdateTime read FNSUdata write FNSUdata;
    property ultimaExecucao: TdateTime read FultimaExecucao
      write FultimaExecucao;
    property downloads: Integer read Fdownloads write Fdownloads;

  end;

var
  CountExecs: Integer;
  ccCritical: TCriticalSection;
  scheduleManifestos: TScheduleMDE;

implementation

uses
  dfe.services.importar_xml;
{ TScheduleMDE }

procedure TScheduleMDE.Execute;
begin
  inherited;
  Executar();
end;

procedure TScheduleMDE.ImportacaoAutomatica;
var
  lst: TStringList;
  I: Integer;
  FdirXml: string;
  FdirXMLimportado: string;
  FdaoEmpresa: TDaoEmpresa;
begin
  FdirXml := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
    inttostr(FcodLoja) + '\Xml\' + formatdatetime('YYYYMM', date) + '\Down\';
  FdirXMLimportado := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
    inttostr(FcodLoja) + '\ArquivosImportados\';
  ForceDirectories(FdirXMLimportado);
  ForceDirectories(FdirXml);

  SetCnpjLoja;
  lst := TStringList.create;
  try
    getFiles(lst, '*.xml', FdirXml);
    for I := 0 to lst.Count - 1 do
    begin
      try
        with TGbImportadorClass.create(lst[I], inttostr(FcodLoja)) do
        begin
          Importar;
          Free;
        end;
      except
        on e: exception do
        begin

          gravalog('[ImportacaoAutomatica] 106 Loja ' + inttostr(FcodLoja) +
            ' ERRO  :' + e.Message, FcnpjLoja);
        end;

      end;
      try
        if FileExists(FdirXMLimportado + ExtractFileName(lst[I])) then
          TFile.Delete(FdirXMLimportado + ExtractFileName(lst[I]));

        TFile.Move(lst[I], FdirXMLimportado + ExtractFileName(lst[I]));
      except
        TFile.Delete(lst[I]);
      end;
    end;

  finally
    FreeAndNil(lst);

  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TScheduleMDE.LoadParameter;
begin
end;

constructor TScheduleMDE.create(suspensa: Boolean);
begin

  inherited;
  scheduleManifestos := self;
end;

{ ------------------------------------------------------------------------------ }
procedure TScheduleMDE.ProcessaNsu;
var
  FconsultaNsu: TGbConsultarDestinadasClass;
begin
  Fdao.getdadosNSU(FNsuSequencia, FNSUdata, FcodLoja);
  if FNsuSequencia > FlastNSU then
    FlastNSU := FNsuSequencia;

  if MinutesBetween(now, FNSUdata) >= 80 then
  begin
    // gravalog('[ScheduleMDE] Inciando consulta manifestos  Loja ' +
    // inttostr(FcodLoja));
    // ALTERADO PARA CHAMAR UMA APOS A OUTRA
    FconsultaNsu := TGbConsultarDestinadasClass.create(True);

    FconsultaNsu.loja := FcodLoja;
    FconsultaNsu.FreeOnTerminate := false;
    FconsultaNsu.Executar(FcodLoja);
    FreeAndNil(FconsultaNsu);

  end;
end;

procedure TScheduleMDE.processarCte;
var
  Lservices: TThreadCte;
begin
  Lservices := TThreadCte.create;
  try

    Lservices.empresa := FEmpresa;
    Lservices.ConsultarCte;
  finally
    FreeAndNil(Lservices);
  end;
end;

procedure TScheduleMDE.SetCnpjLoja;
var
  FdaoEmpresa: TDaoEmpresa;

begin
  try
    FdaoEmpresa := TDaoEmpresa.create;
    FcnpjLoja := '';
    FcnpjLoja := FdaoEmpresa.getempresaCod(inttostr(FcodLoja)).cnpj;
  finally
    FreeAndNil(FdaoEmpresa);
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TScheduleMDE.ProcessaCiencia();
var
  Fciencia: TGbCienciaOperacaoClass;
begin
  if FtimeCiencia <= 0 then
  begin
    // Manifestar as notas e tentar baixar
    try
      Fciencia := TGbCienciaOperacaoClass.create(True);
      Fciencia.loja := FcodLoja;
      // gravalog('[CienciaAutomatica]Loja ' + inttostr(FcodLoja) +
      // ' Verificando manifestos pendentes');
      Fciencia.executarCiencia(FcodLoja);
      Fciencia.Free;

    except
      on e: exception do
      begin
        SetCnpjLoja();
        gravalog('[CienciaAutomatica] 157 Loja ' + inttostr(FcodLoja) +
          ' ERRO  :' + e.Message, FcnpjLoja);
      end;

    end;

  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TScheduleMDE.Executar;
var
  I: Integer;
begin
  Ftimework := 1;
  LoadParameter;
  FlastNSU := 0;
  FtimeCiencia := 0;
  FcodLoja := -1;
  gravalog('[ScheduleMDE] Serviço MDE iniciado', '');
  while not Terminar do
  begin
    Fetapa := 0;
    sleep(10);
    if Ftimework <= 0 then
    begin
      try
        Fdao := TDaoManifestos.create;
        FdaoEmpresa := TDaoEmpresa.create;
        Fempresas := FdaoEmpresa.listEmpresas(nil);
        try
          FultimaExecucao := now;
          sendMessageServer('[ScheduleMDE] Inciando consulta manifestos ' +
            inttostr(Fempresas.Count) + '  Lojas', '');
          for I := 0 to Fempresas.Count - 1 do
          begin
            try
              FEmpresa := Fempresas[I];
              FcodLoja := strtoint(Fempresas[I].codigo_loja);

              SetCnpjLoja();
              if Fempresas[I].DANFE_MdeAutomatico <> 'S' then
              begin
                gravalog('[ScheduleMDE] Loja ' + inttostr(FcodLoja) +
                  ' Desativada para MDE nos parametros', FcnpjLoja);
                Continue;
              end;
              if Fempresas[I].certificadoPfx = '' then
              begin
                gravalog('[ScheduleMDE] Loja ' + inttostr(FcodLoja) +
                  ' Sem certificado definido', FcnpjLoja);
                Continue
              end;
              try
                ProcessaNsu;
              except
                on e: exception do
                  gravalog('[ScheduleMDE]proceso nsu  ' + e.Message, FcnpjLoja);
              End;
              try
                ProcessaCiencia;
              except
                on e: exception do
                  gravalog('[ScheduleMDE]processar ciencia  ' + e.Message,
                    FcnpjLoja);
              End;
              try
                ImportacaoAutomatica();
              except
                on e: exception do
                  gravalog('[ScheduleMDE]processar importacao automatica  ' +
                    e.Message, FcnpjLoja);
              End;
              try
                processarCte();
              except
              end;

            except
              on e: exception do
                gravalog('[ScheduleMDE]148 ' + e.Message, FcnpjLoja);
            End;
          end;
          FtimeCiencia := 4; // 4  * 5 = 20 minutos

        Finally
          Ftimework := (300); // 300 *1000 milesecundos  = 5 minutos de espera
          FreeAndNil(Fdao);
          FreeAndNil(FdaoEmpresa);
          FreeAndNil(Fempresas);
        End;
      except
        on e: exception do
          gravalog('[ScheduleMDE]161 ' + e.Message, '');
      end;
    end;
    sleep(1000); // pausar a execução em 1 segundo
    dec(Ftimework);
    dec(FtimeCiencia);
  end;
end;

{ ------------------------------------------------------------------------------ }

initialization

ccCritical := TCriticalSection.create;

finalization

FreeAndNil(ccCritical);

end.
