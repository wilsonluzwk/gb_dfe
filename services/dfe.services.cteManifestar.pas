unit dfe.services.cteManifestar;

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

  pcnConversao,
  pcnConversaoNFe,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  ACBrCTe,
  pcteConversaoCTe,
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
  TServicemanifestoCte = class
  private
    Facbr: TACBrCTe;
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

function TServicemanifestoCte.gerarDanfeBase64: string;
var
  path: string;
  outfile: TFileStream;
  strfile: TStringStream;
begin
  try
    Fdanfe := TACBrNFeDANFeRL.create(Nil);

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

      FreeAndNil(Fdanfe);
    end;
  except
    on e: exception do
      gravalog(e.Message, '');

  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TServicemanifestoCte.manifesto();
var

  dao: TDaomanifesto;
begin
  FcStat := 5001;
  try
    Facbr.EventoCTe.Evento.Clear;

    with Facbr.EventoCTe.Evento.Add do
    begin

      infEvento.chCTe := Fmanifesto.chave;
      infEvento.cnpj := Fmanifesto.cnpj;
      infEvento.dhEvento := Fmanifesto.dataHora;
      infEvento.nSeqEvento := Fmanifesto.sequencia;

      infEvento.detEvento.nProt := Fmanifesto.protocolo;

      case Fmanifesto.tipo of
        0:
          begin
            infEvento.tpEvento := teCancelamento;

            infEvento.detEvento.xJust := Fmanifesto.justificativa;
          end;
        1:
          infEvento.tpEvento := teComprEntrega;

        2:
          begin
            infEvento.tpEvento := tePrestDesacordo;
            infEvento.detEvento.xOBS := '';
          end;
        3:
          begin

            infEvento.tpEvento := teInsucessoEntregaCTe;
            infEvento.detEvento.nTentativa := 1;
            infEvento.detEvento.nProt := Fmanifesto.protocolo;
            infEvento.detEvento.dhTentativaEntrega := now;
            // (tmNaoEncontrado, tmRecusa, tmInexistente, tmOutro);
            infEvento.detEvento.tpMotivo := tmNaoEncontrado;
            infEvento.detEvento.xJustMotivo := Fmanifesto.xmotivo;
            infEvento.detEvento.hashTentativaEntrega :=
              'f2085dc85d16471c64d2062a4e3aa912';
            infEvento.detEvento.dhHashTentativaEntrega := now;
          end;
      end;
      gravalog('[MANIFESTACAO]iniciando manifestao do evento chave:  ' +
        Fmanifesto.chave + '  tipo :' + IntToStr(Fmanifesto.tipo),
        Fmanifesto.cnpj);

    end;
    try
      Facbr.EnviarEvento(1);
      FcStat := Facbr.WebServices.EnvEvento.cStat;
      Fmotivo := Facbr.WebServices.EnvEvento.xmotivo;

      if Assigned(Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0])
      then
      begin
        Fmotivo := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xmotivo;
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

    gravalog('[MANIFESTACAO cte ]Gravando manifestao do evento chave:  ' +
      Fmanifesto.chave + '  tipo :' + IntToStr(Fmanifesto.tipo) + '  cstat: ' +
      IntToStr(Facbr.WebServices.EnvEvento.cStat), Fmanifesto.cnpj);
    Fmanifesto.cStat := FcStat;
    Fmanifesto.xmotivo := Fmotivo;

    dao := TDaomanifesto.create;
    try
      dao.gravarmanifesto(Fmanifesto);
    finally
      FreeAndNil(dao);
    end;
  end;

end;

{ ----------------------------------------------------------------------------- }
constructor TServicemanifestoCte.create(classmanifesto: Tmanifesto);
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
      Facbr := TACBrCTe.create(Nil);
      TAcbrConfig.setAcbrObjCte(Facbr, Fempresa);
      manifesto;
      DeleteInfoDashBoard;
    except
      on e: exception do
      begin
        gravalog('[Erro ao gerar manifesto cte ' + e.Message,
          classmanifesto.cnpj);
        Fmanifesto.cStat := 5001;
        Fmanifesto.xmotivo := e.Message;
      end;
    end;
  finally
    FreeAndNil(dao);
  end;

end;

destructor TServicemanifestoCte.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
end;

end.
