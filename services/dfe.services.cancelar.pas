unit dfe.services.cancelar;

interface

uses
  dfe.lib.constants,
  windows,
  pcnEventoNFe,
  dateUtils,
  SysUtils,
  inifiles,
  System.Classes,
  math,
  XSBuiltIns,
  Variants,
  activex,
  ACBrNFe,
  ACBrEAD,
  pcnConversao,
  pcnConversaoNFe,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,
  ACBrDFeUtil,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  XMLIntf,
  System.NetEncoding,

  syncobjs,
  dfe.lib.util,
  dfe.model.cancelamentoRequest,
  dfe.services.email,

  dfe.model.empresa,
  dfe.lib.acbr.config,
  dfe.dao.cancelamento,
  dfe.dao.empresa,
  dfe.model.cancelamento;

type
  TServiceCancelar = class
  private
    Facbr: TACBrNFe;
    FpathXml: string;
    FdanfeBase64: string;
    Fdanfe: TACBrNFeDANFeRL;
    FcStat: integer;
    Fempresa: TEmpresa;
    Fcancelamento: Tcancelamento;
    Fmotivo: string;
    function gerarDanfeBase64: string;
  public
    constructor create(nota: Tcancelamento);
    destructor destroy;
    procedure cancelar;
  published
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;
  end;

implementation

function TServiceCancelar.gerarDanfeBase64: string;
var
  path: string;
  outfile: TFileStream;
  strfile: TStringStream;
begin
  try
    Fdanfe := TACBrNFeDANFeRL.create(Nil);
    Facbr.DANFE := Fdanfe;

    path := ExtractFilePath(GetModuleName(HInstance)) + 'reports\';
    ForceDirectories(path);
    Fdanfe.MostraPreview := false;
    if FileExists(ExtractFilePath(GetModuleName(HInstance)) + 'logo\logo.bmp')
    then

      Fdanfe.Logo := ExtractFilePath(GetModuleName(HInstance)) +
        'logo\logo.bmp';
    Fdanfe.MostraStatus := false;
    Fdanfe.MostraSetup := false;
    Fdanfe.Sistema := _ctEmpressaDanfe;
    Fdanfe.Site := _ctSiteDanfe;
    Fdanfe.PathPDF := path;
    Facbr.ImprimirEventoPDF;

    FpathXml := ExtractFilePath(GetModuleName(HInstance)) + 'cancelamentos\';
    ForceDirectories(FpathXml);
    FpathXml := FpathXml + Fcancelamento.chave + '-procCancelamentNFe.xml';
    with TStringList.create do
    begin
      text := Fcancelamento.xmlRetorno;
      SaveToFile(FpathXml);
      free;
    end;

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

procedure TServiceCancelar.cancelar();
var

  ochave: string;
  dao: TDaoCancelamento;
begin
  FcStat := 5001;
  try
    try
      ochave := Fcancelamento.chave;
      Facbr.EventoNFe.Evento.Clear;
      with Facbr.EventoNFe.Evento.Add do
      begin
        infEvento.chNFe := ochave;

        infEvento.cnpj := Fcancelamento.cnpj;

        infEvento.dhEvento := now;
        infEvento.tpEvento := teCancelamento;
        infEvento.detEvento.xJust := Fcancelamento.Justificativa;
        infEvento.detEvento.nProt := Fcancelamento.protocoloNota;
      end;
      try
        Facbr.EnviarEvento(1);
      except
        on e: exception do
        begin
          Fmotivo := e.Message;
        end;
      end;
      if Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Count > 0 then
      begin
        FcStat := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.cstat;
        Fmotivo := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xmotivo;
      end;
      If (FcStat = 577) then
      begin
        try
          Facbr.EventoNFe.Evento[0].infEvento.dhEvento := now;
          Facbr.EnviarEvento(1);
        except
          on e: exception do
          begin
            Fmotivo := e.Message;
          end;
        end;
        FcStat := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.cstat;
        Fmotivo := Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xmotivo;

      end;
      If (FcStat = 135) or (FcStat = 155) or (FcStat = 573) then
      begin
        Fcancelamento.data := datetimetostr(now);
        Fcancelamento.xmlRetorno := '<nfeCanc>' +
          Facbr.WebServices.EnvEvento.DadosMsg + #13#10 +
          Facbr.WebServices.EnvEvento.RetWS + '</nfeCanc>';

        if Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.nProt = '' Then
          Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
            .RetInfEvento.nProt := FormatDateTime('yymmddhhmmsszz', now);

        Fcancelamento.xmotivo := Fmotivo;

        Fcancelamento.protocoloCancelamento :=
          Facbr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.nProt;
        FdanfeBase64 := gerarDanfeBase64;
        Fcancelamento.DANFE := FdanfeBase64;
        if Fcancelamento.protocoloCancelamento <> '' then
          Fcancelamento.cstat := 135;
        dao := TDaoCancelamento.create;
        try
          dao.gravarCancelamento(Fcancelamento);
        finally
          FreeAndNil(dao);
        end;
        if Fcancelamento.emailDestinatario <> '' then
        begin
          with TenvioEmail.create(true) do
          begin
            tipoEmail := 'CANCELAMENTO';
            nota.chave := Fcancelamento.chave;
            destinatario := Fcancelamento.emailDestinatario;
            nota.protocolo := Fcancelamento.protocoloCancelamento;
            cnpj := Fcancelamento.cnpj;
            anexos.Add(Fdanfe.ArquivoPDF);
            anexos.Add(FpathXml);
            FreeOnTerminate := true;
            resume;
          end;

        end
        else
          gravalog(' destinatario não informado par envio de carta de correçao ',
            Fcancelamento.cnpj);

      end;
    except
      on e: exception do
      begin
        Fmotivo := e.Message;
        FcStat := 5001;
        gravalog(e.Message, Fcancelamento.cnpj);
        raise exception.create(e.Message);
      end;
    end;
  finally
    Fcancelamento.cstat := FcStat;
    Fcancelamento.xmotivo := Fmotivo;

  end;
end;

constructor TServiceCancelar.create(nota: Tcancelamento);
var
  dao: TdaoEmpresa;
begin
  dao := TdaoEmpresa.create;
  try
    try
      Fcancelamento := nota;

      Fempresa := dao.getEmpresaCnpj(nota.cnpj);
      if Fempresa.cnpj = '' then
        raise exception.create
          ('Nehuma empresa  cadastrada com o cnpj informado ' + nota.cnpj);
      Facbr := TACBrNFe.create(Nil);

      TAcbrConfig.SetAcbrObj(Facbr, Fempresa);
      cancelar;
      DeleteInfoDashBoard;
    except
      on e: exception do
      begin
        gravalog('[Erro ao cancelar ' + e.Message, nota.cnpj);
        Fcancelamento.cstat := 5001;
        Fcancelamento.xmotivo := e.Message;

      end;
    end;
  finally
    FreeAndNil(dao);

  end;

end;

destructor TServiceCancelar.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
  if Assigned(Fdanfe) then
    FreeAndNil(Fdanfe);
end;

end.
