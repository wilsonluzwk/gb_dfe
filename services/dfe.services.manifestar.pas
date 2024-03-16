unit dfe.services.manifestar;

interface

uses
  dfe.lib.constants,
  windows,
  pcnEventoNFe,
  dateUtils,
  classes,
  SysUtils,
  inifiles,
  math,
  XSBuiltIns,
  Variants,
  activex,
  ACBrNFe,
  ACBrEAD,
  pcnConversao,
  pcnConversaoNFe,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,
  ACBrDFeUtil,
  XMLIntf,
  syncobjs,
  dfe.lib.util,
  dfe.model.inutilizacaoRequest,
  dfe.model.empresa,
  dfe.lib.acbr.config,
  dfe.dao.manifesto,
  dfe.dao.empresa,
  System.NetEncoding,
  dfe.model.manifesto;

type
  TServicemanifesto = class
  private
    Facbr: TACBrNFe;
    FcStat: integer;
    Fempresa: TEmpresa;
    Fmanifesto: Tmanifesto;
    Fmotivo: string;
    FdanfeBase64: string;
    Fdanfe: TACBrNFeDANFeRL;
    function gerarDanfeBase64: string;
  public
    constructor create(classmanifesto: Tmanifesto);
    destructor destroy; override;
    procedure manifesto;
  published
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;

  end;

implementation

function TServicemanifesto.gerarDanfeBase64: string;
var
  path: string;
  outfile: TFileStream;
  strfile: TStringStream;
begin
  try
    Fdanfe := TACBrNFeDANFeRL.create(Nil);
    Facbr.DANFE := Fdanfe;
    try
      path := ExtractFilePath(GetModuleName(HInstance)) + 'reports\';
      ForceDirectories(path);
      Fdanfe.MostraPreview := false;
      if FileExists(ExtractFilePath(GetModuleName(HInstance)) + 'logo\logo.bmp')
      then

        Fdanfe.Logo := ExtractFilePath(GetModuleName(HInstance)) +
          'logo\logo.bmp';
      Fdanfe.MostraStatus := false;
      Fdanfe.MostraSetup := false;
      Fdanfe.PathPDF := path;
      Fdanfe.Sistema := _ctEmpressaDanfe;
      Fdanfe.Site := _ctSiteDanfe;
      Facbr.ImprimirEventoPDF;

      try
        strfile := TStringStream.create;
        outfile := TFileStream.create(Fdanfe.ArquivoPDF, fmOpenRead);
        TNetEncoding.base64.Encode(outfile, strfile);
        result := strfile.DataString;
      finally
        FreeAndNil(outfile);
        FreeAndNil(strfile);
      end;
    finally
      Facbr.DANFE := nil;
      FreeAndNil(Fdanfe);
    end;
  except
    on e: exception do
      gravalog(e.Message, '');

  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TServicemanifesto.manifesto();
var

  dao: TDaomanifesto;
begin
  FcStat := 5001;
  try
    Facbr.EventoNFe.Evento.Clear;

    with Facbr.EventoNFe.Evento.Add do
    begin
      // GAMBIARA DA SEFAZ
      infEvento.cOrgao := 91;
      infEvento.chNFe := Fmanifesto.chave;
      infEvento.cnpj := Fmanifesto.cnpj;
      infEvento.dhEvento := Fmanifesto.dataHora;
      infEvento.nSeqEvento := Fmanifesto.sequencia;
      infEvento.detEvento.xJust := Fmanifesto.justificativa;

      case Fmanifesto.tipo of
        0:
          infEvento.tpEvento := teManifDestConfirmacao;
        1:
          infEvento.tpEvento := teManifDestDesconhecimento;
        2:
          infEvento.tpEvento := teManifDestOperNaoRealizada;
      end;
      gravalog('[MANIFESTACAO]iniciando manifestao do evento chave:  ' +
        Fmanifesto.chave + '  tipo :' + IntToStr(Fmanifesto.tipo),
        Fmanifesto.cnpj);

    end;
    try
      Facbr.EnviarEvento(1);
      FcStat := Facbr.WebServices.EnvEvento.cStat;
      Fmotivo := Facbr.WebServices.EnvEvento.xMotivo;

      if Assigned(Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0])
      then
      begin
        Fmotivo := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xMotivo;
        FcStat := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.cStat;

        Fmanifesto.protocolo := Facbr.WebServices.EnvEvento.EventoRetorno.
          retEvento.Items[0].RetInfEvento.nProt;

        Fmanifesto.xmlEvento := Facbr.WebServices.EnvEvento.EventoRetorno.
          retEvento.Items[0].RetInfEvento.XML;
        if Fmanifesto.protocolo <> '' then
          Fmanifesto.DANFE := gerarDanfeBase64;

      end;
    except
      on e: exception do
      begin
        Fmotivo := e.Message;
      end;
    end;
  finally

    gravalog('[MANIFESTACAO]Gravando manifestao do evento chave:  ' +
      Fmanifesto.chave + '  tipo :' + IntToStr(Fmanifesto.tipo) + '  cstat: ' +
      IntToStr(Facbr.WebServices.EnvEvento.cStat), Fmanifesto.cnpj);
    Fmanifesto.cStat := FcStat;
    Fmanifesto.xMotivo := Fmotivo;

    dao := TDaomanifesto.create;
    try
      dao.gravarmanifesto(Fmanifesto);
    finally
      FreeAndNil(dao);
    end;
  end;

end;

{ ----------------------------------------------------------------------------- }
constructor TServicemanifesto.create(classmanifesto: Tmanifesto);
var
  dao: TdaoEmpresa;
begin
  dao := TdaoEmpresa.create;
  try
    try
      Fmanifesto := classmanifesto;

      Fempresa := dao.getEmpresaCnpj(classmanifesto.cnpj);

      if Fempresa.cnpj = '' then
        raise exception.create
          ('Nehuma empresa  cadastrada com o cnpj informado ' +
          classmanifesto.cnpj);
      Facbr := TACBrNFe.create(Nil);
      TAcbrConfig.SetAcbrObj(Facbr, Fempresa);
      manifesto;
      DeleteInfoDashBoard;
    except
      on e: exception do
      begin
        gravalog('[Erro ao gerar manifesto ' + e.Message, classmanifesto.cnpj);
        Fmanifesto.cStat := 5001;
        Fmanifesto.xMotivo := e.Message;
      end;
    end;
  finally
    FreeAndNil(dao);
  end;

end;

destructor TServicemanifesto.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
end;

end.
