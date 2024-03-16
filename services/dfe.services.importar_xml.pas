unit dfe.services.importar_xml;

interface

uses
  windows,
  dfe.dao.importacao,
  dfe.dao.base,
  dfe.model.empresa,
  dfe.dao.empresa,
  dfe.lib.util,
  system.SysUtils,
  classes,
  {ACBR}
  ACBrECFVirtual,
  pcnAuxiliar,
  ACBrECFVirtualBuffer,
  ACBrECFVirtualNFCe,
  ACBrMail,
  ACBrDANFCeFortesFr,
  ACBrNFeDANFeRLClass,
  ACBrDANFCeFortesFrA4,
  ACBrMDFeDAMDFeClass,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  pcnConversaoNFe,
  ACBrNFe,

  ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS,
  ACBrPosPrinter,
  ACBrMDFe,
  ACBrDFe,
  ACBrBase,
  ACBrMDFeDAMDFeRLClass,
  ACBrECFVirtualPrinter,
  pcnConversao,
  ACBrSMSClass,
  ACBrSMS,
  ACBrNFeWebServices,
  pcnNFe,
  ACBrNFeNotasFiscais,
  ACBrDFeSSL,
  pcnRetConsSitNFe,
  pcnRetEnvEventoNFe,
  pcnEventoNFe,
  pcnNFeRTXT,
  RLPreviewForm,
  data.db,
  {firedac}
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Stan.Intf;

type
  TGbImportadorClass = class
  Private

    FNomeArquivo: string;
    FCnpjLoja: string;
    FCodigoLoja: string;
    FDaoEmpresa: TDaoEmpresa;
    FDaoImportacao: TDaoImportacao;
    LTotItens: Currency;
    LTotFat: Currency;
    LTotNot: Currency;
    LObs: string;
    ImportarNota: Boolean;
    FGbNFe: TAcbrNfe;
    FEmpresaModel: TEmpresa;
    FNota: TNfe;
    procedure CarregarXml();
    procedure DoLog(msg: string);
    procedure ValidarImportacao();
    procedure SetObservacoes();
  public
    procedure Importar();
    constructor create(Arquivo, CodigoLoja: String);
    destructor destroy; override;
  end;

implementation

{ ------------------------------------------------------------------------------ }
procedure TGbImportadorClass.CarregarXml();
var
  NFeRTXT: TNFeRTXT;
begin
  FGbNFe.NotasFiscais.Clear;
  FGbNFe.NotasFiscais.Add;
  NFeRTXT := TNFeRTXT.create(FGbNFe.NotasFiscais.Items[0].NFe);
  NFeRTXT.CarregarArquivo(FNomeArquivo);
  if NFeRTXT.LerTxt then
  begin
    NFeRTXT.Free;
  end
  else
  begin
    NFeRTXT.Free;
    FGbNFe.NotasFiscais.Clear;
    try
      FGbNFe.NotasFiscais.LoadFromFile(FNomeArquivo);
    except
      on e: exception do
      begin
        gravalog('[ImportacaoXML] ' + FCnpjLoja + ' falha ao carregar arquivo '
          + FNomeArquivo + ' - ' + e.Message, FCnpjLoja);
      end;
    end;
  end;

  if FGbNFe.NotasFiscais.Count = 0 then
  begin
    gravalog('[ImportacaoXML] ' + FCnpjLoja +
      ' NENHUMA NOTA FOI CARREGADA PRA IMPORTACAO', FCnpjLoja);
    exit
  end;

  FNota := FGbNFe.NotasFiscais.Items[0].NFe;
end;

{ ------------------------------------------------------------------------------ }
constructor TGbImportadorClass.create(Arquivo, CodigoLoja: String);
begin

  FDaoEmpresa := TDaoEmpresa.create;
  FDaoImportacao := TDaoImportacao.create;
  FCnpjLoja := FDaoEmpresa.getEmpresa(CodigoLoja).Cnpj;
  FCodigoLoja := CodigoLoja;
  FDaoImportacao.CodigoLoja := CodigoLoja;
  FDaoImportacao.Cnpj := FCnpjLoja;
  FGbNFe := TAcbrNfe.create(Nil);
  FNomeArquivo := Arquivo;

end;

{ ------------------------------------------------------------------------------ }
procedure TGbImportadorClass.DoLog(msg: string);
begin
  gravalog(msg, FCnpjLoja);
end;

{ ------------------------------------------------------------------------------ }
destructor TGbImportadorClass.destroy;
begin
  inherited;
end;

{ ------------------------------------------------------------------------------ }
procedure TGbImportadorClass.Importar();
var
  I, l: Integer;
  LResultMessage: string;
begin
  try
    try
      CarregarXml();
      ValidarImportacao();
      SetObservacoes();
      FDaoImportacao.ExcluirImportacao(FNota);
      FDaoImportacao.GravaCabecalhoNota(FNota);
      for I := 0 to FNota.Det.Count - 1 do
      begin
        FDaoImportacao.GravarItemNota(FNota, I);
        FDaoImportacao.ExcluirOrigemCombustivelItem(FNota, I);
        for l := 0 to pred(FNota.Det.Items[I].Prod.comb.origComb.Count) do
        begin
          FDaoImportacao.GravarOrigemCombustiveis(FNota, I, l);
        end;
        for l := 0 to FNota.Det.Items[I].Prod.rastro.Count - 1 do
        begin
          FDaoImportacao.GravarRastro(FNota, I, l);
        end;
      end;
      FDaoImportacao.GravarArquivoXmlDb(FNota, FNomeArquivo);
      FDaoImportacao.GravarFaturas(FNota);
      LResultMessage := 'ImportacaoXML] loja ' + FCodigoLoja + ' A nota  ' +
        FNota.infNFe.id + ' Foi importada';
      DoLog(LResultMessage);
      SendMessageServer(LResultMessage, '');
    except
      on e: exception do
      begin
        DoLog('ImportacaoXML]1092 loja ' + FCodigoLoja +
          ' Erro ao importar nota ' + e.Message);
        FDaoImportacao.ExcluirImportacao(FNota);
      end;
    end;
  finally
    try
      DeleteInfoDashBoard;
    except
    end;
    FreeAndNil(FGbNFe);
    FreeAndNil(FDaoEmpresa);
    FreeAndNil(FEmpresaModel);
    FreeAndNil(FDaoImportacao);
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure TGbImportadorClass.SetObservacoes;
var
  I: Integer;
begin
  for I := 0 to FNota.InfAdic.obsCont.Count - 1 do
  begin
    with FNota.InfAdic.obsCont.Items[I] do
    begin
      LObs := (Trim(xCampo) + Trim(xTexto));
    end;
  end;
  for I := 0 to FNota.InfAdic.obsFisco.Count - 1 do
  begin
    with FNota.InfAdic.obsFisco.Items[I] do
    begin
      LObs := (LObs + Trim(xCampo) + Trim(xTexto));
    end;
  end;
  LObs := (LObs + Trim(FNota.InfAdic.infCpl) + Trim(FNota.InfAdic.infAdFisco));
  FDaoImportacao.Observacoes := LObs;
end;

{ ------------------------------------------------------------------------------ }
procedure TGbImportadorClass.ValidarImportacao;
var
  I: Integer;
begin
  LTotNot := (FNota.Total.ICMSTot.vNF + FNota.Total.ICMSTot.vDesc +
    FNota.Total.ICMSTot.vOutro); // Guarda o valor total da nota
  for I := 0 to FNota.Det.Count - 1 do
  begin
    LTotItens := (LTotItens + FNota.Det.Items[I].Prod.vProd);
  end;

  for I := 0 to FNota.Cobr.Dup.Count - 1 do
  begin
    LTotFat := (LTotFat + FNota.Cobr.Dup.Items[I].vDup);
  end;
  try
    if assigned(FEmpresaModel) then
      FreeAndNil(FEmpresaModel);
  except
  end;
  FEmpresaModel := FDaoEmpresa.getEmpresaCnpj(FNota.Dest.CNPJCPF);
  if (FNota.Dest.CNPJCPF = FEmpresaModel.Cnpj) then
  begin
    ImportarNota := True
  end
  else
  begin
    ImportarNota := false;
    raise exception.create('[ImportacaoXML] ' + FCodigoLoja + ' A NOTA ' +
      FGbNFe.NotasFiscais[0].NFe.infNFe.id +
      ' NÃO SERA IMPORTADA POIS O DESTINATARIO ( ' + FNota.Dest.CNPJCPF +
      ' ) E DIFERENTE DA LOJA ' + FEmpresaModel.Cnpj);

  end;
  if not ImportarNota then
  begin

    DoLog('[Importacao] loja ' + FCodigoLoja + ' A NOTA ' + FGbNFe.NotasFiscais
      [0].NFe.infNFe.id + ' NÃO SERA IMPORTADA ');
    exit;
  end;
end;

{ ------------------------------------------------------------------------------ }
end.
