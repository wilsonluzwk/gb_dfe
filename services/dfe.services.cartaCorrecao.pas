unit dfe.services.cartaCorrecao;

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
  dfe.dao.cartaCorrecao,
  dfe.dao.empresa,
  System.NetEncoding,
  dfe.model.nfe,
  dfe.services.email,
  dfe.model.cartaCorrecao;

type
  TServicecartaCorrecao = class
  private

    FpathXml: string;
    Facbr: TACBrNFe;

    FcStat: integer;
    Fempresa: TEmpresa;
    FcartaCorrecao: TcartaCorrecao;
    Fmotivo: string;
    FdanfeBase64: string;
    Fdanfe: TACBrNFeDANFeRL;
    function gerarDanfeBase64: string;
  public
    constructor create(classcartaCorrecao: TcartaCorrecao);
    destructor destroy;
    procedure cartaCorrecao;
  published
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;

  end;

implementation

function TServicecartaCorrecao.gerarDanfeBase64: string;
var
  path: string;
  outfile: TFileStream;
  strfile: TStringStream;
begin

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
    Fdanfe.Sistema := _ctEmpressaDanfe;
    Fdanfe.Site := _ctSiteDanfe;
    Fdanfe.MostraSetup := false;
    Fdanfe.PathPDF := path;
    Facbr.ImprimirEventoPDF;
    FpathXml := ExtractFilePath(GetModuleName(HInstance)) + 'eventos\';
    ForceDirectories(FpathXml);
    FpathXml := FpathXml + FcartaCorrecao.chave + '-' +
      inttostr(FcartaCorrecao.sequencia) + '-procEventoNFe.xml';
    with TStringList.create do
    begin
      text := FcartaCorrecao.xmlEvento;
      SaveToFile(FpathXml);
      free;
    end;
    // BUG TOSCO DO FORTES REPORT TEM RECAREGAR PARA APARECER O XTERMOUSO
    Facbr.EventoNFe.Evento.Clear;
    Facbr.EventoNFe.LerXML(FpathXml);
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

  except
    on e: exception do
      gravalog(e.Message, '');
  end;

end;

{ ----------------------------------------------------------------------------- }
procedure TServicecartaCorrecao.cartaCorrecao();
var

  dao: TDaocartaCorrecao;
begin
  FcStat := 5001;
  try

    Facbr.EventoNFe.Evento.Clear;
    with Facbr.EventoNFe.Evento.Add do
    begin
      infEvento.cOrgao := StrToIntDef(copy(FcartaCorrecao.chave, 1, 2), 0);
      infEvento.chNFe := FcartaCorrecao.chave;
      infEvento.cnpj := FcartaCorrecao.cnpj;
      infEvento.dhEvento := now;

      infEvento.nSeqEvento := FcartaCorrecao.sequencia;
      infEvento.detEvento.xCorrecao := FcartaCorrecao.xCorrecao;
      infEvento.tpEvento := teCCe;
      infEvento.chNFe := FcartaCorrecao.chave;

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

        FcartaCorrecao.protocoloCce :=
          Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.nProt;

        FcartaCorrecao.xmlEvento := Facbr.WebServices.EnvEvento.EventoRetorno.
          retEvento.Items[0].RetInfEvento.XML;
        if FcartaCorrecao.protocoloCce <> '' then
        begin
          FcartaCorrecao.DANFE := gerarDanfeBase64;
          FcartaCorrecao.danfeBase64 := FcartaCorrecao.DANFE;
          if FcartaCorrecao.emailDestinatario <> '' then
          begin
            with TenvioEmail.create(true) do
            begin
              tipoEmail := 'CCE';
              nota.chave := FcartaCorrecao.chave;
              destinatario := FcartaCorrecao.emailDestinatario;
              nota.protocolo := FcartaCorrecao.protocoloCce;
              cnpj := FcartaCorrecao.cnpj;
              anexos.Add(Fdanfe.ArquivoPDF);
              anexos.Add(FpathXml);
              FreeOnTerminate := true;
              resume;
            end;

          end
          else
            gravalog(' destinatario não informado par envio de carta de correçao ',
              FcartaCorrecao.cnpj);

        end;
      end;
    except
      on e: exception do
      begin
        Fmotivo := e.Message;
        gravalog('[Carta correcao - Error ' + e.Message, FcartaCorrecao.cnpj);
      end;
    end;
  finally
    // GRAVAR SOMENTE SE NÃO FOR DUPLICIDADE
    FcartaCorrecao.cStat := FcStat;
    FcartaCorrecao.xMotivo := Fmotivo;
    gravalog('[Carta correcao result ' + Fmotivo, FcartaCorrecao.cnpj);
    if FcStat <> 573 then
    begin
      dao := TDaocartaCorrecao.create;
      try
        dao.gravarCartaCorrecao(FcartaCorrecao);
      finally
        FreeAndNil(dao);
      end;
    end;
  end;
end;

{ ----------------------------------------------------------------------------- }
constructor TServicecartaCorrecao.create(classcartaCorrecao: TcartaCorrecao);
var
  dao: TdaoEmpresa;
begin
  dao := TdaoEmpresa.create;
  try
    try
      FcartaCorrecao := classcartaCorrecao;

      Fempresa := dao.getEmpresaCnpj(classcartaCorrecao.cnpj);

      if Fempresa.cnpj = '' then
        raise exception.create
          ('Nehuma empresa  cadastrada com o cnpj informado ' +
          classcartaCorrecao.cnpj);
      Facbr := TACBrNFe.create(Nil);
      TAcbrConfig.SetAcbrObj(Facbr, Fempresa);
      cartaCorrecao;
      DeleteInfoDashBoard;
    except
      on e: exception do
      begin
        gravalog('[Erro ao gerar cartaCorrecao ' + e.Message,
          classcartaCorrecao.cnpj);
        FcartaCorrecao.cStat := 5001;
        FcartaCorrecao.xMotivo := e.Message;
      end;
    end;
  finally

    FreeAndNil(dao);

  end;

end;

destructor TServicecartaCorrecao.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
  if Assigned(Fdanfe) then
    FreeAndNil(Fdanfe);

end;

end.
