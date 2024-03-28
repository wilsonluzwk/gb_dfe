unit dfe.services.validar;

interface

uses
  classes,
  windows,
  pcnEventoNFe,
  REST.Json,
  System.Json,
  dateUtils,
  SysUtils,
  inifiles,
  System.NetEncoding,
  math,
  blcksock,
  dfe.services.email,
  dfe.lib.constants,
  XSBuiltIns,
  Variants,
  activex,
  ACBrNFe,
  pcnConversao,
  pcnConversaoNFe,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,
  ACBrDFeUtil,
  XMLIntf,
  syncobjs,

  XMLDoc,
  ACBrDFeReport,
  ACBrMail,
  ACBrNFeNotasFiscais,
  ACBrDFeDANFeReport,
  ACBrDANFCeFortesFr,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,

  dfe.lib.util,

  dfe.model.empresa,
  dfe.dao.empresa,
  dfe.dao.log,
  dfe.dao.nfe,
  dfe.model.nfe;

type
  TdadosConsulta = record
    nProt: string;
    chave: string;
    versao: string;
    digito: string;
    data: tdatetime;
    xmotivo: string;
    cstat: Integer;
    xml: string;
  end;

type
  TNfeValidar = class
  private
    Finicio: TTime;
    tempoGasto: string;
    FpathXml: string;
    FcStat: Integer;

    FRetWS: string;
    Fmsg: string;
    FretornoWS: string;
    FsucessoEnvio: Boolean;
    FxmlAnterior: string;
    msgExcessao: string;
    envioSincrono: Boolean;
    FxMotivo: string;
    Frecibo: string;
    FnotaValidada: Boolean;
    Fnota: Tnota;
    FchaveNFe: String;
    FemailTransp: string;
    envioContigencia: Boolean;
    Facbr: TACBrNFe;
    FdanfeNFE: TACBrNFeDANFeRL;
    FdanfeNFCE: TACBrNFeDANFCeFortes;
    FnfeCancelada: Boolean;
    FdanfeBase64: string;
    FmsgExcessao: string;
    RetornoWS: string;
    Fprotocolo: string;
    Fsituacao: string;
    Fempresa: Tempresa;
    FdhRecibo: tdatetime;
    procedure mydebug(msg: string);
    procedure setNotabyChaveValida(chave: string);
    procedure setNotaValidada();
    procedure salvarArquivo();

    function gerarDanfeBase64: string;
    function getServiceID: string;
    procedure setTipoPdf();
    procedure verificarDuplicidade();
    function tratarErro(value: string): string;
    procedure limpaVariaveisNFE;
    function situacaoToTipoEmissao: TpcnTipoEmissao;
    procedure setDadosConsulta();
    procedure setDadosRetorno();
    procedure preparaEnvioSefaz();
    function executarEnvioSefaz(): Boolean;
    function validarTipoContigencia(uf: Integer): TpcnTipoEmissao;
    procedure setTpEmiss(tipo: TpcnTipoEmissao);
    procedure gravarNota;
    procedure setRetornoWSAcbr();

    procedure processarRetornoValidacao();
    procedure processarValidacao;

  public
    FdadosConsulta: TdadosConsulta;

    constructor create(var Nota: Tnota);
    destructor Destroy; override;

  published
    property NfeCancelada: Boolean read FnfeCancelada write FnfeCancelada;
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;
  end;

implementation

uses
  dfe.lib.acbr.config;

{ TNfeValidar }
{ ----------------------------------------------------------------------------- }

procedure TNfeValidar.setTipoPdf();

var
  Ok: Boolean;
begin

  if Fnota.modelo = '65' then
  begin

    Facbr.DANFE := FdanfeNFCE;

    FdanfeNFCE.NumCopias := Fempresa.danfe_qtdcopias;

    if Fempresa.danfe_exibefatura = 'S' then
      FdanfeNFE.ExibeCampoFatura := True
    else
      FdanfeNFE.ExibeCampoFatura := False;
  end
  else
  begin
    Facbr.DANFE := FdanfeNFE;
    FdanfeNFE.NumCopias := Fempresa.danfe_qtdcopias;

    if Fempresa.danfe_exibefatura = 'S' then

      FdanfeNFE.ExibeCampoFatura := True
    else
      FdanfeNFE.ExibeCampoFatura := False;

    case Fempresa.danfe_tipodanf of
      0:
        FdanfeNFE.TipoDANFE := tiSemGeracao;
      1:
        FdanfeNFE.TipoDANFE := tiRetrato;
      2:
        FdanfeNFE.TipoDANFE := tiPaisagem;
      3:
        FdanfeNFE.TipoDANFE := tiSimplificado;
      4:
        FdanfeNFE.TipoDANFE := tiMsgEletronica;
    end;

    case Fempresa.danfe_tipodanf of
      0:
        Facbr.DANFE.TipoDANFE := StrToTpImp(Ok, '0');
      1:
        Facbr.DANFE.TipoDANFE := StrToTpImp(Ok, '1');
      2:
        Facbr.DANFE.TipoDANFE := StrToTpImp(Ok, '2');
      3:
        Facbr.DANFE.TipoDANFE := StrToTpImp(Ok, '3');
      4:
        Facbr.DANFE.TipoDANFE := StrToTpImp(Ok, '5');
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
constructor TNfeValidar.create(var Nota: Tnota);
var
  daoNFE: TDaoNfe;
  daoEmpresa: TDaoEmpresa;
  opesquisa: TfiltroNota;

begin
  Fnota := Nota;
  Finicio := time;
  daoEmpresa := TDaoEmpresa.create;
  daoNFE := TDaoNfe.create();
  Fempresa := daoEmpresa.getEmpresaCnpj(Nota.cnpj);

  gravalog('    >>' + getServiceID +

    inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
    Fnota.cnpj + ' Parametros ->' + #13#10 + 'Fsda:  ' + Fempresa.usafsda +
    #13#10 + 'Logo:  ' + Fempresa.danfe_expandiLogo, Fnota.cnpj);
  try
    try
      Fnota.dataProcessamento := 0;
      Fnota.codigo_loja := Fempresa.codigo_loja;
      if Fempresa.cnpj = '' then
        raise exception.create(_ctEmpresaNotFound + Nota.cnpj);
      Facbr := TACBrNFe.create(Nil);

      if Nota.xml <> '' then
      begin
        Facbr.NotasFiscais.LoadFromString(Nota.xml);
      end
      else if Nota.txt <> '' then
      begin
        Facbr.NotasFiscais.LoadFromIni(Nota.txt)
      end;
      if Facbr.NotasFiscais.Count = 0 then
        raise exception.create(_ctXmImputInvalid);
      Fnota.xml := Facbr.NotasFiscais[0].GerarXML;
      opesquisa := TfiltroNota.create;
      opesquisa.numero := Fnota.numero;
      FemailTransp := Nota.emailtransportadora;
      //evitar que o fdp informe uma serie e mande outra no xml
      Fnota.serie :=Facbr.NotasFiscais[0].nfe.Ide.serie;
      opesquisa.serie := inttostr(Fnota.serie);
      Fnota.modelo := inttostr(Facbr.NotasFiscais[0].nfe.Ide.modelo);

      opesquisa.cnpj := Fnota.cnpj;;
      opesquisa.ambiente := 'H';
      opesquisa.codigo_loja := '';
      Fnota.modelo := inttostr(Facbr.NotasFiscais[0].nfe.Ide.modelo);
      if Facbr.NotasFiscais[0].nfe.infRespTec.cnpj = '' then
      begin
        Facbr.NotasFiscais[0].nfe.infRespTec.cnpj := Fempresa.rt_cnpj;
        Facbr.NotasFiscais[0].nfe.infRespTec.xContato := Fempresa.rt_xcontato;
        Facbr.NotasFiscais[0].nfe.infRespTec.email := Fempresa.rt_email;
        Facbr.NotasFiscais[0].nfe.infRespTec.fone := Fempresa.rt_fone;
      end;
      Fnota.chave := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);
      Fnota.dataEmissao := Facbr.NotasFiscais[0].nfe.Ide.dEmi;
      TAcbrConfig.setAcbrObj(Facbr, Fempresa);
      // parametros para validacao
      Facbr.Configuracoes.WebServices.IntervaloTentativas := 1000;
      Facbr.Configuracoes.WebServices.AguardarConsultaRet := 100;
      if Fnota.modelo = '65' then
        Facbr.Configuracoes.Geral.ModeloDF := moNFCe
      else
        Facbr.Configuracoes.Geral.ModeloDF := moNFe;

      if Facbr.NotasFiscais[0].nfe.Ide.tpAmb = taProducao then
        opesquisa.ambiente := 'P';
      gravalog(_ctBreakLine + getServiceID + ' << INICIO >> Nº: ' +
        inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
        Fnota.cnpj + _ctBreakLine, Fnota.cnpj);
      try
        Facbr.NotasFiscais.Assinar;
      except
        on e: exception do
          raise exception.create(getServiceID +
            ' Erro no processo de assinatura ' + e.Message);
      end;

      try
        processarValidacao();
      except
        on e: exception do
          raise exception.create(' Erro no processo de envio ' + e.Message);

      end;
      processarRetornoValidacao();
    except
      on e: exception do
      begin
        mydebug('    >>' + getServiceID + ' Erro ao validar ' + e.Message);
        Fnota.status := 5001;
        Fnota.motivo := e.Message;
      end;
    end;
  finally

    DeleteInfoDashBoard;
    FreeAndNil(daoNFE);
    tempoGasto := FormatDateTime('hh:mm:ss', time - Finicio);
    FreeAndNil(daoEmpresa);
    gravalog(_ctBreakLine + getServiceID + '<<FINALIZADO TEMPO GASTO : ' +
      tempoGasto + ' >>   Nº: ' + inttostr(Fnota.numero) + ' Serie: ' +
      inttostr(Fnota.serie) + ' Cnpj ' + Fnota.cnpj + ' Resultado: ' +
      Nota.motivo + _ctBreakLine, Fnota.cnpj);

  end;
end;

{ ------------------------------------------------------------------------------ }
destructor TNfeValidar.Destroy;
begin

  if Assigned(FdanfeNFCE) then
    FreeAndNil(FdanfeNFCE);
  FreeAndNil(FdanfeNFCE);
  if Assigned(FdanfeNFE) then
    FreeAndNil(FdanfeNFE);
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);

end;

function TNfeValidar.gerarDanfeBase64: string;
var
  path: string;
  outfile: TFileStream;
  strfile: TStringStream;
  function isDifUnidades: Boolean;
  var
    index: Integer;
  begin
    result := False;
    for index := 0 to pred(Facbr.NotasFiscais[0].nfe.Det.Count) do
    begin
      if Facbr.NotasFiscais[0].nfe.Det[index].Prod.uCom <> Facbr.NotasFiscais[0]
        .nfe.Det[index].Prod.uTrib then
      begin
        result := True;
        break;
      end;
    end;
  end;

begin
  FdanfeNFE := TACBrNFeDANFeRL.create(Nil);
  FdanfeNFCE := TACBrNFeDANFCeFortes.create(Nil);
  setTipoPdf();
  try
    path := ExtractFilePath(GetModuleName(HInstance)) + 'reports\';
    ForceDirectories(path);
    Facbr.DANFE.MostraPreview := False;
    if FileExists(Fempresa.danfe_logomarca) then

      Facbr.DANFE.Logo := Fempresa.danfe_logomarca;
    Facbr.DANFE.Sistema := _ctEmpressaDanfe;
    Facbr.DANFE.Site := _ctSiteDanfe;
    Facbr.DANFE.MostraStatus := False;
    Facbr.DANFE.MostraSetup := False;
    Facbr.DANFE.PathPDF := path;
    if Facbr.NotasFiscais[0].nfe.Ide.modelo = 55 then
    begin
      Facbr.DANFE.CasasDecimais.Formato := tdetInteger;
      Facbr.DANFE.CasasDecimais.qCom := 6;
      Facbr.DANFE.CasasDecimais.vUnCom := 6;
      if isDifUnidades then
        FdanfeNFE.ImprimeValor := iuComercialETributavel;
    end;
    Facbr.NotasFiscais[0].ImprimirPDF;
    try
      strfile := TStringStream.create;
      outfile := TFileStream.create(Facbr.DANFE.ArquivoPDF, fmOpenRead);
      TNetEncoding.base64.Encode(outfile, strfile);
      result := strfile.DataString;
    finally
      FreeAndNil(outfile);
      FreeAndNil(strfile);
    end;

  except
    on e: exception do
      gravalog(e.Message, Fnota.cnpj);
  end;
end;

function TNfeValidar.getServiceID: string;
begin
  result := '[VALIDACAO_NFE PID ' + inttostr(HInstance) + ' ] ';
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.gravarNota;
var
  dao: TDaoNfe;
begin

  dao := TDaoNfe.create;
  try
    gravalog('    >>' + getServiceID + ' Gravando nota Nº: ' +
      inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
      Fnota.cnpj + ' Situaçao: ' + Fnota.situacao, Fnota.cnpj);
    try
      dao.gravarNota(Fnota);
    except
      on e: exception do
      begin
        gravalog('    >>' + getServiceID + ' ERRO gravando Nº: ' +
          inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) +
          ' Cnpj: ' + Fnota.cnpj + ' ' + e.Message, Fnota.cnpj);
      end;

    end;
  finally
    FreeAndNil(dao);
    gravalog('    >>' + getServiceID + ' Gravacao finalizada nota Nº: ' +
      inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
      Fnota.cnpj, Fnota.cnpj);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TNfeValidar.mydebug(msg: string);
begin
  gravalog(msg, Fnota.cnpj);
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.processarRetornoValidacao;
begin
  try
    Fnota.motivo := FxMotivo;
    Fnota.status := FcStat;
    Fnota.xml := Facbr.NotasFiscais[0].GerarXML;
    Fnota.xmlRetorno := FRetWS;
    if FdanfeBase64 <> '' then
      Fnota.DANFE := FdanfeBase64;
    try
      if Assigned(Facbr.NotasFiscais[0].nfe.procNFe) then
      begin
        Fnota.protocolo := Facbr.NotasFiscais[0].nfe.procNFe.nProt;
        Fnota.digitoval := Facbr.NotasFiscais[0].nfe.procNFe.digVal;
      end;
    except
    end;
    Fnota.chave := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);
    if Fnota.situacao = '' then
      Fnota.situacao := inttostr(FcStat);

  finally
    gravarNota();
  end;

end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setNotabyChaveValida(chave: string);
var
  atpEmiss: string;
  adhEmi: TDate;
  aAno: string;
  aMes: string;
  aDia: string;
  aCdNF: string;
  aOk: Boolean;

begin
  FchaveNFe := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);
  aCdNF := copy(chave, 36, 8);
  atpEmiss := copy(chave, 35, 1);
  aAno := copy(chave, 3, 2); // ano
  aMes := copy(chave, 5, 2); // mes
  aDia := FormatDateTime('dd', Facbr.NotasFiscais[0].nfe.Ide.dEmi);

  adhEmi := EncodeDate(strtoint(aAno), strtoint(aMes), strtoint(aDia));
  Facbr.NotasFiscais[0].nfe.Ide.tpEmis := StrToTpEmis(aOk, atpEmiss);
  Facbr.Configuracoes.Geral.FormaEmissao := StrToTpEmis(aOk, atpEmiss);
  Facbr.NotasFiscais[0].nfe.Ide.tpEmis := StrToTpEmis(aOk, atpEmiss);

  Facbr.NotasFiscais[0].nfe.Ide.cNF := strtoint(aCdNF);
  Facbr.NotasFiscais[0].nfe.Ide.dEmi := adhEmi;
  Facbr.NotasFiscais[0].nfe.Ide.dSaiEnt := adhEmi;
  Facbr.NotasFiscais.GerarNFe;

  FchaveNFe := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.salvarArquivo;
var
  dirValidadas: string;
  dirPendentes: string;
  anoMes: string;
  nomeXML: string;
  camXml: string;
begin
  try
    camXml := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
      Fnota.codigo_loja;
    dirValidadas := camXml + '\Validados\';
    dirPendentes := camXml + '\Pendentes\';
    ForceDirectories(dirPendentes);
    ForceDirectories(dirValidadas);
    nomeXML := soNumeros(Facbr.NotasFiscais[0].nfe.infNFe.ID) + '-nfe.xml';
    anoMes := FormatDateTime('yyyy-mm', Facbr.NotasFiscais[0].nfe.Ide.dEmi);
    if Facbr.NotasFiscais[0].nfe.procNFe.nProt <> '' then
    begin
      ForceDirectories(dirValidadas + '\' + anoMes);
      FpathXml := dirValidadas + '\' + anoMes + '\' + nomeXML;
      Facbr.NotasFiscais[0].GravarXML(FpathXml);
    end
    else
    begin
      ForceDirectories(dirValidadas + '\' + anoMes);
      FpathXml := dirPendentes + '\' + anoMes + '\' + nomeXML;
      Facbr.NotasFiscais[0].GravarXML(FpathXml);
    end;
  finally
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setNotaValidada();
begin

  Fnota.xml := Facbr.NotasFiscais[0].GerarXML;
  danfeBase64 := gerarDanfeBase64;
  Fnota.DANFE := FdanfeBase64;
  FnotaValidada := True;

  if Facbr.NotasFiscais[0].nfe.Dest.email <> '' then
  begin
    with TenvioEmail.create(True) do
    begin
      Nota.chave := Fnota.chave;
      cnpj := Fnota.cnpj;
      destinatario := Facbr.NotasFiscais[0].nfe.Dest.email;
      anexos.Add(Facbr.DANFE.ArquivoPDF);
      anexos.Add(FpathXml);
      emailTransp := self.FemailTransp;
      Nota.protocolo := Fnota.protocolo;
      FreeOnTerminate := True;
      resume;
    end;
  end
  else
    gravalog('    >>' + getServiceID + ' destinatario não informado Nº: ' +
      inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
      Fnota.cnpj, Fnota.cnpj);

end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.verificarDuplicidade();
var
  chaveAutorizada: string;
begin

  if (FcStat = 204) then
  begin
    gravalog('    >>' + getServiceID +
      ' Duplicidade 204 consultando a nota já emitida: ' +
      inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
      Fnota.cnpj, Fnota.cnpj);
    Facbr.consultar;
    if (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 100) or
      (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 150) then
    begin
      FsucessoEnvio := True;

      FRetWS := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
      FcStat := Facbr.NotasFiscais[0].nfe.procNFe.cstat;
      FxMotivo := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
      Fmsg := Facbr.NotasFiscais[0].nfe.procNFe.xMsg;
      FretornoWS := Facbr.NotasFiscais[0].nfe.procNFe.XML_prot;
      FsucessoEnvio := True;
      msgExcessao := '';
      setNotaValidada();
    end;
  end;
  if (FcStat = 539) then
  begin
    chaveAutorizada := '';
    chaveAutorizada := GetChaveValidada(FxMotivo);
    gravalog('    >>' + getServiceID +
      ' Duplicidade 509 consultando a nota emitida : ' + inttostr(Fnota.numero)
      + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' + Fnota.cnpj, Fnota.cnpj);
    if chaveAutorizada <> '' then
    begin
      // muda os dados para os contidos na chave
      setNotabyChaveValida(chaveAutorizada);
      Facbr.consultar;

      if (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 100) or
        (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 150) then
      begin

        FRetWS := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
        Fmsg := Facbr.NotasFiscais[0].nfe.procNFe.xMsg;
        FretornoWS := Facbr.NotasFiscais[0].nfe.procNFe.XML_prot;

        FcStat := Facbr.NotasFiscais[0].nfe.procNFe.cstat;
        FxMotivo := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
        FsucessoEnvio := True;
        FsucessoEnvio := True;
        msgExcessao := '';
        setNotaValidada();
      end;
    end;
  end;
  if (FcStat = 613) then
  begin
    chaveAutorizada := '';

    chaveAutorizada := GetChaveValidada(FxMotivo);
    gravalog('    >>' + getServiceID +
      ' Duplicidade 613  consultando a nota emitida : ' + inttostr(Fnota.numero)
      + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' + Fnota.cnpj, Fnota.cnpj);

    if chaveAutorizada <> '' then
    begin
      // muda os dados para os contidos na chave
      setNotabyChaveValida(chaveAutorizada);
      Facbr.consultar;

      if (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 100) or
        (Facbr.NotasFiscais[0].nfe.procNFe.cstat = 150) then
      begin
        FcStat := Facbr.NotasFiscais[0].nfe.procNFe.cstat;
        FxMotivo := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
        FRetWS := Facbr.NotasFiscais[0].nfe.procNFe.xmotivo;
        Fmsg := Facbr.NotasFiscais[0].nfe.procNFe.xMsg;
        FretornoWS := Facbr.NotasFiscais[0].nfe.procNFe.XML_prot;
        FsucessoEnvio := True;
        FsucessoEnvio := True;
        msgExcessao := '';
        setNotaValidada();
      end;
    end;
  end;

end;

{ ------------------------------------------------------------------------------ }
function TNfeValidar.validarTipoContigencia(uf: Integer): TpcnTipoEmissao;
begin
  if uf > 60 then
    raise exception.create('Código uf invalida');
  if uf in [12, 27, 16, 52, 32, 31, 25, 33, 24, 11, 14, 43, 42, 28, 35, 17] then
    result := teSVCAN
  else if uf in [13, 23, 52, 29, 21, 50, 51, 15, 26, 22, 41] then
    result := teSVCRS;

end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setTpEmiss(tipo: TpcnTipoEmissao);

begin
  Facbr.NotasFiscais[0].nfe.Ide.tpEmis := tipo;
  Facbr.Configuracoes.Geral.FormaEmissao := tipo;
  Facbr.NotasFiscais[0].nfe.Ide.xJust := '';
  Facbr.NotasFiscais[0].nfe.Ide.dhCont := 0;
  if ((tipo <> teNormal) and (Fnota.modelo = '55')) then
  begin
    if tipo <> teFSDA then
      Facbr.NotasFiscais[0].nfe.Ide.tpEmis :=
        validarTipoContigencia(Facbr.NotasFiscais[0].nfe.Ide.cUF);

    Facbr.NotasFiscais[0].nfe.Ide.dhCont := now();

    Facbr.NotasFiscais[0].nfe.Ide.xJust :=
      'PROBLEMAS DE CONEXÃO AO GERAR DOCUMENTO FISCAL';

  end;
  if ((tipo <> teNormal) and (Fnota.modelo = '65')) then
  begin

    Facbr.NotasFiscais[0].nfe.Ide.dhCont := now();

    Facbr.NotasFiscais[0].nfe.Ide.xJust :=
      'PROBLEMAS DE CONEXÃO AO GERAR DOCUMENTO FISCAL';
  end;
  Facbr.Configuracoes.Geral.FormaEmissao := Facbr.NotasFiscais[0]
    .nfe.Ide.tpEmis;
  // FORÇA A REGERAR COM A NOVA CHAVE
  Facbr.NotasFiscais.GerarNFe;
  Facbr.NotasFiscais.Assinar;
  FchaveNFe := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);

end;

{ ------------------------------------------------------------------------------ }
function TNfeValidar.situacaoToTipoEmissao: TpcnTipoEmissao;
begin
  result := teNormal;
  if (Fsituacao = 'CONT') then
  begin
    result := validarTipoContigencia(Facbr.NotasFiscais[0].nfe.Ide.cUF);
  end;
  if Fsituacao = 'FSDA' then
  begin
    result := teFSDA;
  end;
  if Fsituacao = 'OFFL' then
  begin
    result := teOffLine;
  end;
end;

{ ------------------------------------------------------------------------------ }
function TNfeValidar.tratarErro(value: string): string;
var
  iten: string;
  i: Integer;
  j: Integer;
begin
  result := value;
  try
    i := pos('[nitem', LowerCase(value));
    if i > 0 then
    begin
      iten := copy(value, i + 6, length(value));
      j := pos(']', iten);
      iten := soNumeros(copy(iten, 0, j - 1));
      if iten <> '' then
      begin
        for j := 0 to Facbr.NotasFiscais[0].nfe.Det.Count - 1 do
        begin
          if Facbr.NotasFiscais[0].nfe.Det[j].Prod.nItem = strtoint(iten) then
          begin
            result := result + 'Produto : ' + Facbr.NotasFiscais[0].nfe.Det[j]
              .Prod.cprod + ' - ' + Facbr.NotasFiscais[0].nfe.Det[j].Prod.xProd
              + char(13) + 'NCM   : ' + Facbr.NotasFiscais[0].nfe.Det[j]
              .Prod.NCM + char(13) + 'EAN   : ' + Facbr.NotasFiscais[0].nfe.Det
              [j].Prod.cEAN + char(13)

              + 'Favor verificar detalhes na aba NFe&NFce !' + char(13) +
              '-------------------------------------------------------------';
            exit;
          end;
        end;
      end;
    end;
  except
    on e: exception do
      raise exception.create('Erro ao processar retorno ' + e.Message);
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setRetornoWSAcbr();
begin
  if Facbr.WebServices.Retorno.RetWS <> '' then
  begin
    FretornoWS := Facbr.WebServices.Retorno.RetWS;
    Fmsg := Facbr.WebServices.Retorno.msg;
    RetornoWS := Facbr.WebServices.Retorno.RetornoWS;
    Frecibo := Facbr.WebServices.Retorno.Recibo;
    Fnota.xmlRetorno := RetornoWS;

  end
  else if Facbr.WebServices.Consulta.RetWS <> '' then
  begin
    FretornoWS := Facbr.WebServices.Consulta.RetWS;
    Fmsg := Facbr.WebServices.Consulta.msg;
    RetornoWS := Facbr.WebServices.Consulta.RetornoWS;
    Fnota.xmlRetorno := RetornoWS;
  end;
end;

{ ------------------------------------------------------------------------------ }
function TNfeValidar.executarEnvioSefaz(): Boolean;
begin
  result := False;
  FmsgExcessao := '';
  FcStat := 0;
  try
    if not envioSincrono then
    begin
      Facbr.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;
      Facbr.Configuracoes.WebServices.Tentativas := 10;
    end;
    gravalog('    >>' + getServiceID + ' ENVIANDO A SEFAZ AGUARDE  Nº: ' +
      inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
      Fnota.cnpj, Fnota.cnpj);
    FxMotivo := '';
    Facbr.WebServices.Envia(0, envioSincrono, False);
    result := True;
  except
    on e: exception do
    begin
      if e.Message = '' then
        e.Message := ' Erro interno ao connectar na sefaz';
      FcStat := Facbr.WebServices.Enviar.cstat;
      FxMotivo := e.Message;
      Fmsg := '[ERRO ENVIO]' + inttostr(FcStat) + ' - ' + e.Message;
      FretornoWS := e.Message;
      FmsgExcessao := tratarErro(e.Message);
      gravalog('      >>>' + getServiceID + ' ERRO ENVIO  Nº: ' +
        inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
        Fnota.cnpj + ' Erro : ' + e.Message, Fnota.cnpj);

    end;
  end;
  salvarArquivo();

  Fnota.dataProcessamento := now;
  FdhRecibo := now;
  Fnota.xmlRetorno := Facbr.WebServices.Enviar.RetornoWS;
  FcStat := Facbr.WebServices.Enviar.cstat;
  if Facbr.WebServices.Enviar.xmotivo <> '' then
    FxMotivo := Facbr.WebServices.Enviar.xmotivo;
  Fprotocolo := Facbr.WebServices.Enviar.protocolo;
  Frecibo := Facbr.WebServices.Enviar.Recibo;
  if Facbr.WebServices.Retorno.xMsg <> '' then
    Fmsg := Facbr.WebServices.Retorno.xMsg;
  if Facbr.WebServices.Retorno.RetornoWS <> '' then
    Fmsg := Facbr.WebServices.Retorno.RetornoWS;
  if Facbr.WebServices.Retorno.cstat > 0 then
    FcStat := Facbr.WebServices.Retorno.cstat;
  if Facbr.WebServices.Retorno.RetWS <> '' then
    FRetWS := Facbr.WebServices.Retorno.RetWS;
  if Facbr.WebServices.Retorno.xmotivo <> '' then
    FxMotivo := Facbr.WebServices.Retorno.xmotivo;
  Frecibo := Facbr.WebServices.Retorno.Recibo;

  gravalog('      >>>' + getServiceID + ' resultado envio sefaz  Nº: ' +
    inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
    Fnota.cnpj + ' : Motivo ' + FxMotivo, Fnota.cnpj);
  setRetornoWSAcbr();
  if pos(UpperCase('Falha na validação dos dados da nota'),
    UpperCase(FxMotivo)) > 0 then
  begin
    FcStat := 999;
    try
      Fnota.xml := Facbr.NotasFiscais[0].xml;
      Facbr.NotasFiscais[0].GravarXML('notaerro.xml',
        ExtractFilePath(GetModuleName(HInstance)));
    except
    end;
  end;
  Fnota.status := FcStat;
  Fnota.motivo := FxMotivo;
  FsucessoEnvio := FcStat > 0;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.limpaVariaveisNFE;
begin
  Fprotocolo := '';
  FcStat := 0;
  FxMotivo := '';
  FdhRecibo := now;
  Frecibo := '';
  FchaveNFe := '';
  FretornoWS := '';
  Fmsg := '';
  FRetWS := '';
  FsucessoEnvio := False;
  FmsgExcessao := '';
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setDadosConsulta();
begin
  with Facbr.WebServices.Consulta do
  begin
    if protocolo <> '' then
      Fprotocolo := protocolo;
    FcStat := cstat;
    if xmotivo <> '' then
      FxMotivo := xmotivo;
    FdhRecibo := DhRecbto;
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.setDadosRetorno();

begin
  with Facbr.WebServices.Retorno do
  begin
    if protocolo <> '' then
      Fprotocolo := protocolo;
    if (cstat > 0) then
      FcStat := cstat;
    if xmotivo <> '' then
      FxMotivo := xmotivo;
    FdhRecibo := now;
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.preparaEnvioSefaz();
begin

  try
    if Fnota.modelo = '65' then
      envioSincrono := True
    else
      envioSincrono := False;

    limpaVariaveisNFE();
    if executarEnvioSefaz() then
    begin
      FsucessoEnvio := True;
      FmsgExcessao := '';
      if not envioSincrono then
      begin
        if (FchaveNFe) <> '' then
        begin
          gravalog('    >>' + getServiceID + ' Consultando sefaz   Nº: ' +
            inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) +
            ' Cnpj ' + Fnota.cnpj, Fnota.cnpj);
          Facbr.WebServices.Consulta.NFeChave := FchaveNFe;
          Facbr.WebServices.Consulta.Executar;
          setDadosConsulta();
        end;
      end
      else
      begin
        setDadosRetorno();
      end;
      if (FcStat = 100) or (FcStat = 150) then
      begin
        setNotaValidada();

      end
      else
      begin
        verificarDuplicidade();

      end;
    end
    else
    begin
      setDadosRetorno();
      verificarDuplicidade();

    end;
  Except
    on e: exception do
    begin
      FmsgExcessao := e.Message;

    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TNfeValidar.processarValidacao;
var

  Tentativas: Integer;
begin
  if envioContigencia then
  begin
    Facbr.NotasFiscais.Clear;
    Facbr.NotasFiscais.LoadFromString(FxmlAnterior);

    Facbr.Configuracoes.Geral.FormaEmissao := situacaoToTipoEmissao;
    if Fnota.modelo = '65' then
      Facbr.Configuracoes.Geral.ModeloDF := moNFCe
    else
      Facbr.Configuracoes.Geral.ModeloDF := moNFe;
    Facbr.Configuracoes.WebServices.ambiente := Facbr.NotasFiscais[0]
      .nfe.Ide.tpAmb;
    FchaveNFe := OnlyNumber(Facbr.NotasFiscais[0].nfe.infNFe.ID);
    preparaEnvioSefaz();
    exit;
  end;
  Tentativas := 0;
  FcStat := 0;
  setTpEmiss(teNormal);
  // ENQUANTO NÃO CUMUNICAR COM A SEFAZ TENTAR ENVIAR
  while not FsucessoEnvio do
  begin
    inc(Tentativas);
    // APOS TERCEIRA TENTATIVA ENVIAR EM CONTIGENCIA O MODELO 55
    if Tentativas > 3 then
    begin
      gravalog(getServiceID +
        ' <<ATENÇAO ENVIANDO EM CONTIGENCIA APOS 3 TENTATIVAS >>Nº: ' +
        inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
        Fnota.cnpj + ' Tentativa: ' + inttostr(Tentativas), Fnota.cnpj);
      if Fnota.modelo = '55' then
      begin
        setTpEmiss(teContingencia);
      end
      else
      begin
        setTpEmiss(teOffLine);
        FsucessoEnvio := True;
        Fnota.situacao := 'OFFL';
        Fnota.chave := FchaveNFe;
        FxmlAnterior := Facbr.NotasFiscais[0].XMLAssinado;
        Facbr.NotasFiscais.Clear;
        Facbr.NotasFiscais.LoadFromString(FxmlAnterior);
        Fmsg := '';
        FcStat := 100;
        FxMotivo := 'Nfce emitida em modo Ofline';
        danfeBase64 := gerarDanfeBase64;
        setNotaValidada();
        Fnota.situacao := 'OFFL';
        exit;
      end;
    end;
    // APOS SEXTA TENTATIVA TENTA ENVIAR FSDA OU OFFLINE PARA NFCE
    if Tentativas > 6 then
    begin

      if Fempresa.usafsda = 'S' then
      begin
        Fnota.situacao := 'FSDA';
        setTpEmiss(teFSDA);
        gravalog('    >>' + getServiceID +
          ' << ATENÇAO ENVIANDO FSD APOS 6 TENTATIVAS >> Nº ' +
          inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj '
          + Fnota.cnpj + ' Tentativa: ' + inttostr(Tentativas), Fnota.cnpj);
        FsucessoEnvio := True;
        FxmlAnterior := Facbr.NotasFiscais[0].XMLAssinado;
        Facbr.NotasFiscais.Clear;
        Facbr.NotasFiscais.LoadFromString(FxmlAnterior);
        Fmsg := '';
        FcStat := 100;
        danfeBase64 := gerarDanfeBase64;
        setNotaValidada();
        Fnota.Fsda := True;
        FxMotivo := 'Nota(s) emitida em modo FSDA ';
        Fnota.situacao := 'FSDA';
        exit;
      end;
    end;
    // APOS SETIMA TENTATIVA ENVIAR SAIR
    if Tentativas > 7 then
    begin
      gravalog('    >>' + 'Tentativa : ' + inttostr(Tentativas) + #13#10 +
        '<< ATENCAO ENVIO ABORTADO APOS 7 TENTATIVAS>> ' + FmsgExcessao,
        Fnota.cnpj);
      FcStat := 999;
      FxMotivo := FmsgExcessao;
      exit;
    end;
    // FAZER O ENVIO
    if not FsucessoEnvio then
    begin
      gravalog('    >>' + getServiceID + '  envio sefaz Nº: ' +
        inttostr(Fnota.numero) + ' Serie: ' + inttostr(Fnota.serie) + ' Cnpj ' +
        Fnota.cnpj + ' Tentativa: ' + inttostr(Tentativas), Fnota.cnpj);
      preparaEnvioSefaz();
      if (not FsucessoEnvio) and (FcStat = 0) then
      begin
        sleep(300);
      end;
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
end.
