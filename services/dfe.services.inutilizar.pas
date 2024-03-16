unit dfe.services.inutilizar;

interface

uses
  dfe.lib.constants,
  windows,
  pcnEventoNFe,
  dateUtils,
  SysUtils,
  inifiles,
  math,
  XSBuiltIns,
  Variants,
  System.Classes,
  activex,
  ACBrNFe,
  ACBrEAD,
  pcnConversao,
  pcnConversaoNFe,
  ACBrUtil,
  ACBrNFeDANFeRLClass,
  System.NetEncoding,
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
  dfe.dao.inutilizacao,
  dfe.dao.empresa,
  dfe.model.inutilizacao;

type
  TServiceInutilizar = class
  private
    Facbr: TACBrNFe;
    FdanfeBase64: string;
    Fdanfe: TACBrNFeDANFeRL;
    FcStat: integer;
    Fempresa: TEmpresa;
    FInutilizacao: TInutilizacao;
    Fmotivo: string;
    function gerarDanfeBase64: string;
  public
    constructor create(classInutilizacao: TInutilizacao);
    destructor destroy;
    procedure inutilizar;
  end;

implementation

function TServiceInutilizar.gerarDanfeBase64: string;
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
      Facbr.ImprimirInutilizacaoPDF;

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
destructor TServiceInutilizar.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
end;

{ ------------------------------------------------------------------------------ }
procedure TServiceInutilizar.inutilizar();
var
  dao: TDaoInutilizacao;
begin
  FcStat := 0;

  try
    Facbr.EventoNFe.Evento.Clear;

    Facbr.WebServices.Inutiliza(FInutilizacao.cnpj, FInutilizacao.justificativa,
      FInutilizacao.ano, FInutilizacao.modelo, FInutilizacao.serie,
      FInutilizacao.numeroInicial, FInutilizacao.numeroFinal);

    if Facbr.WebServices.inutilizacao.Msg <> '' then
      Fmotivo := Facbr.WebServices.inutilizacao.Msg;
    FInutilizacao.xmlEvento :=
      UTF8Encode(Facbr.WebServices.inutilizacao.RetornoWS);
    FcStat := Facbr.WebServices.inutilizacao.cStat;
    if Facbr.InutNFe.ID = '' then
    begin
      Facbr.InutNFe.LerXMLFromString(FInutilizacao.xmlEvento);
      Facbr.InutNFe.ID := Facbr.WebServices.inutilizacao.ID;
    end;
    if (FcStat = 102) or (FcStat = 563) then
    begin
      FInutilizacao.protocolo := Facbr.WebServices.inutilizacao.protocolo;
      // FORÇAR PREENCHIMENTO DOS DADOS NA INUTILIZAÇÃO
      Facbr.InutNFe.RetInutNFe.nProt := FInutilizacao.protocolo;
      Facbr.InutNFe.RetInutNFe.dhRecbto :=
        Facbr.WebServices.inutilizacao.dhRecbto;
      FInutilizacao.dhRecbto := Facbr.WebServices.inutilizacao.dhRecbto;
      Facbr.InutNFe.RetInutNFe.versao := Facbr.WebServices.inutilizacao.versao;
      Facbr.InutNFe.RetInutNFe.tpAmb := Facbr.WebServices.inutilizacao.tpAmb;
      Facbr.InutNFe.RetInutNFe.xJust := FInutilizacao.justificativa;
      Facbr.InutNFe.RetInutNFe.modelo := FInutilizacao.modelo;
      FdanfeBase64 := gerarDanfeBase64;
      FInutilizacao.danfeBase64 := FdanfeBase64;
      FInutilizacao.DANFE := FdanfeBase64;
      FInutilizacao.cStat := FcStat;
      FInutilizacao.xmotivo := Fmotivo;
      dao := TDaoInutilizacao.create;
      try
        dao.gravarInutilizacao(FInutilizacao);
      finally
        FreeAndNil(dao);
      end;
    end;

  except
    on e: exception do
    begin

      Fmotivo := e.Message;
      if FcStat = 0 then
        FcStat := 5001;
      gravalog(e.Message, FInutilizacao.cnpj);
      raise exception.create(e.Message);

    end;
  end;

end;

{ ----------------------------------------------------------------------------- }
constructor TServiceInutilizar.create(classInutilizacao: TInutilizacao);
var
  dao: TdaoEmpresa;
begin
  dao := TdaoEmpresa.create;

  try
    try
      FInutilizacao := classInutilizacao;

      Fempresa := dao.getEmpresaCnpj(classInutilizacao.cnpj);
      if Fempresa.cnpj = '' then
        raise exception.create
          ('Nehuma empresa  cadastrada com o cnpj informado ' +
          classInutilizacao.cnpj);
      Facbr := TACBrNFe.create(Nil);
      TAcbrConfig.SetAcbrObj(Facbr, Fempresa);
      inutilizar;
      DeleteInfoDashBoard;
    except
      on e: exception do
      begin
        gravalog('[Erro ao Inutilizar ' + e.Message, classInutilizacao.cnpj);

        FInutilizacao.cStat := 5001;
        FInutilizacao.xmotivo := e.Message;
      end;
    end;
  finally
    FreeAndNil(dao);
  end;

end;

end.
